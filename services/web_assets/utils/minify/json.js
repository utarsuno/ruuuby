/**
 * @Reference: https://www.npmjs.com/package/jsonminify
 */
const MINIFY_JSON = require('jsonminify');

/**
 * for same functionality w/o external library and w/ less coverage: `JSON.stringify(JSON.parse(json))`
 *
 * @param {string} json
 *
 * @return {string}
 */
let minify = function(json) {
    let output = MINIFY_JSON(json);
    if (output === undefined) {
        throw `unable to minify json the content{${json}}`;
    }
    if (output.endsWith(",}")) {
        output = output.substring(0, output.length - 2);
        output += "}";
    }
    return output;
};

module.exports = {
    'minify': minify
};
