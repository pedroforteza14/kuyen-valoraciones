/* ============================================================
   CONFIG DE KUYEN  ▸  Santi: completá estos 2 valores de Supabase
   (los sacás de Supabase → Project Settings → API)
   ============================================================ */
window.KUYEN = {
  // 1) URL del proyecto
  SUPABASE_URL: "https://mkcnpkrybdcgwtnnrmao.supabase.co",

  // 2) Clave pública (publishable) — segura de exponer, la protección está en las políticas (RLS)
  SUPABASE_ANON_KEY: "sb_publishable_EevmQ11nv4Oip_GZ6k9-yg_V-9MYLGP",

  // Link de reseñas de Google (ya cargado)
  GOOGLE_REVIEW_URL: "https://g.page/r/CaGAeTZIL71EEBM/review",

  // Datos del local
  BUSINESS_NAME: "Kuyen",
  TAGLINE: "Agronomía",

  // Mensaje de WhatsApp que manda el panel ({link} se reemplaza solo)
  WHATSAPP_TEMPLATE:
    "¡Hola! 🌿 Gracias por tu pedido en Kuyen.\n" +
    "¿Nos ayudás con una valoración rápida? Te lleva 10 segundos:\n{link}\n\n¡Gracias totales! 🙌",
};
