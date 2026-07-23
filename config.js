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
    "¡Hola! ¿Cómo estás? Te escribimos desde Kuyén para agradecerte por haber realizado un pedido en nuestra Tienda Online durante los últimos 30 días 😁\n" +
    "Queremos asegurarnos que hayas recibido todo en las mejores condiciones y hayas disfrutado tu pedido. ¿Nos ayudás con una rápida valoración? Cualquier comentario nos ayuda a seguir mejorando:\n" +
    "{link}\n" +
    "Muchas gracias por acompañarnos 🧡",
};
