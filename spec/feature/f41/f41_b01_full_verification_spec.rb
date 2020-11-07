# encoding: UTF-8

RSpec.describe 'f41_b01' do

  context 'locale tests for local-api{brew}', :locale do

    context 'locale brew has correct configs' do
      it 'w/ current version' do
        expect(🍺.version).to eq(["Homebrew 2.4.9-188-g36c10ed", "Homebrew/homebrew-core (git revision 62cbf; last commit 2020-11-05)", "Homebrew/homebrew-cask (git revision 97d5ff; last commit 2020-11-05)"])
      end
      it 'w/ helpful ENV VAR' do
        expect(ENV['HOMEBREW_NO_ANALYTICS']).to eq('1')
        expect(🍺.analytics?).to eq(false)
        expect(🍺.analytics_disabled?).to eq(true)
      end
      # TODO: FIX LATER
      #it 'passes health checks' do
      #  expect(🍺.healthy?).to eq(true)
      #end
    end

  end

end
