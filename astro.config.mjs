// @ts-check
import { defineConfig } from "astro/config";

import tailwindcss from "@tailwindcss/vite";

import favicons from "astro-favicons";

// https://astro.build/config
export default defineConfig({
  site: "https://bt-woodstudio.com",
  vite: {
    plugins: [tailwindcss()],
  },

  integrations: [favicons()],
});
