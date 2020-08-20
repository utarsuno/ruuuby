#  __        __   ___     __               __
# |__)  /\  /__` |__     |__) |  | | |    |  \
# |__) /~~\ .__/ |___    |__) \__/ | |___ |__/
#
FROM alpine:3.12

# -------------------------------------------- ⚠️ --------------------------------------------
# not currently utilized (in this version) and thus not currently tested
# -------------------------------------------- ⚠️ --------------------------------------------


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

RUN apk add --no-cache gmp-dev

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_MESSAGES en_US.UTF-8

#ENV BUILD_CORE_LIBS bash bash-completion git wget curl vim build-base readline readline-dev openssl-dev zlib-dev
ENV BUILD_CORE_LIBS git wget curl vim build-base readline readline-dev openssl-dev zlib-dev
ENV SERVICE_OS="alpine"
ENV SERVICE_OS_VERSION="TODO:"

# TODO: clean up consistency, just use bitwise flags
ENV BUNDLE_SILENCE_ROOT_WARNING=1
ENV RUUUBY_F01 "b01|b03|b04{debug}"
ENV RUUUBY_F12 "b00"
ENV RUUUBY_F26 "b00"
ENV RUUUBY_F98 "11"
ENV PATH_CLEAN_LOCAL "~/../ruuuby/bin/manually_execute/clean_up"
ENV RUUUBY_OS_CURRENT "linux"

# TODO: SET GEM VERSIONS AS ENV_VARS

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

#  ___                __   __   __   __
# |__  |\ | \  / .   |__) |__) /  \ |  \
# |___ | \|  \/  .   |    |  \ \__/ |__/
#
FROM build_base as build_env_prod
ENV BUILD_ENV=prod
CMD ["ruby", "-v"]

#  ___                __   ___
# |__  |\ | \  / .   |  \ |__  \  /
# |___ | \|  \/  .   |__/ |___  \/
#
FROM build_base as build_env_dev
ENV BUILD_ENV=dev

RUN apk add --update --no-cache zsh vim dpkg \
 && sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" \
 && sed -i '1d' /etc/passwd \
 && (echo "root:x:0:0:root:/root:/bin/zsh" && cat /etc/passwd) > /etc/passwd_parsed && mv /etc/passwd_parsed /etc/passwd \
 && echo "alias cd_volume='cd /v/'" >> /root/.zshrc \
 && echo "alias ll='ls -larti'" >> /root/.zshrc \
 && rm -rf /var/cache/apk/*

CMD ["ruby", "-v"]

# -------------------------------------------- ⚠️ --------------------------------------------
# not currently utilized (in this version) and thus not currently tested
# -------------------------------------------- ⚠️ --------------------------------------------

#  _ __    __    ____    ___   __  __  _ __   ___     __    ____
# /\`'__\/'__`\ /',__\  / __`\/\ \/\ \/\`'__\/'___\ /'__`\ /',__\
# \ \ \//\  __//\__, `\/\ \L\ \ \ \_\ \ \ \//\ \__//\  __//\__, `\
#  \ \_\\ \____\/\____/\ \____/\ \____/\ \_\\ \____\ \____\/\____/
#   \/_/ \/____/\/___/  \/___/  \/___/  \/_/ \/____/\/____/\/___/

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
