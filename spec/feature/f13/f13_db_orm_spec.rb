# coding: UTF-8

RSpec.describe 'f13_db_orm' do

  context 'db_orm', :db do
    context 'defines f13' do
      it 'passes ORM audit' do
        audit_feature(f13, 'f13', 0, '`∃` to alias concept of `does this(arg) exist?` and `∄` to mean inverse: `does this(arg) not exist?`')
      end
    end
  end

end
