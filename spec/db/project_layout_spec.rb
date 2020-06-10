# encoding: UTF-8

RSpec.describe 'db/seed.rb' do

  context 'db', :db do

    context 'general file expectations' do
      it 'only 1 file exists w/ extensions{.gemspec}' do
        expect(::RuuubyFile.where('extensions = ?', '.gemspec').all.length).to eq(1)
      end
    end

  end
end
