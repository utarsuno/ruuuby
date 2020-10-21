/**
 * @Reference: https://www.npmjs.com/package/html-minifier
 */
const LIB_HTML = require('html-minifier');

/**
 * @param {string} html
 *
 * @return {string}
 */
let minify = function(html) {
    return LIB_HTML.minify(html, {
        collapseBooleanAttributes    : true,
        collapseInlineTagWhitespace  : true,
        collapseWhitespace           : true,
        decodeEntities               : true,
        html5                        : true,
        keepClosingSlash             : false,
        // test
        minifyCSS                    : true,
        //
        minifyJS                     : false,
        conservativeCollapse         : false,
        // Temporary false
        minifyURLs                   : false,
        preserveLineBreaks           : false,
        preventAttributesEscaping    : true,
        processConditionalComments   : true,
        quoteCharacter               : "'",
        removeAttributeQuotes        : true,
        removeComments               : true,
        removeEmptyAttributes        : false,
        removeEmptyElements          : false,
        removeOptionalTags           : true,
        removeRedundantAttributes    : true,
        removeScriptTypeAttributes   : true,
        removeStyleLinkTypeAttributes: true,
        sortAttributes               : true,
        sortClassName                : true,
        useShortDoctype              : true
    });
};

module.exports = {
    'minify': minify,
};
