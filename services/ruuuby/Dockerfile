#  __        __   ___     __               __
# |__)  /\  /__` |__     |__) |  | | |    |  \
# |__) /~~\ .__/ |___    |__) \__/ | |___ |__/
#
FROM alpine:3.12

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_MESSAGES en_US.UTF-8

ENV CC "clang"
ENV CXX "clang++"
ENV ARCHFLAGS "-arch x86_64"

ENV BUILD_CORE_LIBS git wget curl vim build-base readline readline-dev openssl-dev zlib-dev gmp-dev
ENV BUILD_COMPILERS clang clang-dev musl-dev gcc cmake make
ENV BUILD_LINUX_CORE linux-headers imagemagick-dev
ENV BUILD_LINUX_CORE linux-headers imagemagick-dev


ENV BUNDLE_SILENCE_ROOT_WARNING=1
ENV RUUUBY_OS_CURRENT "linux"

ENV RUUUBY_F01 "b01|b03|b04{debug}"
ENV RUUUBY_F12 "b00"
ENV RUUUBY_F26 "b00"
ENV RUUUBY_F43 "b00"
ENV RUUUBY_F98 "11"


