import { defineCliConfig } from "sanity/cli";

export default defineCliConfig({
  api: {
    projectId: process.env.SANITY_STUDIO_PROJECT_ID,
    dataset: process.env.SANITY_STUDIO_DATASET,
  },

  vite(config, { mode }) {
    if (!process.env.SANITY_STUDIO_DATASET) {
      throw new Error("Missing SANITY_STUDIO_DATASET in environment");
    }

    const dataset =
      mode === "development"
        ? `'${process.env.SANITY_STUDIO_DATASET}'`
        : "__DATASET__";

    return {
      ...config,
      define: {
        ...config.define,
        __DATASET__: dataset,
      },
    };
  },
});
