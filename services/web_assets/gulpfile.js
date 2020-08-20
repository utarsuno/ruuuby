const { series, parallel } = require('gulp');


function task_clean(call_back) {
    console.log(process.env.NODE_ENV);
    console.log("just ran the func{task_clean}");
    call_back();
}

function task_build(call_back) {
    console.log(process.env.NODE_ENV);
    console.log("just ran the func{task_build}");
    call_back();
}

function task_test(call_back) {
    gulp.src('test/test.js', {read: false})
        // `gulp-mocha` needs filepaths so you can't have any plugins before it
        .pipe(mocha());
    call_back();
}

//exports.default = default_task

const mocha = require('gulp-mocha');

exports.testingggg = () => (
    gulp.src('test.js', {read: false})
        // `gulp-mocha` needs filepaths so you can't have any plugins before it
        .pipe(mocha())
);

exports.build   = task_build;
exports.clean   = task_clean;
exports.testtt  = task_test;
exports.paralll = parallel(task_clean, task_build);
exports.default = series(task_clean, task_build);


/* a good example

exports.build = series(
  clean,
  parallel(
    cssTranspile,
    series(jsTranspile, jsBundle)
  ),
  parallel(cssMinify, jsMinify),
  publish
);

 */
