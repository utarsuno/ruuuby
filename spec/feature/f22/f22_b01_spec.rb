# encoding: UTF-8

RSpec.describe 'f22_b01' do

  context 'locale', :locale do
    let(:build_configs){::RbConfig::CONFIG}

    context 'feature{f22}' do
      context 'behavior{b01}: Just-In-Time-Compiler{JIT}' do
        it 'is enabled if ENV_VAR{RUBYOPT} contains{--jit}' do
          expected_result = ENV.fetch🔑('RUBYOPT', '').∋?('--jit')
          expect(💎.engine.jit.enabled?).to eq(expected_result)
        end
      end
    end

    context 'Just-In_Time compiler{JIT} is supported' do
      context 'as defined through build-settings{::RbConfig}' do
        it 'built w/ jit enabled' do
          expect(build_configs['MJIT_SUPPORT']).to eq('yes')
        end
        it 'built w/ correct path for{clang}' do
          expect(build_configs['MJIT_CC']).to eq("#{💻('which clang')} -fdeclspec")
        end
      end
    end # end: {Just-In_Time compiler{JIT} is supported}

  end

end
