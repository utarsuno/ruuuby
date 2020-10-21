const LIB_FS     = require('fs');
const LIB_FILE   = require('./file');
const LIB_CRYPTO = require('../crypto');

/**
 * @see https://stackoverflow.com/questions/15630770/node-js-check-if-path-is-file-or-directory
 *
 * @param {string} path
 *
 * @return {boolean}
 */
let Ǝʔ = function(path) {
    try {
        return !!(LIB_FS.lstatSync(path).isDirectory());
    } catch (err) {
        return false;
    }
};

function _md5_compare(a, b) {
    if (a[1] < b[1]) {
        return -1;
    } else if (a[1] > b[1]) {
        return 1;
    }
    return 0;
}

/**
 * @param {string}  path
 * @param {string}  base_name
 * @param {boolean} debug
 *
 * @return {Promise}
 */
let md5 = function(path, base_name, debug) {
    let parsed   = [];
    let promises = [];
    let paths    = [];
    let final     = '';

    LIB_FS.readdirSync(path).forEach(file => {
        let full_path = `${path}${file}`;
        if (!Ǝʔ(full_path)) {
            let p = LIB_FILE.md5(full_path);
            promises.push(p);
            paths.push(`${file}`);
        }
    });

    return Promise.all(promises).then(function(data) {
        let i;
        for (i = 0; i < paths.length; i++) {
            parsed.push([data[i], paths[i]]);
        }
        parsed = parsed.sort(_md5_compare);
        for (i = 0; i < parsed.length; i++) {
            if (debug){console.log(parsed[i]);}
            final += (parsed[i][0] + parsed[i][1]);
        }
        final += base_name;
        if (debug) {
            return [final, LIB_CRYPTO.md5(final)];
        } else {
            return LIB_CRYPTO.md5(final)
        }
    }).catch(function (err) {
        return err;
    });
};

module.exports = {
    'Ǝʔ': Ǝʔ,
    'md5': md5
};
