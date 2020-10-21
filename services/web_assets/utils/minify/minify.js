const LIB_CSS  = require('./css');
const LIB_HTML = require('./html');
const LIB_JSON = require('./json');

/**
 * @param {string} content
 * @param {string} minification_type
 *
 * @return {string}
 */
let minify = function(content, minification_type) {
    switch (minification_type) {
        case 'html':
            return LIB_HTML.minify(content);
        case 'css':
            return LIB_CSS.minify(content);
        case 'json':
            return LIB_JSON.minify(content);
        default:
            throw `f{minify_content} got minification_type w/ unknown value{${minification_type}}`
    }
};

/**
 * @param {string} minification_type
 *
 * @return {boolean}
 */
let Ǝʔ = function(minification_type) {
    switch (minification_type) {
        case 'html':
        case 'css':
        case 'json':
            return true;
        default:
            return false;
    }
};

module.exports = {
    'minify': minify,
    'Ǝʔ': Ǝʔ,
    'types': ['html', 'css', 'json']
};
