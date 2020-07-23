# https://hub.docker.com/_/nginx/
FROM nginx:1.19.1-alpine

RUN apk add --no-cache bash bash-completion \
 && mkdir /etc/nginx/ruuuby \
 && mkdir /etc/nginx/ruuuby/caching \
 && mkdir /etc/nginx/ruuuby/gzip \
 && mkdir /etc/nginx/ruuuby/unsorted \
 && rm /etc/nginx/conf.d/default.conf;

COPY ./services/nginx/includes/caching /etc/nginx/ruuuby/caching
COPY ./services/nginx/includes/gzip /etc/nginx/ruuuby/gzip
COPY ./services/nginx/includes/unsorted /etc/nginx/ruuuby/unsorted

CMD ["nginx", "-g", "daemon off;"]
