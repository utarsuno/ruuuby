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

    end # end: {behavior{b00}}

  end

end
