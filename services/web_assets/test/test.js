/**
 * @see https://threejs.org/docs/#manual/en/buildTools/Testing-with-NPM
 */

var THREE  = require('three');
var chai   = require('chai');
var expect = chai.expect;

describe('The THREE object', function() {
    it('should have a defined BasicShadowMap constant', function() {
        expect('undefined').to.not.equal(THREE.BasicShadowMap);
    }),
    it('default constructor for{Vector3}', function() {
        let vec = new THREE.Vector3();
        expect(vec.x).to.equal(0);
        expect(vec.y).to.equal(0);
        expect(vec.z).to.equal(0);
    })
});
