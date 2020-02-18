# for latest tags, see following links:
#  * https://hub.docker.com/_/alpine
#  * https://hub.docker.com/_/ruby
FROM ruby:2.7.0-alpine3.11

# build-base needed for supporting C
ENV BUILD_PACKAGES bash ruby-dev build-base ruby ruby-io-console ruby-bundler

#ENV LANGUAGE=en_US.UTF-8 \
#    LC_ALL=en_US.UTF-8 \
#    LC_CTYPE=en_US.UTF-8 \
#    LC_COLLATE=en_US.UTF-8 \
#    LC_MESSAGES=en_US.UTF-8 \
#    LC_MONETARY=en_US.UTF-8 \
#    LC_NUMERIC=en_US.UTF-8 \
#    LC_TIME=en_US.UTF-8

ENV LANG=C.UTF-8

#LANG=en_US.UTF-8 \

ENV ENV="/etc/profile"

RUN apk update && apk upgrade && \
    apk add $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/*

# base structure from: https://blog.codeship.com/build-minimal-docker-container-ruby-apps/

RUN mkdir /usr/app
WORKDIR /usr/app

COPY Gemfile /usr/app/
COPY Gemfile.lock /usr/app/
COPY ruuuby.gemspec /usr/app/

RUN bundle install

COPY . /usr/app

CMD ["sleep", "100000000"]
