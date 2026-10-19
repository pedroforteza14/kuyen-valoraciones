# Kuyen · Puesta en marcha (paso a paso)

Son 3 pasos: **Supabase** (la base), **config** (2 datos) y **Vercel** (publicar).
Acceso al panel: el usuario que crees en el paso 1. **No anotes la contraseña en este archivo.**

---

## PASO 1 — Supabase (la base de datos)

1. Entrá a **supabase.com** → tu proyecto (o creá uno nuevo, plan free).
2. Menú izquierdo → **SQL Editor** → **New query** → pegá TODO el contenido del archivo
   **`supabase-setup.sql`** → botón **Run**. (Crea las tablas y la seguridad.)
3. Menú izquierdo → **Authentication** → **Users** → **Add user** → **Create new user**:
   - Email: `admin@kuyen.com`
   - Password: una contraseña segura (guardala en un gestor, no acá)
   - Tildá **Auto Confirm User** ✅ → **Create user**
4. Menú izquierdo → **Project Settings** (el engranaje) → **API**. Copiá:
   - **Project URL** (ej: `https://abcd.supabase.co`)
   - **anon public** (una clave larga)

---

## PASO 2 — Pegar los 2 datos en `config.js`

Abrí el archivo **`config.js`** y completá:

```js
SUPABASE_URL: "https://abcd.supabase.co",   // ← tu Project URL
SUPABASE_ANON_KEY: "eyJhbGciOi...",          // ← tu anon public
```

Guardá. (El link de Google ya está cargado.)

---

## PASO 3 — Publicar en Vercel

**Opción rápida (recomendada), desde la terminal, parado en esta carpeta:**

```bash
npx vercel --prod
```

- La primera vez te pide loguearte (se abre el navegador → entrás con tu cuenta de Vercel).
- Aceptá las opciones por defecto (Enter en todo).
- Al final te da la URL, tipo `https://kuyen-valoraciones.vercel.app`.

> Si te pregunta framework, elegí **Other** (es un sitio estático).

**Opción con GitHub (para que se actualice solo a futuro):** subí esta carpeta a un repo
de GitHub y en **vercel.com → Add New → Project → Import** elegís el repo → **Deploy**.

---

## PASO 4 — Probar que anda

- **Panel:** abrí `https://tu-sitio.vercel.app/panel` → entrá con `admin@kuyen.com` y su contraseña.
- **Cliente:** desde el panel, cargá tu propio celu y mandate el WhatsApp → tocá el link →
  probá 5 estrellas (te lleva a Google) y 2 estrellas (dejá un comentario).
- Volvé al panel: la reseña negativa tiene que aparecer en **"Reseñas negativas"** (en vivo),
  y el envío en **"Historial de envíos"**.

Cualquier cosa que no funcione, avisame con el detalle y lo resolvemos.
