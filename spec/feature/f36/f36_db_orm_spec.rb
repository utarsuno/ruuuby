# coding: UTF-8

RSpec.describe 'f36_db_orm' do

  context 'db_orm', :db do

    context 'defines{f36}' do
      it 'passes ORM audit' do
        audit_feature(f36, 'f36', 0, 'add new class (`TimeSeriesData`) for easier operations involving multi-sample based stats')
      end

    end # end: {defines{f36}}

  end

end
