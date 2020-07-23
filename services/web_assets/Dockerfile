FROM alpine:3.12

RUN apk update && apk upgrade && apk add --update --no-cache \
  bash bash-completion nodejs nodejs-npm curl gzip alpine-sdk wget coreutils

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

# TODO: this should output {6.14.4}
CMD ["npm", "-v"]
