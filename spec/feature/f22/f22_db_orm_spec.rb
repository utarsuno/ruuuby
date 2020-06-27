# coding: UTF-8

RSpec.describe 'f22_db_orm' do

  context 'db_orm', :db do
    context 'defines f22' do
      it 'passes ORM audit' do
        audit_feature(f22, 'f22', 5, 'add a light abstraction to working w/ the built-in `GC` & `JIT` utilities')
      end

      context 'defines behaviors' do
        it 'has{b00}' do
          audit_feature_behavior(f22, f22_b00, 'b00', 'offers a light layer over `GC`')
        end

        it 'has{b01}' do
          audit_feature_behavior(f22, f22_b01, 'b01', 'offers a light layer over `JIT`')
        end

        it 'has{b02}' do
          audit_feature_behavior(f22, f22_b02, 'b02', 'offers a light layer over `OpenCL`')
        end

        it 'has{b03}' do
          audit_feature_behavior(f22, f22_b03, 'b03', 'offers a light layer over `OpenGL`')
        end

        it 'has{b04}' do
          audit_feature_behavior(f22, f22_b04, 'b04', 'offers a light layer over `GCC`')
        end
      end

    end
  end

end
