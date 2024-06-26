import { visionTool } from "@sanity/vision";
import { defineConfig } from "sanity";
import { structureTool } from "sanity/structure";

import { schemaTypes } from "./schemaTypes";

/**
 * __DATASET__ will be statically replaced by `vite`
 * @see `sanity.cli.ts`
 */
const dataset = __DATASET__;

if (dataset == null) {
  throw new Error("Missing dataset");
}

export default defineConfig({
  name: "default",
  title: "Noah's Sandbox",

  projectId: process.env.SANITY_STUDIO_PROJECT_ID!,
  dataset,

  plugins: [structureTool(), visionTool()],

  schema: {
    types: schemaTypes,
  },
});
