// @ts-check
import { defineConfig } from "astro/config";

import tailwindcss from "@tailwindcss/vite";

import favicons from "astro-favicons";

// https://astro.build/config
export default defineConfig({
  site: "https://bt-woodstudio.com",
  redirects: {
    "/b2b/kontakt": { destination: "/b2b/contact", status: 301 },
    "/b2b/montaz": { destination: "/b2b/assembly", status: 301 },
    "/b2b/partnerzy": { destination: "/b2b/partners", status: 301 },
    "/b2b/projekty": { destination: "/b2b/projects", status: 301 },
    "/b2b/realizacje": { destination: "/b2b/portfolio", status: 301 },
    "/b2b/uslugi": { destination: "/b2b/services", status: 301 },
  },
  vite: {
    plugins: [tailwindcss()],
  },

  integrations: [favicons()],
});
