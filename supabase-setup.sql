-- ============================================================
--  KUYEN · Setup de la base de datos
--  Pegá TODO esto en Supabase → SQL Editor → Run
-- ============================================================

-- 1) Tabla de envíos (historial de valoraciones pedidas por el staff)
create table if not exists envios (
  id uuid primary key default gen_random_uuid(),
  telefono text not null,
  creado_at timestamptz not null default now()
);

-- 2) Tabla de reseñas negativas (las que deja el cliente en privado)
create table if not exists resenas_negativas (
  id uuid primary key default gen_random_uuid(),
  estrellas int,
  comentario text,
  contacto text,
  resuelto boolean not null default false,
  creado_at timestamptz not null default now()
);

-- 3) Activar seguridad por filas (RLS)
alter table envios enable row level security;
alter table resenas_negativas enable row level security;

-- 4) Políticas
-- El cliente (anónimo) SOLO puede dejar una reseña negativa. Nada más.
create policy "anon inserta negativas"
  on resenas_negativas for insert to anon with check (true);

-- El staff logueado puede leer y marcar como resueltas las negativas.
create policy "staff lee negativas"
  on resenas_negativas for select to authenticated using (true);
create policy "staff actualiza negativas"
  on resenas_negativas for update to authenticated using (true);

-- El historial de envíos es solo para el staff logueado.
create policy "staff inserta envios"
  on envios for insert to authenticated with check (true);
create policy "staff lee envios"
  on envios for select to authenticated using (true);
create policy "staff borra envios"
  on envios for delete to authenticated using (true);

-- 5) Realtime (para que las negativas aparezcan en vivo en el panel)
alter publication supabase_realtime add table resenas_negativas;
alter publication supabase_realtime add table envios;
