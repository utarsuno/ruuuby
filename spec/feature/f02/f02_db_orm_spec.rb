# encoding: UTF-8

RSpec.describe 'f02_db_orm' do

  context 'db_orm', :db do
    context 'feature{f02}' do
      it 'passes ORM audit' do
        audit_feature(f02, 'f02', 0, 'augment working with other `API` sets, be it a small `CLI script` to larger `domain-driven/micro-services` representations')
      end
    end
  end

end
