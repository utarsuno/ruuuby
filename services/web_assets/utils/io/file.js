const LIB_FS     = require('fs');
const LIB_CRYPTO = require('../crypto.js');
const ENCODING   = 'utf8';

/**
 * @param {string} path
 *
 * @return {boolean}
 */
let Ǝʔ = function(path) {
    try {
        return !!(LIB_FS.lstatSync(path).isFile());
    } catch (err) {
        return false;
    }
};

/**
 * @param {string} path
 *
 * @return {Promise}
 */
let md5 = function(path) {
    let content = read(path, false);
    return new Promise(function (resolve, reject) {
        content.then(function(the_file_contents) {
            resolve(LIB_CRYPTO.md5(the_file_contents));
        }).catch(function(err) {
            reject(err);
        });
    });
};

/**
 * @param {string}  path
 * @param {boolean} debugging
 *
 * @return {Promise}
 */
let read = function(path, debugging) {
    return new Promise(function (resolve, reject) {
        LIB_FS.readFile(path, ENCODING, function (err, data) {
            if (err) {
                if (debugging) {console.log(`error reading file{${path}}, w/ message{${err}}`);}
                reject(err);
            } else {
                resolve(data.toString());
            }
        });
    });
};

/**
 * @param {string}  path
 * @param {string}  contents
 * @param {boolean} debugging
 *
 * @return {Promise}
 */
let write = function(path, contents, debugging) {
    return new Promise(function (resolve, reject) {
        LIB_FS.writeFile(path, contents, function (err) {
            if (err) {
                if (debugging) {console.log(`m{save_contents} got err{${err.toString()}}`);}
                reject(err);
            }
            if (debugging) {console.log(`content written to path{${path}}`);}
            resolve(path);
        });
    });
};

/**
 * @param {string}  path
 * @param {boolean} debugging
 *
 * @return {Promise}
 */
let readⵑ = function(path, debugging) {
    if (!Ǝʔ(path)) {
        throw new Error('Path{' + path + '} is not a file path!');
    } else {
        if (debugging) {console.log(`reading contents of path{${path}}`);}
        return read(path, debugging);
    }
};

/**
 * @see https://stackoverflow.com/questions/42363140/how-to-find-the-size-of-the-file-in-node-js
 *
 * @param {string}  path
 * @param {boolean} in_mb_instead_of_bytes
 *
 * @return {*}
 */
let len = function(path, in_mb_instead_of_bytes=false) {
    let stats = LIB_FS.statSync(path);
    if (in_mb_instead_of_bytes) {
        return stats['size'] / 1000000.0;
    }
    return stats['size'];
};

module.exports = {
    'Ǝʔ': Ǝʔ,
    'read': read,
    'readⵑ': readⵑ,
    'write': write,
    'len': len,
    'md5': md5
};
