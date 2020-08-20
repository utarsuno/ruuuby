const path = require('path');

module.exports = {
    mode: "development",
    entry: "./src/index.js",
    target: "web",
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'bundle.js'
    },
    resolve: {
        alias: {
            'node_modules': path.join(__dirname, 'node_modules'),
            'three': path.resolve('node_modules', 'three/build/three.js')
            //three$: 'three/build/three.min.js',
            //'three/.*$': 'three',
            // don't need to register alias for every module
        },
        // ...
    },
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

//webpack -p
