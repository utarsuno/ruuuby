# @see https://hub.docker.com/_/alpine
FROM alpine:3.12.1 as alpine_base

ENV SERVICE_OS="alpine"
ENV SERVICE_OS_VERSION="3.12.1"

FROM alpine_base as alpine_general

RUN apk update && apk upgrade && apk add --update --no-cache \
    curl wget git

CMD ["true"]

FROM alpine_general as alpine_debugging

RUN apk add --update --no-cache \
    zsh vim dpkg mandoc man-pages

RUN apk add --update --no-cache git zsh vim dpkg \
 && sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" \
 && sed -i '1d' /etc/passwd \
 && (echo "root:x:0:0:root:/root:/bin/zsh" && cat /etc/passwd) > /etc/passwd_parsed && mv /etc/passwd_parsed /etc/passwd \
 && echo "alias ll='ls -larti'" >> /root/.zshrc \
 && rm -rf /var/cache/apk/*

CMD ["true"]
