
/**
 * @param param_name
 * @param req
 *
 * @return {boolean}
 */
let Ǝ_param = function(param_name, req) {return (req.param(param_name) !== undefined);};

/**
 * @param param_name
 * @param res
 */
let err_param_missing = function(param_name, res) {
    res.status(400);
    res.send(`param{${param_name}} was not provided`);
};

/**
 * @param error_message
 * @param res
 */
let err_runtime = function(error_message, res) {
    let err_txt = `error{${error_message}}`;
    console.error(err_txt);
    res.status(500);
    res.send(err_txt);
};

module.exports = {
    'Ǝ_param': Ǝ_param,
    'err_param_missing': err_param_missing,
    'err_runtime': err_runtime
};
