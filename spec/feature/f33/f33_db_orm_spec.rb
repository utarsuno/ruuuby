# coding: UTF-8

RSpec.describe 'f33_db_orm' do

  context 'db_orm', :db do

    context 'defines{f33}' do
      it 'passes ORM audit' do
        audit_feature(f33, 'f33', 0, 'abstract `Combinatorics`; offering static math functions')
      end

    end # end: {defines{f33}}

  end

end
