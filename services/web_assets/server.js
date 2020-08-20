//#encoding

const express  = require('express');
const app      = express();
const port     = Number(process.env.SERVICE_PORT);

const LIB_REQ  = require('./utils/utils_protocol');
const LIB_IO   = require('./utils/utils_file');
const LIB_CSS  = require('./utils/utils_css');
const LIB_HTML = require('./utils/utils_html');

/**
 * @param {string} text
 */
let log = function(text) {console.log(text)};

// start the server
app.listen(port, function() {
    log(`file{server.js} launched, listening at http://localhost:${port}`);
});

// TODO: LOTS OF ERROR SCENARIO (TDD) COVERAGE MISSING
app.get('/js/minify', function(req, res) {
    if (!LIB_REQ.Ǝ_param('path_input', req)) {
        LIB_REQ.err_param_missing('path_input', res);
    } else if (!LIB_REQ.Ǝ_param('minify_type', req)) {
        LIB_REQ.err_param_missing('minify_type', res);
    } else {
        let debug       = LIB_REQ.Ǝ_param('debug', req) ? req.query.debug === true : false;
        let path_input  = req.query.path_input;
        let path_output = LIB_REQ.Ǝ_param('path_output', req) ? req.query.path_output : undefined;
        let minify_type = req.query.minify_type;
        if (minify_type !== 'html' && minify_type !== 'css') {
            res.status(400);
            res.send(`provided param{minify_type} has un-recognized value{${minify_type}}`);
        }
        let data        = debug ? LIB_IO.read(path_input) : LIB_IO.read_debugging(path_input);
        data.then(function(the_file_contents) {
            if (debug) {log(`finished reading from path{${path_input}}`);}
            let minified = '';
            if (minify_type === 'css') {
                minified = LIB_CSS.minify(the_file_contents);
            } else {
                minified = LIB_HTML.minify(the_file_contents);
            }
            if (path_output !== undefined) {
                if (debug) {log(`saving to{${path_output}}`);}
                let p = LIB_IO.write(path_output, minified);
                p.then(function(val) {
                    if (debug) {log(`saved to{${path_output}}, returning data!`);}
                    res.send(`${minified}`);
                }).catch(function(err) {
                    LIB_REQ.err_runtime(err, res);
                });
            } else {
                if (debug) {log("no save path specified, returning data!");}
                res.send(minified);
            }
        }).catch(function(error) {
            LIB_REQ.err_runtime(error, res);
        });
    }
});

// TODO: https://itnext.io/setup-logger-for-node-express-app-9ef4e8f73dac
// TODO: https://www.twilio.com/blog/guide-node-js-logging
// TODO: https://blog.bitsrc.io/logging-best-practices-for-node-js-applications-8a0a5969b94c
