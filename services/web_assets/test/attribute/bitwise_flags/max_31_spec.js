
import chai from 'chai';
let expect = chai.expect;

import AttributeFlags31 from "../../../src/attribute/bitwise_flags/max_31.js"

let MockAttributeBitwiseFlags31 = function() {
    this._flags31 = new Uint32Array(1);
};
Object.assign(
    MockAttributeBitwiseFlags31.prototype,
    AttributeFlags31.AttributeFlags31.prototype,
    {}
);

let mock31 = new MockAttributeBitwiseFlags31();

let expect_flag_on = function(mock, flag) {
    expect(mock.flag_is_on(flag)).to.equal(true);
    expect(mock.flag_is_off(flag)).to.equal(false);
};

let expect_flag_off = function(mock, flag) {
    expect(mock.flag_is_off(flag)).to.equal(true);
    expect(mock.flag_is_on(flag)).to.equal(false);
};

describe('AttributeBitwiseFlags31', function() {

    it('can toggle flag{1}', function() {
        mock31.flag_set_off(1);
        expect_flag_off(mock31, 1);
        mock31.flag_set_on(1);
        expect_flag_on(mock31, 1);

        mock31.flag_set(1, false);
        expect_flag_off(mock31, 1);
        mock31.flag_set(1, true);
        expect_flag_on(mock31, 1);
    }),

    it('can toggle flag{31}', function() {
        mock31.flag_set_off(1073741824);
        expect_flag_off(mock31, 1073741824);
        mock31.flag_set_on(1073741824);
        expect_flag_on(mock31, 1073741824);

        mock31.flag_set(1073741824, false);
        expect_flag_off(mock31, 1073741824);
        mock31.flag_set(1073741824, true);
        expect_flag_on(mock31, 1073741824);
    }),

    it('can toggle flags{2-30}', function() {
        let i;
        let decimal_value = 2;
        for (i = 2; i < 30; i++) {
            mock31.flag_set_off(decimal_value);
            expect_flag_off(mock31, decimal_value);
            mock31.flag_set_on(decimal_value);
            expect_flag_on(mock31, decimal_value);

            mock31.flag_set(decimal_value, false);
            expect_flag_off(mock31, decimal_value);
            mock31.flag_set(decimal_value, true);
            expect_flag_on(mock31, decimal_value);
            decimal_value *= 2;
        }
    }),

    it('func{flags_are_same} works', function() {
        mock31.flag_set_off(2);
        mock31.flag_set_on(1073741824);
        mock31.flag_set_on(33554432);
        mock31.flag_set_off(4);
        mock31.flag_set_on(256);

        expect(mock31.flags_are_same(2, 4)).to.equal(true);
        expect(mock31.flags_are_same(1073741824, 33554432)).to.equal(true);

        expect(mock31.flags_are_same(256, 33554432)).to.equal(true);
        expect(mock31.flags_are_same(256, 1073741824)).to.equal(true);
    }),

    it('func{flags_are_on} works', function() {
        mock31.flag_set_on(65536);
        mock31.flag_set_on(4194304);
        mock31.flag_set_off(1073741824);
        mock31.flag_set_off(33554432);

        expect(mock31.flags_are_on(65536, 4194304)).to.equal(true);

        expect(mock31.flags_are_on(1073741824, 33554432)).to.equal(false);
        expect(mock31.flags_are_on(65536, 33554432)).to.equal(false);
        expect(mock31.flags_are_on(1073741824, 65536)).to.equal(false);
        expect(mock31.flags_are_on(4194304, 33554432)).to.equal(false);
        expect(mock31.flags_are_on(1073741824, 4194304)).to.equal(false);
    }),

    it('func{flags_are_off} works', function() {
        mock31.flag_set_on(65536);
        mock31.flag_set_on(4194304);
        mock31.flag_set_off(1073741824);
        mock31.flag_set_off(33554432);

        expect(mock31.flags_are_off(1073741824, 33554432)).to.equal(true);

        expect(mock31.flags_are_off(65536, 4194304)).to.equal(false);
        expect(mock31.flags_are_off(65536, 33554432)).to.equal(false);
        expect(mock31.flags_are_off(1073741824, 65536)).to.equal(false);
        expect(mock31.flags_are_off(4194304, 33554432)).to.equal(false);
        expect(mock31.flags_are_off(1073741824, 4194304)).to.equal(false);
    }),

    it('func{flags_are_either_on} works', function() {
        mock31.flag_set_on(65536);
        mock31.flag_set_on(4194304);
        mock31.flag_set_off(1073741824);
        mock31.flag_set_off(33554432);

        expect(mock31.flags_are_either_on(65536, 4194304)).to.equal(true);
        expect(mock31.flags_are_either_on(65536, 33554432)).to.equal(true);
        expect(mock31.flags_are_either_on(1073741824, 65536)).to.equal(true);
        expect(mock31.flags_are_either_on(4194304, 33554432)).to.equal(true);
        expect(mock31.flags_are_either_on(1073741824, 4194304)).to.equal(true);

        expect(mock31.flags_are_either_on(1073741824, 33554432)).to.equal(false);
    })
});
