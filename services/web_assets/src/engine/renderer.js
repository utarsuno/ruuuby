// -------------------------------------------- ⚠️ --------------------------------------------
// testing purposes
// -------------------------------------------- ⚠️ --------------------------------------------

import {Vector2, WebGLMultisampleRenderTarget, EffectComposer, Scene, PerspectiveCamera, WebGLRenderer} from 'three';

import AttributeCanvas3D from '../attribute/canvas/3d.js';

let EngineRenderer = function(canvas_id, hud) {
    this.set_canvas_3d(canvas_id);
    this.hud    = hud;
    this._floats = new Float32Array(6);
    this.scene  = new Scene();
    this.camera = new PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);

    this.renderer = new WebGLRenderer({canvas: this.canvas, context: this.canvas_context});
};

Object.assign(
    EngineRenderer.prototype,
    AttributeCanvas3D.AttributeCanvas3D.prototype,
    {

        render: function() {
            this.check_dimensions();
            this.renderer.render(this.scene, this.camera);
        },

        /**
         * @param {boolean} with_webgl2
         */
        /*setup_renderer: function(with_webgl2) {
            this.renderer = new WebGLRenderer({canvas: this.canvas, context: this.context});
            this.renderer.setSize(window.innerWidth, window.innerHeight);

            /*if (with_webgl2) {
                const size = this.renderer.getDrawingBufferSize( new Vector2() );
                const parameters = {
                    format: RGBFormat,
                    stencilBuffer: false,
                };
                this.render_target    = new WebGLMultisampleRenderTarget( size.width, size.height, parameters );
                render_target.samples = 8; //default is 4 but to match the built-in AA quality 8 or 16 samples is needed

                this.composer = new EffectComposer( this.renderer, this.render_target );
            } else {

            }*/
        //},

        w: function() {
            return this._floats[RENDERER_FINDEX_WIDTH_CURRENT];
        },

        h: function() {
            return this._floats[RENDERER_FINDEX_HEIGHT_CURRENT];
        },

        aspect_ratio: function() {
            return this._floats[RENDERER_FINDEX_ASPECT_CURRENT];
        },

        check_dimensions: function() {
            //let w = this.canvas_context.drawingBufferWidth;
            //let h = this.canvas_context.drawingBufferHeight;
            let width  = window.innerWidth;
            let height = window.innerHeight;

            if (this.w() !== width) {
                this._floats[RENDERER_FINDEX_WIDTH_CURRENT] = width;
                if (this.height !== height) {
                    this._floats[RENDERER_FINDEX_HEIGHT_CURRENT] = height;
                    this.dimensions_update();
                } else {
                    //this.dimensions_update_width(true);
                    this.dimensions_update();
                }
            } else if (this.h() !== height) {
                this._floats[RENDERER_FINDEX_HEIGHT_CURRENT] = height;
                //this.dimensions_update_height(true);
                this.dimensions_update();
            }

            //this.hud.dimensions_check(w, h);
            //this.dimensions_check(w, h);
            //if (this._floats[RENDERER_FINDEX_WIDTH_CURRENT] !== w || this._floats[RENDERER_FINDEX_HEIGHT_CURRENT] !== h) {
            //    this.update_dimensions(w, h);
            //}
        },

        dimensions_update: function() {
            let width  = this.w();
            let height = this.h();
            this.hud.update_dimensions(width, height);
            this._floats[RENDERER_FINDEX_ASPECT_CURRENT] = width / height;
            this.canvas_context.width                   = width;
            this.canvas_context.height                  = height;
            this.camera.aspect                          = this.aspect_ratio();
            this.camera.updateProjectionMatrix();
            this.renderer.setSize(width, height);
        },

    }
);

export default {
    EngineRenderer: EngineRenderer
}

//export function spawn_renderer(canvas_id) {return new EngineRenderer(canvas_id);}
