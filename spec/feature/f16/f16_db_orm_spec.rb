# coding: UTF-8

RSpec.describe 'f16_db_orm' do

  context 'db_orm', :db do
    context 'defines f16' do
      it 'passes ORM audit' do
        audit_feature(f16, 'f16', 0, 'for specific classes, patch in the operation of raising to an exponent, using operator(`^`) w/ `superscripts`')
      end
    end
  end

end
