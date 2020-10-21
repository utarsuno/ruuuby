// -------------------------------------------- ⚠️ --------------------------------------------
// testing purposes
// -------------------------------------------- ⚠️ --------------------------------------------

/**
 * @param {string}      str
 * @param {float,number} height
 * @param {float,number} padding
 * @param {string}      color
 *
 * @constructor
 */
let Font2D = function(str, height, padding, color) {
    this.font    = str;
    this.height  = height;
    this.padding = padding;
    this.offset  = this.height + this.padding;
    this.color   = color;
};

Object.assign(
    Font2D.prototype,
    {

    }
);

export default {
    Font2D: Font2D
}
