# coding: UTF-8

RSpec.describe 'f22' do

  context 'locale', :locale do
    context 'feature{f22}' do

      context 'GC' do

        it 'is not overclocked' do
          expect(💎.engine.gc.overclocked?).to eq(false)
        end

      end

      context 'Profiler' do

        it 'is disabled' do
          expect(💎.engine.gc.profiler?).to eq(false)
        end

      end

    end
  end

end
