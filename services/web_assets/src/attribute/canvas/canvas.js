
let AttributeCanvas = function(){};

Object.assign(
    AttributeCanvas.prototype,
    {
        /**
         * @private
         *
         * @param {string} canvas_id
         */
        _set_canvas: function(canvas_id) {
            this.canvas = document.getElementById(canvas_id);
            if (!(this.canvas)) {
                throw new Error(`unable to find canvas w/ id{${canvas_id}}`);
            }
        },
    }
);

export default {AttributeCanvas: AttributeCanvas}
