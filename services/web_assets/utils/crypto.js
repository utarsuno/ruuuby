const LIB_CRYPTO = require('crypto');

/**
 * @see https://gist.github.com/zfael/a1a6913944c55843ed3e999b16350b50
 *
 * @param {string} content
 */
let md5 = function(content) {
    return LIB_CRYPTO.createHash('md5').update(content, 'utf8').digest('hex');
};

module.exports = {
    md5: md5
};
