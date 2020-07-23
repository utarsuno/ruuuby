# encoding: UTF-8

RSpec.describe 'f40_b01' do
  context 'locale', :locale do
    context 'feature{f40}' do
      context 'behavior{b01}' do
        it 'func{healthy?} (currently) verifies local ENV VARs' do
          expect(💎.engine.api_locale.api_docker.healthy?).to eq(true)
        end
      end
    end
  end
end
