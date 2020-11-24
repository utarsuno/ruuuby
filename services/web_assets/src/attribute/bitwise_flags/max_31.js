
/**
 * supports a maximum of 31 unique keys
 */
const AttributeBitwiseFlags31     = function(){};
AttributeBitwiseFlags31.prototype = {

    /**
     *
     */
    flags_clear: function() {
        this._flags31[0] = 0;
    },

    /**
     * @param {number}  flag_number
     * @param {boolean} b
     */
    flag_set: function(flag_number, b) {
        if (b) {
            this._flags31[0] |= flag_number;
        } else {
            this._flags31[0] &= (~flag_number);
        }
    },

    /**
     * @param {number} flag_number
     */
    flag_set_off: function(flag_number) {
        this._flags31[0] &= (~flag_number);
    },

    /**
     * @param {number} flag_number
     */
    flag_set_on: function(flag_number) {
        this._flags31[0] |= flag_number;
    },

    /**
     * @param {number} flag_number
     *
     * @return {boolean}
     */
    flag_is_off: function(flag_number) {
        return (this._flags31[0] & flag_number) === 0;
    },

    /**
     * @param {number} flag_number
     *
     * @return {boolean}
     */
    flag_is_on: function(flag_number) {
        return (this._flags31[0] & flag_number) > 0;
    },

    /**
     * @param {number} f0
     * @param {number} f1
     *
     * @return {boolean}
     */
    flags_are_same: function(f0, f1) {
        return ((this._flags31[0] & (f0 | f1)) === (f0 | f1)) || ((this._flags31[0] & f0) + (this._flags31[0] & f1) === 0);
    },

    /**
     * @param {number} f0
     * @param {number} f1
     *
     * @return {boolean}
     */
    flags_are_on: function(f0, f1) {
        return (this._flags31[0] & (f0 | f1)) === (f0 | f1);
    },

    /**
     * @param {number} f0
     * @param {number} f1
     *
     * @return {boolean}
     */
    flags_are_off: function(f0, f1) {
        return (this._flags31[0] & f0) + (this._flags31[0] & f1) === 0;
    },

    /**
     * @param {number} f0
     * @param {number} f1
     *
     * @return {boolean}
     */
    flags_are_either_on: function(f0, f1) {
        return (this._flags31[0] & (f0 | f1)) > 0;
    },
};

export default {
    AttributeFlags31: AttributeBitwiseFlags31
}

