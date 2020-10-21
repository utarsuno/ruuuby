// -------------------------------------------- ⚠️ --------------------------------------------
// testing purposes
// -------------------------------------------- ⚠️ --------------------------------------------

import Font2D from "./font_2d.js"
import RenderableTextBlock from "./renderable_text_block";
import AttributeRenderable from '../../attribute/renderable.js';
import AttributeCanvas     from '../../attribute/canvas/canvas.js';
/**
 * @param {string} canvas_id
 *
 * @constructor
 */
let HUD = function(canvas_id) {
    this._set_canvas(canvas_id);
    this.canvas_context = this.canvas.getContext('2d');
    this.attribute_renderable(this);
    //this.canvas_context.scale(2.0, 2.0);

    this.canvas_context.fillStyle = COLOR_LG;
    this._cached_color           = null;
    this._cached_font            = new Font2D.Font2D('16px Courier', 16, 4, COLOR_LG);
    this._cached_alignment       = null;
    this.width                   = null;
    this.height                  = null;

    this.font_default = new Font2D.Font2D('16px Courier', 16, 4, COLOR_LG);
    this.hud_test     = new RenderableTextBlock.RenderableTextBlock(this, 0, 0, this.font_default);
    this.hud_fps      = this.hud_test.get_row(0);
    this.hud_width    = this.hud_test.get_row(1);
    this.hud_height   = this.hud_test.get_row(2);
    this.renderable_add(this.hud_test);
};

Object.assign(
    HUD.prototype,
    AttributeRenderable.AttributeRenderable.prototype,
    AttributeCanvas.AttributeCanvas.prototype,
    {

        set_fps: function(fps) {
            this.hud_fps.text_set(`fps: ${fps}`);
        },

        render: function(renderer) {
            //if (this.flag_needs_render) {
                //this.clear();
            //    this.canvas_context.fillStyle = this._cached_color;
            //    this.render_all(renderer);
            //    this.flag_needs_render = false;
            //} else {
                this.canvas_context.fillStyle = this._cached_color;
                this.render_pass(renderer);
            //}
        },

        set_color: function(c) {
            if (this._cached_color !== c) {
                this._cached_color           = c;
                this.canvas_context.fillStyle = c;
            }
        },

        set_font: function(f) {
            if (this._cached_font.font === f.font) {
                this._cached_font        = f;
                this.canvas_context.font = f.font;
            }
        },

        set_alignment: function(alignment) {
            if (this._cached_alignment !== alignment) {
                this._cached_alignment        = alignment;
                this.canvas_context.textAlign = alignment;
            }
        },

        clear: function() {
            //this.canvas_context.clearRect(0, 0, this.width, this.height);
        },

        /**
         * @param {float} width
         * @param {float} height
         */
        update_dimensions: function(width, height) {
            if (this.width !== width) {
                this.width                = width;
                this.canvas.width         = width;
                this.canvas_context.width = width;
                this.hud_width.text_set(`width: ${width.toString()}`);
                this.flag_needs_render     = true;
            }
            if (this.height !== height) {
                this.height                = height;
                this.canvas.height         = height;
                this.canvas_context.height = height;
                this.hud_height.text_set(`height: ${height.toString()}`);
                this.flag_needs_render      = true;
            }
        },
    }
);

export default {HUD: HUD}
