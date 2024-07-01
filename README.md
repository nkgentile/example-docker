# Example Studio Deployed to Docker

Sanity Studio is a single-page, React application that can be built and hosted as static files (HTML, CSS, JavaScript). This example Studio builds and serves the Studio inside a Docker container.

## Notable Files

- [**Dockerfile**](https://docs.docker.com/reference/dockerfile/)
- [**.dockerignore**](https://docs.docker.com/reference/dockerfile/#dockerignore-file)
- **nginx.conf**

## Usage

```sh
# Builds Studio and a Docker image
npm run build

# Serves the Studio from the container, locally at http://localhost:3333
npm run start
```

## Resources

Learn more in the [Hosting and deployment](https://www.sanity.io/docs/deployment) section of the documentation.

If you'd like to learn more about Sanity, you can do the following things:

- [Read “getting started” in the docs](https://www.sanity.io/docs/introduction/getting-started?utm_source=readme)
- [Join the community Slack](https://slack.sanity.io/?utm_source=readme)
- [Extend and build plugins](https://www.sanity.io/docs/content-studio/extending?utm_source=readme)
