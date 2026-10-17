import type { APIRoute } from "astro";
import { site } from "../config/site";

const pages = [
  "/",
  "/i/",
  "/b2b/",
  "/b2b/uslugi/",
  "/b2b/montaz/",
  "/b2b/projekty/",
  "/b2b/realizacje/",
  "/b2b/partnerzy/",
  "/b2b/kontakt/",
];

export const GET: APIRoute = () => {
  const urls = pages
    .map((path) => `<url><loc>${new URL(path, site.url)}</loc></url>`)
    .join("");

  return new Response(
    `<?xml version="1.0" encoding="UTF-8"?><urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">${urls}</urlset>`,
    { headers: { "Content-Type": "application/xml" } },
  );
};
