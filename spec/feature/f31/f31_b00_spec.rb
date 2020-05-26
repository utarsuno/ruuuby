# coding: UTF-8

RSpec.describe 'f31_b00' do

  context 'feature{f31} functionality for' do

    context 'behavior{b00}' do

      it 'exists as needed' do
        the_ref = 💎.api_git
        the_id  = the_ref.🆔
        expect(the_ref.class).to eq(::Ruuuby::MetaData::GitAPI)
        expect(the_ref.🆔).to eq(::Ruuuby::MetaData::GitAPI.ℹ.🆔)
        expect(the_ref.🆔).to eq(the_id)
        expect(💎.api_git.🆔).to eq(the_ref.🆔)
      end

      context 'func{∃commit?}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(💎.api_git.∃commit?('43d3e4d52c4b12f97b0c94976dc9417c511e7f34')).to eq(true)
          end
          it 'cases: negative' do
            expect(💎.api_git.∃commit?('45d3e2d5224b12f97b0c945679c2524c511e7f81')).to eq(false)
          end
          it 'cases: error' do
            expect{💎.api_git.∃commit?(nil)}.to raise_error(ArgumentError)
            expect{💎.api_git.∃commit?(1)}.to raise_error(ArgumentError)
          end
        end
      end

      context 'func{fetch_commits_until}' do
        context 'handles needed scenarios' do

          context 'db', :db do
            #it 'cases: positive' do
            # TODO:
            #end
          end

          it 'cases: error' do
            expect{💎.api_git.fetch_commits_until(nil)}.to raise_error(ArgumentError)
            expect{💎.api_git.fetch_commits_until('45d3e2d5224b12f97b0c945679c2524c511e7f81')}.to raise_error(RuntimeError)
          end
        end
      end

    end # end: {behavior{b00}}

  end

end
