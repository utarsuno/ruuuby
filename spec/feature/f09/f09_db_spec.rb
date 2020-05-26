# coding: UTF-8

RSpec.describe 'f09_db' do

  context 'db', :db do
    context 'defines f09' do
      it 'passes ORM audit' do
        audit_feature(f09, 'f09', 'add math `set operations` (especially for `enumerables` & `String`)')
      end
    end
  end

end
