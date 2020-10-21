# encoding: UTF-8

RSpec.describe 'f11_db_orm' do

  context 'db_orm', :db do
    context 'defines f11' do
      it 'passes ORM audit' do
        audit_feature(f11, 'f11', 3, 'abstract `SetTheory` and offer discrete singleton objs which reference various groups of numbers')
      end

      context 'defines behaviors' do
        it 'has b00' do
          audit_feature_behavior(f11, f11_b00, 'b00', 'create module{SetTheory}')
        end

        it 'has b01' do
          audit_feature_behavior(f11, f11_b01, 'b01', 'create class{Closure}')
        end

        it 'has b02' do
          audit_feature_behavior(f11, f11_b02, 'b02', 'create class{NumberSet}')
        end
      end
    end
  end

end
