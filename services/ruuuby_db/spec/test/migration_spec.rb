# encoding: UTF-8

RSpec.describe 'db/db.rb' do
  let(:api){Ruuuby::MetaData.engine.orm.db_orm}

  context 'db_new', :db_new do

    before :all do
      @gems = CreateRuuubyGem.new
      @gems.down
    end

    context 'RuuubyGem' do
      context 'can be migrated up' do
        it 'w/o error' do
          expect{@gems.up}.to_not raise_error
        end
        it 'creating needed tables' do
          expect(api.∃table?('ruuuby_releases')).to eq(true)
          expect(api.∃table?('ruuuby_features')).to eq(true)
          expect(api.∃table?('ruuuby_feature_behaviors')).to eq(true)
          expect(api.∃table?('ruuuby_gems')).to eq(true)
          expect(api.∃table?('ruuuby_gem_changelogs')).to eq(true)
        end
        it 'creating needed functions' do

        end
      end
    end

  end

end
