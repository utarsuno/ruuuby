
const LIB_FILE = require('./io/file');
const LIB_DIR  = require('./io/dir');

//let Ǝ_param = function(param_name, req) {return (req.param(param_name) !== undefined);};

/**
 * @param {string} param_name
 * @param req
 *
 * @return {boolean}
 */
let Ǝ_paramʔ = function(param_name, req) {
    return (req.query[param_name] !== undefined);
};

let parse_paramⵑ = function(param_name, req, res) {
    let param = req.query[param_name];
    if (param) {
        return param;
    } else {
        return err_param_missing(param_name, res);
    }
};

let parse_param_fileⵑ = function(param_name, req, res) {
    let path = req.query[param_name];
    if (path) {
        if (LIB_FILE.Ǝʔ(path)) {
            return path;
        } else {
            res.status(400).send(`param{${param_name}} w/ path{${path}} did not match any file`);
        }
    } else {
        return err_param_missing(param_name, res);
    }
};

let parse_param_dirⵑ = function(param_name, req, res) {
    let path = req.query[param_name];
    if (path) {
        if (LIB_DIR.Ǝʔ(path)) {
            return path;
        } else {
            res.status(400).send(`param{${param_name}} w/ path{${path}} did not match any directory`);
        }
    } else {
        return err_param_missing(param_name, res);
    }
};

let parse_param_pathⵑ = function(param_name, req, res) {
    let path = req.query[param_name];
    if (path) {
        if (LIB_FILE.Ǝʔ(path) || LIB_DIR.Ǝʔ(path)) {
            return path;
        } else {
            res.status(400).send(`param{${param_name}} w/ path{${path}} did not match any path or directory`);
        }
    } else {
        return err_param_missing(param_name, res);
    }
};

let parse_param_enumⵑ = function(param_name, req, res, allowed_values) {
    let param = req.query[param_name];
    if (param) {
        if (allowed_values.indexOf(param) > -1) {
            return param;
        } else {
            res.status(400).send(`provided param{${param_name}} has un-recognized value{${param}}`);
        }
    } else {
        return err_param_missing(param_name, res);
    }
};

let parse_param = function(param_name, req) {
    let param = req.query[param_name];
    if (param) {
        return param;
    } else {
        return null;
    }
};


/**
 * @param {string}  param_name
 * @param req
 * @param {boolean} default_value
 *
 * @return {boolean}
 */
let parse_param_𝔹 = function(param_name, req, default_value) {
    let param = req.query[param_name];
    if (param) {
        return (param === 'true' || param === true);
    } else {
        return default_value;
    }
};

/**
 * @param {string} param_name
 * @param res
 */
let err_param_missing = function(param_name, res) {
    res.status(400).send(`param{${param_name}} was not provided`);
    return res;
};

/**
 * @param {string} param_name
 * @param param_value
 * @param {string} err
 * @param res
 */
let err_param = function(param_name, param_value, err, res) {
    res.status(400).send(`param{${param_name}} w/ value{${param_value}} encountered error{${err}}`);
    return res;
};


/**
 * @param error_message
 * @param res
 */
let err_runtime = function(error_message, res) {
    let err_txt = `error{${error_message}}`;
    console.error(err_txt);
    res.status(500).send(err_txt);
    return res;
};

module.exports = {
    'Ǝ_paramʔ': Ǝ_paramʔ,
    'err_param_missing': err_param_missing,
    'err_param': err_param,
    'err_runtime': err_runtime,
    'parse_param': parse_param,
    'parse_param_enumⵑ': parse_param_enumⵑ,
    'parse_paramⵑ': parse_paramⵑ,
    'parse_param_𝔹': parse_param_𝔹,
    'parse_param_pathⵑ': parse_param_pathⵑ,
    'parse_param_fileⵑ': parse_param_fileⵑ,
    'parse_param_dirⵑ': parse_param_dirⵑ,
};
