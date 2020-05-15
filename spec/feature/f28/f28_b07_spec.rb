# coding: UTF-8

RSpec.describe 'f28' do
  context 'functionality' do
    context 'angle tau' do
      context 'has correct value' do
        it 'τ == 360°' do
          expect(τ).to eq(θ°(360))
        end
      end
    end # end: {angle tau}
  end
end
