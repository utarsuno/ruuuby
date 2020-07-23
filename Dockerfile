# for latest tags, see following links:
#  * https://hub.docker.com/_/alpine
#  * https://hub.docker.com/_/ruby
#
# | relating resources                                                                                              |
# | --------------------------------------------------------------------------------------------------------------- |
# | https://github.com/didlich/docker-alpine-rbenv/blob/master/Dockerfile                                            |
# | https://github.com/docker-library/ruby/blob/8e49e25b591d4cfa6324b6dada4f16629a1e51ce/2.7/alpine3.12/Dockerfile   |
# | https://github.com/andrius/alpine-ruby/blob/master/Dockerfile-3.9                                                |
# | https://github.com/rbenv/ruby-build                                                                             |
FROM alpine:3.12

# -------------------------------------------- ⚠️ --------------------------------------------

# | library    | short description                                   | resource link                                                 |
# | ---------- | --------------------------------------------------- | ------------------------------------------------------------- |
# | gmp        | arbitrary precision arithmetic                      | https://pkgs.alpinelinux.org/package/edge/main/x86/gmp-dev    |
# | readline   | GNU readline, allows editing cmds while typing them | https://pkgs.alpinelinux.org/package/edge/main/x86/readline   |
# | build-base | meta package                                        | https://pkgs.alpinelinux.org/package/v3.3/main/x86/build-base |
# | openssl    | utils for TLS (Transport Layer Security)            | https://pkgs.alpinelinux.org/package/edge/main/x86/openssl    |
# | zlib       | utls for compression/decompression                  | https://pkgs.alpinelinux.org/package/edge/main/x86/zlib       |
# | clang      | "a C language family front-end for LLVM"            | https://pkgs.alpinelinux.org/package/edge/main/x86/clang      |
# | cmake      | open-source make system                             | https://pkgs.alpinelinux.org/package/edge/main/x86/cmake      |
# | sqlite     | lib support for DB: `SQLite3`                       | https://pkgs.alpinelinux.org/package/edge/main/x86/sqlite     |
# | postgresql | lib support for DB: `postgreSQL`                    | https://pkgs.alpinelinux.org/package/edge/main/x86/postgresql |
# | musl       | "the muscl c library (libc) implementation"         | https://pkgs.alpinelinux.org/package/edge/main/x86/musl       |

RUN apk add --no-cache gmp-dev

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_MESSAGES en_US.UTF-8

ENV BUILD_CORE_LIBS bash bash-completion git wget curl vim build-base readline readline-dev openssl-dev zlib-dev

# TODO: clean up consistency, just use bitwise flags
ENV BUNDLE_SILENCE_ROOT_WARNING=1
ENV RUUUBY_F01 "b01|b03|b04{debug}"
ENV RUUUBY_F12 "b00"
ENV RUUUBY_F26 "b00"
ENV RUUUBY_F98 "11"
ENV PATH_CLEAN_LOCAL "~/../ruuuby/bin/manually_execute/clean_up"
ENV RUUUBY_OS_CURRENT "linux"

# TODO: try with and without: ccache ccache-doc
ENV BUILD_COMPILERS clang clang-dev musl-dev gcc cmake make
ENV BUILD_DBS sqlite sqlite-dev postgresql postgresql-dev libpq
ENV BUILD_LINUX_CORE linux-headers imagemagick-dev
#libffi-dev

ENV CC "clang"
ENV CXX "clang++"
ENV ARCHFLAGS "-arch x86_64"

RUN apk add --update $BUILD_CORE_LIBS && rm -rf /var/cache/apk/*

# rbenv
ENV PATH /usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH
ENV RBENV_ROOT /usr/local/rbenv
ENV RUBY_VERSION 2.7.1
ENV CONFIGURE_OPTS --disable-install-doc

RUN apk update && apk upgrade && \
    apk add --update $BUILD_LINUX_CORE && \
    apk add $BUILD_COMPILERS && \
    apk add $BUILD_DBS && \
    rm -rf /var/cache/apk/*

RUN git clone --depth 1 git://github.com/sstephenson/rbenv.git ${RBENV_ROOT} \
 && git clone --depth 1 https://github.com/sstephenson/ruby-build.git ${RBENV_ROOT}/plugins/ruby-build \
 && set -x CC clang && ${RBENV_ROOT}/plugins/ruby-build/install.sh -v

RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

RUN set -x CC clang && \
    rbenv install $RUBY_VERSION && \
    rbenv global $RUBY_VERSION && \
    gem update --system 3.2.0.rc.1 && \
    gem install bundler:2.2.0.rc.1 && \
    mkdir /ruuuby && \
    rm -rf /var/cache/apk/*

COPY . /ruuuby
WORKDIR /ruuuby

RUN bundle install --quiet
RUN ./bin/compilation_modes/build_w_debugging

#CMD ["irb"]
CMD ["ruby", "-v"]

# -------------------------------------------- ⚠️ --------------------------------------------
