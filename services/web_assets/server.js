const express    = require('express');
const app        = express();
const port       = Number(process.env.SERVICE_PORT);
const host       = String(process.env.SERVICE_HOST);

const LIB_REQ    = require('./utils/protocol');
const LIB_FILE   = require('./utils/io/file');
const LIB_DIR    = require('./utils/io/dir');
const LIB_MINIFY = require('./utils/minify/minify');

/**
 * @param {string} text
 */
let log = function(text) {console.log(text)};

// start the server
app.listen(port, function() {
    log(`file{server.js} launched, listening at ${host}:${port}`);
});

app.get('/md5/file', function(req, res) {
    // ------------------------------------------------------------------------------------
    //  __        __              __       __   ___  __          __   ___  __
    // |__)  /\  |__)  /\   |\/| /__` .   |__) |__  /  \ |  | | |__) |__  |  \
    // |    /~~\ |  \ /~~\  |  | .__/ .   |  \ |___ \__X \__/ | |  \ |___ |__/
    // ------------------------------------------------------------------------------------
    let path      = LIB_REQ.parse_param_fileⵑ('path', req, res);
    if (res.headersSent) {return res;}

    // ------------------------------------------------------------------------------------
    //  __        __              __       __   __  ___    __
    // |__)  /\  |__)  /\   |\/| /__` .   /  \ |__)  |  | /  \ |\ |  /\  |
    // |    /~~\ |  \ /~~\  |  | .__/ .   \__/ |     |  | \__/ | \| /~~\ |___
    // ------------------------------------------------------------------------------------
    let debug = LIB_REQ.parse_param_𝔹('debug', req, false);

    // ------------------------------------------------------------------------------------
    //  ___       __   __   __         ___          __   __     __
    // |__  |\ | |  \ |__) /  \ | |\ |  |     |    /  \ / _` | /  `
    // |___ | \| |__/ |    \__/ | | \|  |     |___ \__/ \__> | \__,
    // ------------------------------------------------------------------------------------
    let result = LIB_FILE.md5(path);
    result.then(function(data){
        if (debug) {
            log(`path{${path}} has md5 value{${data}}`);
            res.json({
                path: path,
                md5: data,
                timestamp: Date.now(),
            });
        } else {res.send(data);}
    }).catch(function(err) {
        return LIB_REQ.err_runtime(err, res);
    });
});

app.get('/md5/dir', function(req, res) {
    // ------------------------------------------------------------------------------------
    //  __        __              __       __   ___  __          __   ___  __
    // |__)  /\  |__)  /\   |\/| /__` .   |__) |__  /  \ |  | | |__) |__  |  \
    // |    /~~\ |  \ /~~\  |  | .__/ .   |  \ |___ \__X \__/ | |  \ |___ |__/
    // ------------------------------------------------------------------------------------
    let path      = LIB_REQ.parse_param_dirⵑ('path', req, res);
    if (res.headersSent) {return res;}
    let base_name = LIB_REQ.parse_paramⵑ('base_name', req, res);
    if (res.headersSent) {return res;}

    // ------------------------------------------------------------------------------------
    //  __        __              __       __   __  ___    __
    // |__)  /\  |__)  /\   |\/| /__` .   /  \ |__)  |  | /  \ |\ |  /\  |
    // |    /~~\ |  \ /~~\  |  | .__/ .   \__/ |     |  | \__/ | \| /~~\ |___
    // ------------------------------------------------------------------------------------
    let debug = LIB_REQ.parse_param_𝔹('debug', req, false);

    // ------------------------------------------------------------------------------------
    //  ___       __   __   __         ___          __   __     __
    // |__  |\ | |  \ |__) /  \ | |\ |  |     |    /  \ / _` | /  `
    // |___ | \| |__/ |    \__/ | | \|  |     |___ \__/ \__> | \__,
    // ------------------------------------------------------------------------------------
    try {
        let result = LIB_DIR.md5(path, base_name, debug);
        result.then(function (data) {
            if (debug) {
                log(`path{${path}} has md5 value{${data}}`);
                res.json({
                    path: path,
                    pre_parsed: data[0],
                    md5: data[1],
                    timestamp: Date.now(),
                });
            } else {res.send(data);}
        }).catch(function (err) {throw err;});
    } catch (err) {
        return LIB_REQ.err_runtime(err, res);
    }
});

/**
 * @see https://expressjs.com/en/api.html#app.get
 *
 * @TODO full test coverage
 */
app.get('/minify', function(req, res) {
    // ------------------------------------------------------------------------------------
    //  __        __              __       __   ___  __          __   ___  __
    // |__)  /\  |__)  /\   |\/| /__` .   |__) |__  /  \ |  | | |__) |__  |  \
    // |    /~~\ |  \ /~~\  |  | .__/ .   |  \ |___ \__X \__/ | |  \ |___ |__/
    // ------------------------------------------------------------------------------------
    let minify_type = LIB_REQ.parse_param_enumⵑ('minify_type', req, res, LIB_MINIFY.types);
    if (res.headersSent) {return res;}

    let path_input  = LIB_REQ.parse_param_fileⵑ('path_input', req, res);
    if (res.headersSent) {return res;}

    // ------------------------------------------------------------------------------------
    //  __        __              __       __   __  ___    __
    // |__)  /\  |__)  /\   |\/| /__` .   /  \ |__)  |  | /  \ |\ |  /\  |
    // |    /~~\ |  \ /~~\  |  | .__/ .   \__/ |     |  | \__/ | \| /~~\ |___
    // ------------------------------------------------------------------------------------
    let debug       = LIB_REQ.parse_param_𝔹('debug', req, false);
    let path_output = LIB_REQ.parse_param('path_output', req);
    let data        = LIB_FILE.read(path_input, debug);

    // ------------------------------------------------------------------------------------
    //                 ___            /  __
    //  |\/| | |\ | | |__  \ /    |  /  /  \
    //  |  | | | \| | |     |     | /   \__/
    // ------------------------------------------------------------------------------------
    data.then(function(the_file_contents) {
        let minified = LIB_MINIFY.minify(the_file_contents, minify_type);
        if (path_output !== undefined && path_output !== null) {
            let p = LIB_FILE.write(path_output, minified, debug);
            p.then(function(val) {
                if (debug) {
                    log(`saved to{${path_output}}, returning data for minified{${path_input}} w/ strategy{${minify_type}}`);
                    res.send(minified);
                } else {
                    let len_before = LIB_FILE.len(path_input);
                    let len_after  = LIB_FILE.len(path_output);
                    res.json({
                        path_base: path_input,
                        path_minified: path_output,
                        timestamp: Date.now(),
                        size_base: len_before,
                        size_minified: len_after,
                        size_diff: Math.abs((len_before - len_after) / len_before)
                    });
                }
            }).catch(function(err) {
                if (debug) {log(`error minifying path{${path_input}} w/ err{${err.toString()}}`)}
                return LIB_REQ.err_runtime(err, res);
            });
        } else {
            if (debug) {
                log(`no save path specified, returning data for minified{${path_input}} w/ strategy{${minify_type}}`);
                res.send(minified);
            } else {
                let len_before = the_file_contents.length;
                let len_after  = minified.length;
                res.json({
                    path_base: path_input,
                    timestamp: Date.now(),
                    size_base: len_before,
                    size_minified: len_after,
                    size_diff: Math.abs((len_before - len_after) / len_before)
                });
            }
        }
    }).catch(function(err) {
        if (debug) {log(`error reading path{${path_input}} w/ err{${err.toString()}}`)}
        return LIB_REQ.err_runtime(err, res);
    });
});

// TODO: https://itnext.io/setup-logger-for-node-express-app-9ef4e8f73dac
// TODO: https://www.twilio.com/blog/guide-node-js-logging
// TODO: https://blog.bitsrc.io/logging-best-practices-for-node-js-applications-8a0a5969b94c
