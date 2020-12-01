#  __        __   ___     __               __
# |__)  /\  /__` |__     |__) |  | | |    |  \
# |__) /~~\ .__/ |___    |__) \__/ | |___ |__/
#

FROM js_base:latest as build_base

# TODO: https://stackoverflow.com/questions/35968047/using-webpack-threejs-examples-and-typescript
# TODO: https://www.giacomodebidda.com/threejs-project-starter-for-es6-and-webpack2/
# TODO: https://discourse.threejs.org/t/best-practice-webpack-threejs/5186
# TODO: https://www.sitepoint.com/beginners-guide-node-package-manager/
# TODO: https://github.com/mrdoob/three.js/wiki/Migration-Guide
# TODO: https://github.com/mrdoob/three.js/wiki
# TODO: https://www.npmjs.com/package/three
# TODO: https://threejs.org/docs/index.html#manual/en/introduction/Installation
# TODO: https://dzone.com/articles/docker-environment-variables-how-to-set-and-config
# TODO: https://docs.docker.com/compose/compose-file/compose-versioning/#version-3
# TODO: https://docs.npmjs.com/downloading-and-installing-packages-locally
# TODO: https://www.pluralsight.com/guides/introduction-to-test-driven-development-in-javascript
# TODO: https://github.com/lautis/uglifier

RUN mkdir /root/ruuuby_js
WORKDIR /root/ruuuby_js

ENV BUILD_NPM_LIBS chai csso esm exports-loader express fs gulp gulp-cli gulp-mocha html-minifier imports-loader jsonminify mocha three webpack webpack-cli
ENV SERVICE_NAME="service_js"

RUN npm install --global $BUILD_NPM_LIBS

#                                                        __
#                                                       /\ \
#    __    ___   __  __   __      _____   _ __   ___    \_\ \
#  /'__`\/' _ `\/\ \/\ \ /\_\    /\ '__`\/\`'__\/ __`\  /'_` \
# /\  __//\ \/\ \ \ \_/ |\/_/_   \ \ \L\ \ \ \//\ \L\ \/\ \L\ \
# \ \____\ \_\ \_\ \___/   /\_\   \ \ ,__/\ \_\\ \____/\ \___,_\
#  \/____/\/_/\/_/\/__/    \/_/    \ \ \/  \/_/ \/___/  \/__,_ /
#                                   \ \_\
#                                    \/_/

FROM build_base as build_env_prod
ENV BUILD_ENV=prod
ENV NODE_ENV=production

COPY ./bin /root/ruuuby_js/bin
COPY ./dist /root/ruuuby_js/dist
COPY ./intermediate /root/ruuuby_js/intermediate
COPY ./test /root/ruuuby_js/test
COPY ./gulpfile.js /root/ruuuby_js/gulpfile.js
COPY ./package.json /root/ruuuby_js/package.json
COPY ./webpack.config.js /root/ruuuby_js/webpack.config.js

RUN npm install

COPY ./src /root/ruuuby_js/src
COPY ./assets /root/ruuuby_js/assets
COPY ./utils /root/ruuuby_js/utils
COPY ./server.js /root/ruuuby_js/server.js
CMD ["node", "server.js"]

#                                   __
#                                  /\ \
#    __    ___   __  __   __       \_\ \     __   __  __
#  /'__`\/' _ `\/\ \/\ \ /\_\      /'_` \  /'__`\/\ \/\ \
# /\  __//\ \/\ \ \ \_/ |\/_/_    /\ \L\ \/\  __/\ \ \_/ |
# \ \____\ \_\ \_\ \___/   /\_\   \ \___,_\ \____\\ \___/
#  \/____/\/_/\/_/\/__/    \/_/    \/__,_ /\/____/ \/__/

FROM build_base as build_env_dev
ENV BUILD_ENV=dev
ENV NODE_ENV=development
ENV BUID_LIBS_DEV_ONLY zsh vim dpkg mandoc man-pages

RUN apk add --update --no-cache git zsh vim dpkg \
 && sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" \
 && sed -i '1d' /etc/passwd \
 && (echo "root:x:0:0:root:/root:/bin/zsh" && cat /etc/passwd) > /etc/passwd_parsed && mv /etc/passwd_parsed /etc/passwd \
 && echo "alias cd_data='cd /root/ruuuby_js/'" >> /root/.zshrc \
 && echo "alias ll='ls -larti'" >> /root/.zshrc \
 && rm -rf /var/cache/apk/*

#COPY ./ /root/ruuuby_js

COPY ./package.json /root/ruuuby_js/package.json
COPY ./webpack.config.js /root/ruuuby_js/webpack.config.js

#RUN npm install
RUN npm install --save-dev $BUILD_NPM_LIBS

COPY ./dist /root/ruuuby_js/dist
COPY ./test /root/ruuuby_js/test
COPY ./src /root/ruuuby_js/src
COPY ./assets /root/ruuuby_js/assets
COPY ./gulpfile.js /root/ruuuby_js/gulpfile.js
COPY ./intermediate /root/ruuuby_js/intermediate
COPY ./bin /root/ruuuby_js/bin
COPY ./utils /root/ruuuby_js/utils
COPY ./server.js /root/ruuuby_js/server.js
CMD ["node", "server.js"]

#                               __                   __
#                              /\ \__               /\ \__
#    __    ___   __  __   __   \ \ ,_\    __    ____\ \ ,_\
#  /'__`\/' _ `\/\ \/\ \ /\_\   \ \ \/  /'__`\ /',__\\ \ \/
# /\  __//\ \/\ \ \ \_/ |\/_/_   \ \ \_/\  __//\__, `\\ \ \_
# \ \____\ \_\ \_\ \___/   /\_\   \ \__\ \____\/\____/ \ \__\
#  \/____/\/_/\/_/\/__/    \/_/    \/__/\/____/\/___/   \/__/

FROM build_base as build_env_test
ENV BUILD_ENV=test
ENV NODE_ENV=test
ENV BUILD_LIBS_TEST_ONLY dpkg

RUN apk add --update --no-cache dpkg \
COPY ./bin /root/ruuuby_js/bin
COPY ./dist /root/ruuuby_js/dist
COPY ./intermediate /root/ruuuby_js/intermediate
COPY ./test /root/ruuuby_js/test
COPY ./gulpfile.js /root/ruuuby_js/gulpfile.js
COPY ./package.json /root/ruuuby_js/package.json
COPY ./webpack.config.js /root/ruuuby_js/webpack.config.js

RUN npm install

COPY ./src /root/ruuuby_js/src
COPY ./assets /root/ruuuby_js/assets
COPY ./utils /root/ruuuby_js/utils
COPY ./server.js /root/ruuuby_js/server.js
CMD ["node", "server.js"]
