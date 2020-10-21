# encoding: UTF-8

RSpec.describe 'f22_db_orm' do

  context 'db_orm', :db do
    context 'defines f22' do
      it 'passes ORM audit' do
        audit_feature(f22, 'f22', 8, 'add a light abstraction to working w/ the built-in `GC` & `JIT` utilities')
      end

      context 'defines behaviors' do
        it 'has{b00}' do
          audit_feature_behavior(f22, f22_b00, 'b00', 'offer a light layer over `GC`')
        end

        it 'has{b01}' do
          audit_feature_behavior(f22, f22_b01, 'b01', 'offer a light layer over `JIT`')
        end

        it 'has{b02}' do
          audit_feature_behavior(f22, f22_b02, 'b02', 'offer a light layer over `OpenCL`')
        end

        it 'has{b03}' do
          audit_feature_behavior(f22, f22_b03, 'b03', 'offer a light layer over `OpenGL`')
        end

        it 'has{b04}' do
          audit_feature_behavior(f22, f22_b04, 'b04', 'offer a light layer over `GCC`')
        end

        it 'has{b05}' do
          audit_feature_behavior(f22, f22_b05, 'b05', 'offer a light layer of utilities to get-set various OS related information and values')
        end

        it 'has{b06}' do
          audit_feature_behavior(f22, f22_b06, 'b06', 'offer a light layer for comparing compiled `Ruby` code')
        end

        it 'has{b07}' do
          audit_feature_behavior(f22, f22_b07, 'b07', 'offer a light layer for setting preferred `MacOS` configs & settings')
        end
      end

    end
  end

end
