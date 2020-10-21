// -------------------------------------------- ⚠️ --------------------------------------------
// testing purposes
// -------------------------------------------- ⚠️ --------------------------------------------

import {BoxGeometry, MeshBasicMaterial, Mesh, Clock} from 'three';
import EngineRenderer from "./renderer.js"

import HUD from "./hud/hud.js"

import AttributeFlags31 from "../attribute/bitwise_flags/max_31.js"

let Engine = function() {
    this._delta_clock = new Clock(false);

    this._flags31 = new Uint32Array(2);
    this._floats  = new Float32Array(9);

    this._frame_iteration = 0;
    this._frames_passed   = 0;
    this._fps             = 0;

    this.cube = null;

    this.engine_main_loop = this._engine_loop.bind(this);
};

Object.assign(
    Engine.prototype,
    AttributeFlags31.AttributeFlags31.prototype,
    {

        _engine_loop: function() {
            requestAnimationFrame(this.engine_main_loop);

            this._delta = this._delta_clock.getDelta();
            this._floats[ENGINE_FINDEX_DELTA_ELAPSED_SECOND] += this._delta;
            this._floats[ENGINE_FINDEX_DELTA_ELAPSED_RENDER] += this._delta;

            if (this._floats[ENGINE_FINDEX_DELTA_ELAPSED_SECOND] >= 1.0) {
                this._frames_passed                              = Math.floor(this._floats[ENGINE_FINDEX_DELTA_ELAPSED_SECOND]);
                this._floats[ENGINE_FINDEX_DELTA_ELAPSED_SECOND] -= this._frames_passed;
                this.hud.set_fps(this._floats[ENGINE_FINDEX_FPS_COUNTER]);
                this._floats[ENGINE_FINDEX_FPS_COUNTER]           = 0;

                this.hud.render(this.hud);

                //this.hud_date_time.content_update();
                //this.hud_date_time.update();
            }

            if (this._floats[ENGINE_FINDEX_DELTA_ELAPSED_RENDER] >= FPS_RENDER) {
                this._frames_passed = Math.floor(this._floats[ENGINE_FINDEX_DELTA_ELAPSED_RENDER] / FPS_RENDER);

                this._floats[ENGINE_FINDEX_DELTA_ELAPSED_RENDER] -= this._frames_passed * FPS_RENDER;
                this.render(this._frames_passed * FPS_RENDER);
                this._floats[ENGINE_FINDEX_FPS_COUNTER]          += 1;
            }

            this._delta_clock.start();
        },

        run: function() {
            this.hud      = new HUD.HUD('b');
            this.renderer = new EngineRenderer.EngineRenderer('a', this.hud);

            var geometry = new BoxGeometry();
            var material = new MeshBasicMaterial( { color: 0x00ff00 } );
            this.cube = new Mesh( geometry, material );
            this.renderer.scene.add( this.cube );

            this.renderer.camera.position.z = 5;
            this.renderer.camera.position.y += 2;

            this._engine_loop();
        },

        physics: function(delta) {
            this.cube.rotation.x += 0.01;
            this.cube.rotation.y += 0.01;
        },

        render: function(delta) {
            this.physics(delta);
            this.renderer.render();
        },

        stats: function() {
            return {
                'elapsed_delta_render': this._floats[ENGINE_FINDEX_DELTA_ELAPSED_RENDER]
            }
        }

    }
);

export default {
    Engine: Engine
}
