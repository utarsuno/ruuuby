# coding: UTF-8

RSpec.describe 'f95_db' do

  context 'db', :db do
    context 'feature{f95}' do
      it 'passes ORM audit' do
        audit_feature(f95, 'f95', 'enable pure a `Ruby` only build')
      end
    end

  end

end
