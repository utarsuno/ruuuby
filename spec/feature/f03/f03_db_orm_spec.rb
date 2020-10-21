# encoding: UTF-8

RSpec.describe 'f03_db_orm' do

  context 'db_orm', :db do
    context 'defines f03' do
      it 'passes ORM audit' do
        audit_feature(f03, 'f03', 0, "`𝔠` to alias concept of `cardinality`")
      end
    end
  end

end
