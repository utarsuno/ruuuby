# coding: utf-8

RSpec.describe 'db/db.rb' do
  before :all do
    require_relative '../../db/seed'
  end

  let(:v0_0_0){RuuubyRelease.first}
  let(:v0_0_1){RuuubyRelease.all[1]}
  let(:v0_0_2){RuuubyRelease.all[2]}
  let(:v0_0_3){RuuubyRelease.all[3]}
  #let(:v0_0_4){RuuubyRelease.all[4]}
  let(:v0_0_18){RuuubyRelease.all[-1]}

  context 'static search functions work' do
    context 'RuuubyRelease' do
      it 'by_version' do
        expect(RuuubyRelease.by_version(0, 0, 0)).to eq(v0_0_0)
        expect(RuuubyRelease.by_version(0, 0, 1)).to eq(v0_0_1)
        expect(RuuubyRelease.by_version(0, 0, 2)).to eq(v0_0_2)
        expect(RuuubyRelease.by_version(0, 0, 3)).to eq(v0_0_3)
        #expect(RuuubyRelease.by_version(0, 0, 4)).to eq(v0_0_4)
        expect(RuuubyRelease.by_version(0, 0, 18)).to eq(v0_0_18)
      end
    end
  end

  context 'defines expected schemas' do

    it 'has needed tables' do
      expect(ActiveRecord::Schema.connection.tables).to eq(ActiveRecord::Base.connection.tables)
      db_tables = ActiveRecord::Base.connection.tables
      %w(ruuuby_releases ruuuby_features ruuuby_changelogs).each do |needed_table|
        expect(db_tables.∋?(needed_table)).to eq(true)
      end
    end

  end

end
