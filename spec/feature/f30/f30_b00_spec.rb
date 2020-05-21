# coding: UTF-8

RSpec.describe 'f30_b00' do

  context 'feature{f30} functionality for' do
    context 'behavior{b00}' do
      it 'exists as needed' do
        the_ref = 🅱
        the_id  = the_ref.🆔
        expect(the_ref.class).to eq(::Math::Space::BooleanLikeSpace)
        expect(the_ref.🆔).to eq(::Math::Space::BooleanLikeSpace.ℹ.🆔)
        expect(the_ref.🆔).to eq(the_id)
        expect(🅱.🆔).to eq(the_ref.🆔)
      end
    end
  end

end
