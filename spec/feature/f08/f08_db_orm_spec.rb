# encoding: UTF-8

RSpec.describe 'f08_db_orm' do

  context 'db_orm', :db do
    context 'defines f08' do
      it 'passes ORM audit' do
        audit_feature(f08, 'f08', 0, 'enable quick clean-up, editing, etc functions for `enumerables` (including `String`)')
      end
    end
  end

end
