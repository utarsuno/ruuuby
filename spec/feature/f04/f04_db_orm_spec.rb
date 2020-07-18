# encoding: UTF-8

RSpec.describe 'f04_db_orm' do

  context 'db_orm', :db do
    context 'defines f04' do
      it 'passes ORM audit' do
        audit_feature(f04, 'f04', 3, '`∅` to alias concept of `empty`')
      end

      context 'defines behaviors' do
        it 'defines{b00}' do
          audit_feature_behavior(f04, f04_b00, 'b00', 'Enumerable classes{ex: `Array`, `Set`, `String` have func{`∅?`}')
        end

        it 'defines{b01}' do
          audit_feature_behavior(f04, f04_b01, 'b01', "'class' ENV and class{NilClass} have func{`∅?`}")
        end

        it 'defines{b02}' do
          audit_feature_behavior(f04, f04_b02, 'b02', 'classes: `File` & `Dir` have func{`∅?`}')
        end
      end # end: {defines behaviors}
    end
  end

end
