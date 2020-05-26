# coding: UTF-8

RSpec.describe 'f08_db' do

  context 'db', :db do
    context 'defines f08' do
      it 'passes ORM audit' do
        audit_feature(f08, 'f08', 'enable quick editing functions for `enumerables` (& `String`)')
      end
    end
  end

end
