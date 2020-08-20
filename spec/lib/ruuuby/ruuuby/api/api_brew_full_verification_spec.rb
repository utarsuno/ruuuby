# encoding: UTF-8

RSpec.describe 'api_brew_optional_tests' do

  context 'locale tests for local-api{brew}', :locale do

    context 'locale brew has correct configs' do
      it 'w/ current version' do
        expect(🍺.version).to eq(["Homebrew 2.4.9-188-g36c10ed", "Homebrew/homebrew-core (git revision b5d1ec; last commit 2020-08-19)", "Homebrew/homebrew-cask (git revision e1f13; last commit 2020-08-19)"])
      end
      it 'w/ helpful ENV VAR' do
        expect(ENV['HOMEBREW_NO_ANALYTICS']).to eq('1')
        expect(🍺.analytics?).to eq(false)
        expect(🍺.analytics_disabled?).to eq(true)
      end
      it 'passes health checks' do
        expect(🍺.healthy?).to eq(true)
      end
    end

  end

end
