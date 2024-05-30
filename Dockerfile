# In this example, Docker will install dependencies and build the application.
# But, alternatively, you might just copy the built files and skip this first part.

FROM node:lts AS build
WORKDIR /app

COPY . ./

RUN npm install
RUN npm run build

RUN ls

FROM nginx:stable

COPY --from=build ./app/dist /usr/share/nginx/html
COPY --from=build ./app/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

# runs NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]