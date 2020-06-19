# coding: UTF-8

RSpec.describe 'f01_db_orm' do

  context 'db_orm', :db do
    context 'feature{f01}' do
      it 'passes ORM audit' do
        audit_feature(f01, 'f01', 6, 'simplify debugging state & logging through the `RuuubyEngine`')
      end
    end

    context 'defines behaviors' do
      it 'defines{b00}' do
        audit_feature_behavior(f01, f01_b00, 'b00', 'supports mode: none (empty methods called for logging)')
      end

      it 'defines{b01}' do
        audit_feature_behavior(f01, f01_b01, 'b01', 'supports mode: stdout (log to console)')
      end

      it 'defines{b02}' do
        audit_feature_behavior(f01, f01_b02, 'b02', 'supports mode: stderr (log only errors to console)')
      end

      it 'defines{b03}' do
        audit_feature_behavior(f01, f01_b03, 'b03', 'supports mode: file (standard Ruby log file logging)')
      end

      it 'defines{b04}' do
        audit_feature_behavior(f01, f01_b04, 'b04', 'supports setting the logging level')
      end

      it 'defines{b05}' do
        audit_feature_behavior(f01, f01_b05, 'b05', 'supports running a hybrid of logging modes')
      end
    end

  end

end
