const LIB_FS   = require('fs');
const ENCODING = 'utf8';

/**
 * @param {string} path
 *
 * @return {boolean}
 */
let is_valid = function(path) {return !!(LIB_FS.lstatSync(path).isFile());};

/**
 * @param {string} path
 *
 * @return {Promise}
 */
let read = function(path) {
    return new Promise(function (resolve, reject) {
        LIB_FS.readFile(path, ENCODING, function (err, data) {
            if (err) {
                console.log(`error reading file{${path}}, w/ message{${err}}`);
                reject(err);
            }
            resolve(data.toString());
        });
    });
};

/**
 * @param {string} path
 * @param {string} contents
 */
let write = function(path, contents) {
    return new Promise(function (resolve, reject) {
        LIB_FS.writeFile(path, contents, function (err) {
            if (err) {
                console.log(`m{save_contents} got err{${err.toString()}}`);
                reject(err);
            }
            console.log(`the file{${path}} was saved!`);
            resolve(`content written to path{${path}}`);
        });
    });
};

// TODO: write_debugging

/**
 * @param {string} path
 *
 * @return {Promise}
 */
let read_debugging = function(path) {
    if (!is_valid(path)) {
        throw new Error('Path{' + path + '} is not a file path!');
    } else {
        console.log(`reading contents of path{${path}}`);
        return read(path);
    }
};

module.exports = {
    'read': read,
    'write': write,
    'read_debugging': read_debugging,
    'is_valid': is_valid
};
