# coding: UTF-8

RSpec.describe 'f97_db' do

  context 'db', :db do
    context 'feature{f97}' do
      it 'passes ORM audit' do
        audit_feature(f97, 'f97', 'offer custom builds of `Ruuuby` to support only the needed/wanted unicode/symbols/emojis etc')
      end
    end

  end

end
