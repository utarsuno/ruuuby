# encoding: UTF-8

RSpec.describe 'api_brew' do

  context 'system tests for local-api{brew}', :system do
    it 'brew-api passes state tests w/ all functions dealing with analytics' do
      if 🍺.analytics_disabled?
        expect(ENV['HOMEBREW_NO_ANALYTICS']).to eq('1')
        expect(🍺.analytics?).to eq(false)
        expect{🍺.analytics_set_off}.to raise_error(::RuntimeError)
        expect{🍺.analytics_set_on}.to raise_error(::RuntimeError)
      else
        # 0x0)
        🍺.analytics_set_off
        expect(🍺.analytics?).to eq(false)
        🍺.analytics_set_off
        expect(🍺.analytics?).to eq(false)

        # 0x3)
        (rand(3)+1).times{expect(🍺.analytics?).to eq(false)}
        # 0x1)
        🍺.analytics_set_on
        expect(🍺.analytics?).to eq(true)
        # 0x3)
        (rand(3)+1).times{expect(🍺.analytics?).to eq(true)}

        🍺.analytics_set_off
        expect(🍺.analytics?).to eq(false)
        # 0x3)
        (rand(3)+1).times{expect(🍺.analytics?).to eq(false)}

        # 0x2)
        🍺.analytics_set_on
        expect(🍺.analytics?).to eq(true)
        🍺.analytics_set_on
        expect(🍺.analytics?).to eq(true)

        # 0x3)
        (rand(3)+1).times{expect(🍺.analytics?).to eq(true)}
      end
    end
  end # end: {system}

  context 'audits for brew', :audit do
    it 'has alias{🍺}' do
      expect(🍺).to eq(::Ruuuby::MetaData.engine.api_locale.api_brew)
    end

    it 'has alternative alias{💎.engine.api_locale.api_brew}' do
      expect(💎.engine.api_locale.api_brew).to eq(::Ruuuby::MetaData.engine.api_locale.api_brew)
      expect(💎.engine.api_locale.api_brew).to eq(🍺)
    end
  end # end: {audits}

end
