/**
 * @Reference: https://www.npmjs.com/package/csso
 */
const LIB_CSSO = require('csso');

/**
 *
 * @param {string} css
 *
 * @return {string}
 */
let minify = function(css) {return LIB_CSSO.minify(css).css;};

module.exports = {
    'minify': minify
};
