# coding: UTF-8

RSpec.describe 'f30_b03' do

  context 'feature{f30} functionality for' do
    context 'behavior{b03}' do
      it 'exists as needed' do
        the_ref = 🔢
        the_id  = the_ref.🆔
        expect(the_ref.class).to eq(::Math::Space::NumberLikeSpace)
        expect(the_ref.🆔).to eq(::Math::Space::NumberLikeSpace.ℹ.🆔)
        expect(the_ref.🆔).to eq(the_id)
        expect(🔢.🆔).to eq(the_ref.🆔)
      end
    end
  end

end
