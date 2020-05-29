# coding: UTF-8

RSpec.describe 'f03_db' do

  context 'db', :db do
    context 'defines f03' do
      it 'passes ORM audit' do
        audit_feature(f03, 'f03', "`𝔠` to alias concept of `cardinality`")
      end
    end
  end

end
