import Engine from './engine/engine'

console.log(`index.js just ran with version{${VERSION}} and iteration 3`);

let engine    = new Engine.Engine();
window.ruuuby = engine;
window.R      = engine;

engine.run();

//console.log('engine just ran');

//module.exports = THREE;

// TODO: https://unix.stackexchange.com/questions/88644/how-to-check-os-and-version-using-a-linux-command
// TODO: https://nodesource.com/blog/an-absolute-beginners-guide-to-using-npm/
// TODO: https://webpack.js.org/guides/production/
// TODO: https://www.sitepoint.com/unit-test-javascript-mocha-chai/
