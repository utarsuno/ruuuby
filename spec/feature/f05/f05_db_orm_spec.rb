# encoding: UTF-8

RSpec.describe 'f05_db_orm' do

  context 'db_orm', :db do
    context 'defines{f05}' do
      it 'passes ORM audit' do
        audit_feature(f05, 'f05', 2, '`>>` to offer reverse functionality of `<<`')
      end

      context 'defines behaviors' do
        it 'defines{b00}' do
          audit_feature_behavior(f05, f05_b00, 'b00', 'offer func{>>} to class(`Array`)')
        end

        it 'defines{b01}' do
          audit_feature_behavior(f05, f05_b01, 'b01', 'offer func{>>} to class(`String`)')
        end
      end # end: {defines behaviors}
    end
  end

end
