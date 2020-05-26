# coding: UTF-8

RSpec.describe 'f16_db' do

  context 'db', :db do
    context 'defines f16' do
      it 'passes ORM audit' do
        audit_feature(f16, 'f16', "add operation: raising to exponents (`superscript`) via operator(`^`) on `Numeric`'s")
      end
    end
  end

end
