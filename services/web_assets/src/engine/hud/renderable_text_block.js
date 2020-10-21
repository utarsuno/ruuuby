// -------------------------------------------- ⚠️ --------------------------------------------
// testing purposes
// -------------------------------------------- ⚠️ --------------------------------------------

import {Vector2} from 'three';

import RenderableText from './renderable_text';
import AttributeRenderable from '../../attribute/renderable.js';

/**
 * @param renderer
 * @param {float,number} x
 * @param {float,number} y
 * @param {Font2D}      font
 *
 * @constructor
 */
let RenderableTextBlock = function(renderer, x, y, font) {
    this.attribute_renderable(renderer);
    this.position = new Vector2(x, y);
    this.rows     = [];
    this.font     = font;
    this.max_row  = 0;
};

Object.assign(
    RenderableTextBlock.prototype,
    AttributeRenderable.AttributeRenderable.prototype,
    {

        h: function() {
            let r;
            let height = 0;
            for (r = 0; r < this.rows.length; r++) {
                height += this.rows[r].font.offset;
            }
            return height;
        },

        get_row: function(row_index) {
            while (row_index + 1 > this.max_row) {
                let renderable_text = this.create_row();
                this.rows.push(renderable_text);
                this.renderable_add(renderable_text);
            }
            return this.rows[row_index];
        },

        create_row: function() {
            this.max_row += 1;
            return new RenderableText.RenderableText(this, this.position.x + 0, this.position.y + (this.max_row* this.font.offset) - this.font.padding, this.font, 'null');
        },

        render: function(renderer) {
            renderer.set_color(this.font.color);
            renderer.set_font(this.font);
            if (this.flag_needs_render) {
                this.clear_all(renderer);
                this.render_all(renderer);
            } else {
                this.render_pass(renderer);
            }
        },

        clear: function(renderer) {
            this.clear_all(renderer);
        },
    }
);

export default {
    RenderableTextBlock: RenderableTextBlock
}
