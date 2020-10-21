# encoding: UTF-8

::RSpec.describe 'f98_b00' do

  context 'feature{f98} for', :locale do
    context '{b00}' do
      it 'has{gnu11} correctly marked' do
        expect(💎.engine.stats_ext['compiler']).to eq('gnu11')
      end
    end
  end

end
