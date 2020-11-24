# encoding: UTF-8

::RSpec.describe 'f98_b00' do

  context 'feature{f98} for', :locale do
    context '{b00}' do
      it 'has compiler-standard{gnu11} correctly marked' do
        expect(💎.engine.stats_ext['compiler']['standard']).to eq('gnu11')
      end
      it 'has compiler{apple} correctly marked' do
        expect(💎.engine.stats_ext['compiler']['name']).to eq('apple')
      end
      it 'has compiler-version{12.0.0} correctly marked' do
        expect(💎.engine.stats_ext['compiler']['version']).to eq('12.0.0')
      end
    end
  end

end
