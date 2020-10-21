#  __        __   ___     __               __
# |__)  /\  /__` |__     |__) |  | | |    |  \
# |__) /~~\ .__/ |___    |__) \__/ | |___ |__/
#
FROM nginx:1.19.1-alpine as build_base

RUN apk add --no-cache curl wget \
 && mkdir /etc/nginx/ruuuby \
 && mkdir /etc/nginx/ruuuby/caching \
 && mkdir /etc/nginx/ruuuby/gzip \
 && mkdir /etc/nginx/ruuuby/unsorted \
 && rm /etc/nginx/conf.d/default.conf \
 && rm -rf /var/cache/apk/*

ENV SERVICE_NAME="service_nginx"
ENV SERVICE_OS="alpine"
ENV SERVICE_OS_VERSION="3.11.6"

COPY ./includes/ /etc/nginx/ruuuby/
COPY ./ruuuby.nginx /etc/nginx/nginx.conf

#  ___                __   __   __   __
# |__  |\ | \  / .   |__) |__) /  \ |  \
# |___ | \|  \/  .   |    |  \ \__/ |__/
#

FROM build_base as build_env_prod
ENV BUILD_ENV=prod

CMD ["nginx", "-g", "daemon off;"]

#  ___                __   ___
# |__  |\ | \  / .   |  \ |__  \  /
# |___ | \|  \/  .   |__/ |___  \/
#

FROM build_base as build_env_dev
ENV BUILD_ENV=dev

RUN apk add --update --no-cache git zsh vim dpkg \
 && sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" \
 && sed -i '1d' /etc/passwd \
 && (echo "root:x:0:0:root:/root:/bin/zsh" && cat /etc/passwd) > /etc/passwd_parsed && mv /etc/passwd_parsed /etc/passwd \
 && echo "alias cd_data='cd /v/'" >> /root/.zshrc \
 && echo "alias ll='ls -larti'" >> /root/.zshrc \
 && rm -rf /var/cache/apk/*

CMD ["nginx", "-g", "daemon off;"]

#  _ __    __    ____    ___   __  __  _ __   ___     __    ____
# /\`'__\/'__`\ /',__\  / __`\/\ \/\ \/\`'__\/'___\ /'__`\ /',__\
# \ \ \//\  __//\__, `\/\ \L\ \ \ \_\ \ \ \//\ \__//\  __//\__, `\
#  \ \_\\ \____\/\____/\ \____/\ \____/\ \_\\ \____\ \____\/\____/
#   \/_/ \/____/\/___/  \/___/  \/___/  \/_/ \/____/\/____/\/___/

# https://stackoverflow.com/questions/44757369/how-to-show-local-time-instead-of-universal-time-in-nginx-http-date-parameter
# TODO: https://github.com/nginxinc/docker-nginx/blob/8921999083def7ba43a06fabd5f80e4406651353/mainline/jessie/Dockerfile#L21-L23
# TODO: https://docs.docker.com/config/containers/logging/
