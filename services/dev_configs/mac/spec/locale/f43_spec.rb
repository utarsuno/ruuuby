# encoding: UTF-8

RSpec.describe 'ruby' do
  context 'locale', :preferences do

    context 'recommended settings for {iconv}' do
      it 'passes all health checks' do
        expect(💎.engine.api_locale.api_iconv.healthy?).to eq(true)
      end
      it 'has needed version{1.11}' do
        expect_needed_version(💎.engine.api_locale.api_iconv, 'iconv (GNU libiconv 1.11)')
      end
      it 'supports needed encoding{UTF-8}' do
        expect(💎.engine.api_locale.api_iconv.∃_encoding?('UTF-8')).to eq(true)
      end
    end

  end
end
