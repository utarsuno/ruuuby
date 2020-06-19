# coding: UTF-8

RSpec.describe 'f97_db_orm' do

  context 'db_orm', :db do
    context 'feature{f97}' do
      it 'passes ORM audit' do
        audit_feature(f97, 'f97', 0, 'offer custom builds of `Ruuuby` to support only the needed/wanted unicode/symbols/emojis etc')
      end
    end

  end

end
