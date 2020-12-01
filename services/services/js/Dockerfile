FROM alpine_general:latest as js_stage_base

RUN apk update && apk upgrade && apk add --update --no-cache \
  nodejs nodejs-npm gzip alpine-sdk coreutils

CMD ["true"]

FROM alpine_debugging:latest as js_stage_debugging

RUN apk update && apk upgrade && apk add --update --no-cache \
  nodejs nodejs-npm gzip alpine-sdk coreutils

CMD ["true"]
