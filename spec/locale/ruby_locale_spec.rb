# encoding: UTF-8

RSpec.describe 'ruby' do

  context 'locale', :locale do
    let(:build_configs){::RbConfig::CONFIG}

    context 'general configs for{Ruby}' do

      context 'version' do
        it 'w/ globals' do
          expect(RUBY_VERSION).to eq('2.7.1')
          expect(RUBY_PATCHLEVEL).to eq(83)
          expect(RUBY_REVISION).to eq('a0c7c23c9cec0d0ffcba012279cd652d28ad5bf3')
        end
        it 'w/ needed ENV_VARs set' do
          expect(ENV['RBENV_VERSION']).to eq(RUBY_VERSION)
        end
        it 'w/ build configs' do
          expect(build_configs['MAJOR']).to eq('2')
          expect(build_configs['MINOR']).to eq('7')
          expect(build_configs['TEENY']).to eq('1')
          expect(build_configs['RUBY_API_VERSION']).to eq('2.7')
          expect(build_configs['RUBY_PROGRAM_VERSION']).to eq('2.7.1')
          expect(build_configs['PATCHLEVEL']).to eq('83')
        end
        it 'w/ rubygems' do
          expect(::Gem.extension_api_version).to eq('2.7.0')
        end
      end # end: {version}

      context 'unicode configs' do
        context 'w/ build settings' do
          it 'w/ build settings' do
            expect(build_configs['UNICODE_VERSION']).to eq('12.1.0')
            expect(build_configs['UNICODE_EMOJI_VERSION']).to eq('12.1')
          end
          context 'verified w/ runtime values' do
            it 'w/ __ENCODING__' do
              expect(__ENCODING__).to eq(::Encoding::UTF_8)
            end
            it 'w/ Encoding.default_external' do
              expect(::Encoding.default_external).to eq(::Encoding::UTF_8)
            end
            it 'w/ Encoding.default_internal' do
              expect(::Encoding.default_internal).to eq(nil)
            end
          end
        end
      end # end: {unicode configs}

      context 'runtime configs' do
        it 'is currently not using safe mode' do
          # @see https://docs.ruby-lang.org/en/2.6.0/security_rdoc.html#label-24SAFE
          expect($SAFE).to eq(0)
        end
        context 'rubygems' do
          it 'has correct dependency categories{:development, :runtime}' do
            expect(::Gem::Dependency::TYPES.≈≈([:development, :runtime])).to eq(true)
          end
        end
      end # end: {runtime configs}

      context 'architecture build configs are as expected{mac, 64-bit}' do
        context 'os, platform, & 64-bit CPU specified' do
          it 'as defined through global{RUBY_PLATFORM}' do
            expect(RUBY_PLATFORM).to eq('x86_64-darwin18')
          end
          it 'platform' do
            expect(::Gem::Platform.local.os).to eq('darwin')
            expect(::Etc.uname[:sysname]).to eq('Darwin')
          end
          it 'cpu' do
            expect(::Etc.uname[:machine]).to eq('x86_64')
            expect(::Gem::Platform.local.cpu).to eq('x86_64')
            expect(build_configs.∀🔑∃_value?(%w(target_cpu host_cpu build_cpu), 'x86_64')).to eq(true)
          end
          it 'as defined through build-settings{::RbConfig}' do
            expect(build_configs['host_os']).to eq('darwin18.7.0')
            expect(build_configs['host_vendor']).to eq('apple')
            expect(build_configs['target']).to eq('x86_64-apple-darwin18')
            expect(build_configs['build']).to eq('x86_64-apple-darwin18.7.0')
          end
          it 'needed ENV_VARs are set' do
            expect(ENV['ARCHFLAGS']).to eq('-arch x86_64')
          end
          it 'as defined through{Gem}' do
            expect(::Gem.java_platform?).to eq(false)
            expect(::Gem::Platform.local.version).to eq('18')
          end
        end
      end # end: {architecture build configs are as expected{mac, 64-bit}'}

      context 'GIT is supported' do
        it 'as defined through build-settings{::RbConfig}' do
          expect(build_configs['HAVE_GIT']).to eq('yes')
        end
      end # end: {GIT is supported}

      context 'GCC is supported' do
        it 'as defined through build-settings{::RbConfig}' do
          expect(build_configs['GCC']).to eq('yes')
        end
        it 'has needed ENV_VARs' do
          expect(ENV['LANG']).to eq('en_US.UTF-8')
          expect(ENV['LANGUAGE']).to eq('en_US.UTF-8')
          expect(ENV['LC_CTYPE']).to eq('en_US.UTF-8')
          expect(ENV['LC_MESSAGES']).to eq('en_US.UTF-8')
          expect(ENV['LC_ALL']).to eq('en_US.UTF-8')
        end
      end # end: {GCC is supported}

    end # end: {general configs for{Ruby}}

  end # end: {locale}

end
