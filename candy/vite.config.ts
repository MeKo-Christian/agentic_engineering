import { defineConfig } from "vite";

export default defineConfig({
  base: "/ai-workshop/candy/",
  server: {
    host: true,
    port: 5173,
  },
});
