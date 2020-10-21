# encoding: UTF-8

RSpec.describe 'f23_db_orm' do

  context 'db_orm', :db do
    context 'defines{f23}' do
      it 'passes ORM audit' do
        audit_feature(f23, 'f23', 0,  "gather statistics (and/or more debugging information) on `Ruuuby` {example-context: optimizing ordering of if-conditions / function-calls}")
      end
    end
  end

end
