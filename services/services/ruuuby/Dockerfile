# | library    | short description                                   | resource link                                                 |
# | ---------- | --------------------------------------------------- | ------------------------------------------------------------- |
# | gmp        | arbitrary precision arithmetic                      | https://pkgs.alpinelinux.org/package/edge/main/x86/gmp-dev    |
# | readline   | GNU readline, allows editing cmds while typing them | https://pkgs.alpinelinux.org/package/edge/main/x86/readline   |
# | build-base | meta package                                        | https://pkgs.alpinelinux.org/package/v3.3/main/x86/build-base |
# | openssl    | utils for TLS (Transport Layer Security)            | https://pkgs.alpinelinux.org/package/edge/main/x86/openssl    |
# | zlib       | utils for compression/decompression                 | https://pkgs.alpinelinux.org/package/edge/main/x86/zlib       |
# | clang      | "a C language family front-end for LLVM"            | https://pkgs.alpinelinux.org/package/edge/main/x86/clang      |
# | cmake      | open-source make system                             | https://pkgs.alpinelinux.org/package/edge/main/x86/cmake      |
# | sqlite     | lib support for DB: `SQLite3`                       | https://pkgs.alpinelinux.org/package/edge/main/x86/sqlite     |
# | postgresql | lib support for DB: `postgreSQL`                    | https://pkgs.alpinelinux.org/package/edge/main/x86/postgresql |
# | musl       | "the muscl c library (libc) implementation"         | https://pkgs.alpinelinux.org/package/edge/main/x86/musl       |
# | dpkg       | "The Debian Package Manager"                        | https://pkgs.alpinelinux.org/package/edge/main/x86/dpkg       |

# -------------------------------------------- ⚠️ --------------------------------------------
# not currently utilized (in this version) and thus not currently tested
# -------------------------------------------- ⚠️ --------------------------------------------

FROM alpine_general:latest as ruuuby_base

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_MESSAGES en_US.UTF-8

ENV CC "clang"
ENV CXX "clang++"

#ENV ARCHFLAGS "-arch x86_64"
ENV ARCHFLAGS "-arch x86_64-linux-musl"

ENV GEM_VERSION "3.2.0.rc.2"
ENV BUNDLER_VERSION "2.2.0.rc.2"

# @see https://bundler.io/v1.16/bundle_config.html
ENV BUNDLE_SILENCE_ROOT_WARNING "1"
ENV BUNDLE_SPECIFIC_PLATFORM "x86_64-linux-musl"

# -----

ENV PATH /usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH
ENV RBENV_ROOT /usr/local/rbenv

# TODO: try with and without: ccache ccache-doc
ENV BUILD_COMPILERS clang clang-dev musl-dev gcc cmake make
ENV BUILD_LINUX_CORE linux-headers imagemagick-dev

ENV BUILD_CORE_LIBS git wget curl vim build-base readline readline-dev openssl-dev zlib-dev gmp-dev

ENV CONFIGURE_OPTS --disable-install-doc

RUN apk update && apk upgrade

RUN apk add --update $BUILD_CORE_LIBS

RUN apk add --update $BUILD_LINUX_CORE && \
    apk add $BUILD_COMPILERS && \
    rm -rf /var/cache/apk/*

CMD ["true"]

FROM ruuuby_base as ruuuby_base_db

ENV BUILD_DBS sqlite sqlite-dev postgresql postgresql-dev libpq
RUN apk add --update $BUILD_DBS

CMD ["true"]

# -------------------------------------------- ⚠️ --------------------------------------------
# not currently utilized (in this version) and thus not currently tested
# -------------------------------------------- ⚠️ --------------------------------------------
