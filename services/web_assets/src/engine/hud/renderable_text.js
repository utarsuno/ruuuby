// -------------------------------------------- ⚠️ --------------------------------------------
// testing purposes
// -------------------------------------------- ⚠️ --------------------------------------------

import {Vector2} from 'three';
import AttributeRenderable from '../../attribute/renderable.js';

/**
 * @param renderer
 * @param {float}   x
 * @param {float}   y
 * @param {Font2D} font
 * @param {string} text
 *
 * @constructor
 */
let RenderableText = function(renderer, x, y, font, text) {
    this.attribute_renderable(renderer);
    this.position = new Vector2(x, y);
    this.font     = font;
    this.text     = text;
};

Object.assign(
    RenderableText.prototype,
    AttributeRenderable.AttributeRenderable.prototype,
    {

        render: function(renderer) {
            renderer.set_alignment('start');
            renderer.set_color(this.font.color);
            renderer.set_font(this.font);
            renderer.canvas_context.fillText(this.text, this.position.x, this.position.y);
            this.flag_needs_render = false;
        },

        clear: function(renderer) {
            renderer.canvas_context.clearRect(this.position.x, this.position.y - this.font.height, renderer.width, this.font.offset);
        },

        text_set: function(text) {
            if (this.text !== text) {
                this.text = text;
                this.flag_set_needs_render();
            }
        }
    }
);

export default {
    RenderableText: RenderableText
}
