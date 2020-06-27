# coding: UTF-8

RSpec.describe 'f98_b00' do

  context 'feature{f98} for', :locale do
    context '{b00}' do
      it 'has{gnu11} correctly marked' do
        expect(💎.engine.cached_info.∋?('w/ compiler{gnu11}')).to eq(true)
      end
    end
  end

end
