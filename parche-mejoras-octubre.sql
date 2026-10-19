-- ============================================================
--  KUYEN · Parche de mejoras (octubre 2026)
--  Pegá TODO esto en Supabase → SQL Editor → Run.
--  Se puede correr más de una vez sin romper nada.
-- ============================================================

-- 1) Guardar TODAS las estrellas (también 1, 2 y 3) y saber quién fue a Google.
--    "visita" agrupa los toques de una misma persona en la página:
--    si cambia de 2★ a 4★, cuenta solo la última.
alter table public.valoraciones      add column if not exists visita uuid;
alter table public.valoraciones      add column if not exists fue_a_google boolean not null default false;
alter table public.resenas_negativas add column if not exists visita uuid;
create index if not exists valoraciones_visita_idx on public.valoraciones (visita);

-- El cliente (anónimo) puede dejar cualquier puntaje de 1 a 5 (antes solo se guardaban 4 y 5).
drop policy if exists "anon inserta valoraciones 1 a 5" on public.valoraciones;
create policy "anon inserta valoraciones 1 a 5"
  on public.valoraciones for insert to anon
  with check (estrellas between 1 and 5 and local_id is not null);

-- El staff puede borrar valoraciones de su local (cuando elimina una negativa de prueba,
-- se va también su estrella del promedio).
drop policy if exists "staff borra valoraciones de su local" on public.valoraciones;
create policy "staff borra valoraciones de su local"
  on public.valoraciones for delete to authenticated
  using (local_id in (select local_id from public.perfiles where user_id = auth.uid()));

-- 2) Lista de clientes en la base (antes vivía solo en el navegador de quien la subía).
--    El tipo de local_id se copia del id de locales para que la relación siempre coincida.
do $$
declare tipo text;
begin
  select format_type(a.atttypid, a.atttypmod) into tipo
  from pg_attribute a
  where a.attrelid = 'public.locales'::regclass and a.attname = 'id';

  execute format($f$
    create table if not exists public.clientes (
      id             uuid primary key default gen_random_uuid(),
      local_id       %s not null references public.locales(id) on delete cascade,
      nombre         text,
      telefono       text not null,
      creado_at      timestamptz not null default now(),
      actualizado_at timestamptz not null default now(),
      unique (local_id, telefono)
    )$f$, tipo);
end $$;

alter table public.clientes enable row level security;
grant select, insert, update, delete on public.clientes to authenticated;

-- Cada usuario ve y edita solo los clientes de su local.
drop policy if exists "staff maneja clientes de su local" on public.clientes;
create policy "staff maneja clientes de su local"
  on public.clientes for all to authenticated
  using      (local_id in (select local_id from public.perfiles where user_id = auth.uid()))
  with check (local_id in (select local_id from public.perfiles where user_id = auth.uid()));

-- 3) Tiempo real de valoraciones (por si no estaba activado).
do $$
begin
  if not exists (select 1 from pg_publication_tables
                 where pubname = 'supabase_realtime' and schemaname = 'public' and tablename = 'valoraciones') then
    alter publication supabase_realtime add table public.valoraciones;
  end if;
end $$;

-- 4) Chequeo: tienen que salir las 4 filas en "true".
select 'valoraciones.visita' as que,
       exists (select 1 from information_schema.columns where table_schema = 'public' and table_name = 'valoraciones' and column_name = 'visita') as ok
union all
select 'valoraciones.fue_a_google',
       exists (select 1 from information_schema.columns where table_schema = 'public' and table_name = 'valoraciones' and column_name = 'fue_a_google')
union all
select 'resenas_negativas.visita',
       exists (select 1 from information_schema.columns where table_schema = 'public' and table_name = 'resenas_negativas' and column_name = 'visita')
union all
select 'tabla clientes',
       exists (select 1 from information_schema.tables where table_schema = 'public' and table_name = 'clientes');
