const path    = require('path');
//import path from 'path';
const webpack = require('webpack');
//import webpack from 'webpack';

// @see https://webpack.js.org/configuration/optimization/#optimizationminimizer

module.exports = {
    // fail on first error
    //bail: true,
    mode: "development",
    stats: 'verbose',
    performance: {
        hints: 'warning'
    },
    optimization: {
        minimize: true,
        //usedExports: true,
        //providedExports: true,
        //occurrenceOrder: true,
        //removeEmptyChunks: true,
        //mergeDuplicateChunks: true,
        //flagIncludedChunks: true,
        //concatenateModules: true,
        //removeAvailableModules: true,
        //moduleIds: 'size',
        //chunkIds: 'total-size',
        //noEmitOnErrors: false
    },
    entry: "./src/index.js",
    target: "web",
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'bundle.js',
        //crossOriginLoading: 'anonymous'
    },
    devtool: 'none',
    resolve: {

        // directories where to look for modules,
        modules: [
            'node_modules',
            path.resolve(__dirname, 'src')
        ],

        //aliasFields: ['browser'],
        //mainFields: ['browser', 'module', 'main'],
        extensions: ['.js'],
        //modules: ['/root/ruuuby_js/', 'node_modules'],
        //modules: [
        //    path.join(__dirname, '../node_modules')
        //],
        //modules: [
        //    '/root/ruuuby_js/node_modules/'
        //],
        //alias: {
        //    'three': path.resolve('node_modules', 'three/build/three.js')
            //'three': '/root/ruuuby_js/node_modules/three/build/three.module.js',
        //}
        alias: {
            'three': path.resolve('node_modules', 'three/build/three.js'),
            //'attributes': '/root/ruuuby_js/src/attribute/',
            //'node_modules': '/root/ruuuby_js/node_modules',
            //'three': '/root/ruuuby_js/node_modules/three/build/three.module.js',
            //'root': path.resolve(__dirname, 'src')
            //'three': path.resolve('node_modules', 'three/build/three.js')
            //three$: 'three/build/three.min.js',
            //'three/.*$': 'three',
            // don't need to register alias for every module
        },
        // ...
    },
    externals: {
        DEBUGGING: 'DEBUGGING',
        VERSION: 'VERSION',
        ENGINE_FLAG_EVENT_RESIZE: "ENGINE_FLAG_EVENT_RESIZE",
        RENDER_FINDEX_WIDTH_MAX: "RENDER_FINDEX_WIDTH_MAX",
        RENDER_FINDEX_HEIGHT_MAX: "RENDER_FINDEX_HEIGHT_MAX",
        RENDER_FINDEX_ASPECT: "RENDER_FINDEX_ASPECT",
        RENDERER_FINDEX_WIDTH_CURRENT: "RENDERER_FINDEX_WIDTH_CURRENT",
        RENDERER_FINDEX_HEIGHT_CURRENT: "RENDERER_FINDEX_HEIGHT_CURRENT",
        RENDERER_FINDEX_ASPECT_CURRENT: "RENDERER_FINDEX_ASPECT_CURRENT",
        ENGINE_FINDEX_WIDTH: "ENGINE_FINDEX_WIDTH",
        ENGINE_FINDEX_HEIGHT: "ENGINE_FINDEX_HEIGHT",
        ENGINE_FINDEX_ASPECT: "ENGINE_FINDEX_ASPECT",
        ENGINE_FINDEX_DELTA_ELAPSED_SECOND: "ENGINE_FINDEX_DELTA_ELAPSED_SECOND",
        ENGINE_FINDEX_DELTA_ELAPSED_PHYSICS: "ENGINE_FINDEX_DELTA_ELAPSED_PHYSICS",
        ENGINE_FINDEX_DELTA_ELAPSED_LOGIC: "ENGINE_FINDEX_DELTA_ELAPSED_LOGIC",
        ENGINE_FINDEX_DELTA_ELAPSED_RENDER: "ENGINE_FINDEX_DELTA_ELAPSED_RENDER",
        ENGINE_FINDEX_FPS_COUNTER: "ENGINE_FINDEX_FPS_CURRENT",
        FPS_PHYSICS: "FPS_PHYSICS",
        FPS_RENDER: "FPS_RENDER",
        FPS_LOGIC: "FPS_LOGIC"
    },
    // @see https://stackoverflow.com/questions/54262735/how-to-include-and-use-defineplugin-in-webpack-config
    plugins: [
        //new webpack.EsmWebpackPlugin(),
        new webpack.DefinePlugin({
            DEBUGGING: true,
            VERSION: "\"0.0.50\"",
            ENGINE_FLAG_EVENT_RESIZE: "1",
            RENDERER_FINDEX_WIDTH_MAX: "0",
            RENDERER_FINDEX_HEIGHT_MAX: "1",
            RENDERER_FINDEX_ASPECT: "2",
            RENDERER_FINDEX_WIDTH_CURRENT: "3",
            RENDERER_FINDEX_HEIGHT_CURRENT: "4",
            RENDERER_FINDEX_ASPECT_CURRENT: "5",
            ENGINE_FINDEX_WIDTH: "0",
            ENGINE_FINDEX_HEIGHT: "1",
            ENGINE_FINDEX_ASPECT: "2",
            ENGINE_FINDEX_DELTA_ELAPSED_SECOND: "3",
            ENGINE_FINDEX_DELTA_ELAPSED_PHYSICS: "5",
            ENGINE_FINDEX_DELTA_ELAPSED_LOGIC: "6",
            ENGINE_FINDEX_DELTA_ELAPSED_RENDER: "7",
            ENGINE_FINDEX_FPS_COUNTER: "8",
            FPS_PHYSICS: "0.011111111111111112",
            FPS_RENDER: "0.016666666666666666",
            FPS_LOGIC: "0.03333333333333333",
            COLOR_LG: "\"#00ffb3\""
        })
    ]
    //build: {
    //    plugins:[
    //        new webpack.ProvidePlugin({
    //            'THREE': 'three'
    //        }),
    //        //...
    //    ]
    //}
};

//https://stackoverflow.com/questions/40556588/what-is-the-proper-way-to-get-three-js-used-within-webpack-so-i-can-use-orbitcon
//https://stackoverflow.com/questions/43742648/webpack-not-minifying-my-bundle-js
