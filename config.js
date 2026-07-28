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
    "¡Hola! ¿Cómo estás? 🧡 Te escribimos desde Kuyén para agradecerte por tu pedido en nuestra Tienda Online 😊\n" +
    "Somos un emprendimiento y cada valoración nos ayuda MUCHÍSIMO a seguir creciendo. ¿Nos regalás 10 segundos para dejarnos tu opinión? Es un solo click 👇\n" +
    "{link}\n" +
    "¡Mil gracias por bancarnos! 🍩",
};
