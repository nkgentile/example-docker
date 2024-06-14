FROM nginx:stable

WORKDIR /app

# Copy static files from `sanity build`
COPY ./dist /usr/share/nginx/html

# Copy NGINX configuration
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

# runs NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]