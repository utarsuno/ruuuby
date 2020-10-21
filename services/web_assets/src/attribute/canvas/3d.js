
import AttributeCanvas from './canvas.js';

let AttributeCanvas3D = function(){
};

Object.assign(
    AttributeCanvas3D.prototype,
    AttributeCanvas.AttributeCanvas.prototype,
    {
        set_canvas_3d: function(canvas_id) {
            this._set_canvas(canvas_id);
            if (!!(window.WebGL2RenderingContext)) {
                this._set_context('webgl2');
            } else {
                this.setup_webgl();
            }
        },

        setup_webgl: function() {
            console.log('webgl2 not supported');
            if (!!(window.WebGLRenderingContext)) {
                this._set_context('webgl');
                if (!!(this.canvas_context)) {this._set_context('experimental-webgl');}
                if (!(this.canvas_context)) {
                    this.error_no_webgl();
                }
            } else {
                this.error_no_webgl();
            }
        },

        /**
         * @private
         *
         * @param {string} context_type
         */
        _set_context: function(context_type) {
            this.canvas_context = this.canvas.getContext(context_type, {antialias: false});
        },

        error_no_webgl: function() {
            console.log('no webgl support');
            throw new Error("no webgl support found");
        }
    }
);

export default {AttributeCanvas3D: AttributeCanvas3D}
