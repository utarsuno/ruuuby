
// -------------------------------------------- ⚠️ --------------------------------------------
// testing purposes
// -------------------------------------------- ⚠️ --------------------------------------------

let AttributeRenderable = function(){};
Object.assign(
    AttributeRenderable.prototype,
    {
        attribute_renderable: function(parent_renderable) {
            this.parent           = parent_renderable;
            this.flag_needs_render = false;
            this.renderables      = null;
            this.num_renderable   = 0;
        },

        render_pass: function(renderer) {
            let r;
            for (r = 0; r < this.num_renderable; r++) {
                if (this.renderables[r].flag_needs_render) {
                    this.renderables[r].clear(renderer);
                    this.renderables[r].render(renderer);
                    if (this.renderables[r].num_renderable !== 0) {
                        this.renderables[r].render_pass(renderer);
                    }
                    this.renderables[r].flag_needs_render = false;
                }
            }
        },

        clear_all: function(renderer) {
            let r;
            for (r = 0; r < this.num_renderable; r++) {
                this.renderables[r].clear(renderer);
            }
        },

        render_all: function(renderer) {
            let r;
            for (r = 0; r < this.num_renderable; r++) {
                this.renderables[r].render(renderer);
                if (this.renderables[r].num_renderable !== 0) {
                    this.renderables[r].render_all(renderer);
                }
            }
        },

        renderable_add: function(renderable) {
            if (this.renderables === null) {
                this.renderables = [];
            }
            this.renderables.push(renderable);
            this.num_renderable++;
            return this;
        },

        is_root: function() {
            return this.parent === this;
        },

        has_renderables: function() {
            return this.num_renderable !== 0;
        },

        flag_set_needs_render: function() {
            this.parent.flag_needs_render = true;
            this.flag_needs_render        = true;
        },
    }
);

export default {AttributeRenderable: AttributeRenderable}
