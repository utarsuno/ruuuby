# encoding: UTF-8

RSpec.describe 'f42_db_orm' do
  context 'db_orm', :db do
    context 'defines{f42}' do
      it 'passes ORM audit' do
        audit_feature(f42, 'f40', 2, 'provide an `API` for `RabbitMQ` operations w/ a light layer over gem{`bunny`}')
      end
    end # end: {defines{f42}}
  end
end
