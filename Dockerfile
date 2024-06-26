FROM ubuntu:latest

# Install necessary tools
RUN apt-get update && apt-get install -y sed

FROM nginx:stable

WORKDIR /app

# Copy static files from `sanity build`
COPY ./dist /usr/share/nginx/html

# Copy NGINX configuration
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Copy and make script executable
COPY ./replace-environment-variables.sh ./
RUN chmod +x ./replace-environment-variables.sh

EXPOSE 80

# replaces environment variables and then runs NGINX in the foreground
CMD ./replace-environment-variables.sh && nginx -g 'daemon off;'