# coding: UTF-8

RSpec.describe 'f16_db' do

  context 'db', :db do
    context 'defines f16' do
      it 'passes ORM audit' do
        audit_feature(f16, 'f16', 'for specific classes, patch in the operation of raising to an exponent, using operator(`^`) w/ `superscripts`')
      end
    end
  end

end
