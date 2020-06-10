# coding: UTF-8

RSpec.describe 'ruby' do

  context 'locale', :locale do
    let(:build_configs){::RbConfig::CONFIG}

    context 'versions' do
      context 'ruby' do
        context 'version' do
          it 'as defined by{RUBY_VERSION}' do
            expect(RUBY_VERSION).to eq('2.7.1')
          end
          it 'as defined by RbConfig' do
            expect(build_configs['MAJOR']).to eq('2')
            expect(build_configs['MINOR']).to eq('7')
            expect(build_configs['TEENY']).to eq('1')
            expect(build_configs['RUBY_PROGRAM_VERSION']).to eq('2.7.1')
          end
          context 'patch-level' do
            it 'as defined through globals{RUBY_PATCHLEVEL, RUBY_REVISION}' do
              expect(RUBY_PATCHLEVEL).to eq(83)
              expect(RUBY_REVISION).to eq('a0c7c23c9cec0d0ffcba012279cd652d28ad5bf3')
            end
            it 'as defined by RbConfig' do
              expect(build_configs['PATCHLEVEL']).to eq('83')
            end
          end # end: {patch-level}
        end # end: {version}
        context 'extension-api-version' do
          it 'as defined by{Gem}' do
            expect(::Gem.extension_api_version).to eq('2.7.0')
          end
          it 'as defined by {RbConfig}' do
            expect(build_configs['RUBY_API_VERSION']).to eq('2.7')
          end
        end # end: {extension-api-version}
      end # end: {ruby}
    end # end: {versions}

    context 'rubygems' do

      it 'has correct dependency categories{:development, :runtime}' do
        expect(::Gem::Dependency::TYPES.≈≈([:development, :runtime])).to eq(true)
      end

      it 'is currently not using safe mode' do
        # @see https://docs.ruby-lang.org/en/2.6.0/security_rdoc.html#label-24SAFE
        expect($SAFE).to eq(0)
      end

    end

    context 'Ruby build configs are as expected' do
      context 'localization' do
        context 'build settings for unicode' do
          it 'global version' do
            expect(build_configs['UNICODE_VERSION']).to eq('12.1.0')
          end
          it 'emoji version' do
            expect(build_configs['UNICODE_EMOJI_VERSION']).to eq('12.1')
          end
          context 'verify encoding' do
            it 'w/ __ENCODING__' do
              expect(__ENCODING__).to eq(::Encoding::UTF_8)
            end
            it 'w/ Encoding.default_external' do
              expect(Encoding.default_external).to eq(::Encoding::UTF_8)
            end
            it 'w/ Encoding.default_internal' do
              expect(Encoding.default_internal).to eq(nil)
            end
          end
        end
        context 'needed ENV_VARs are set' do
          it 'for GCC' do
            expect(ENV['LANG']).to eq('en_US.UTF-8')
            expect(ENV['LC_CTYPE']).to eq('en_US.UTF-8')
            expect(ENV['LC_MESSAGES']).to eq('en_US.UTF-8')
            expect(ENV['LC_ALL']).to eq('en_US.UTF-8')
          end
        end
      end # end: {localization}

      context 'current platform matches build platform{mac, 64-bit}' do
        context 'os, platform, & 64-bit CPU specified' do
          it 'as defined through global{RUBY_PLATFORM}' do
            expect(RUBY_PLATFORM).to eq('x86_64-darwin18')
          end
          it 'as defined through build-settings{::RbConfig}' do
            expect(build_configs['host_os']).to eq('darwin18.7.0')
            expect(build_configs['host_vendor']).to eq('apple')
            expect(build_configs['target']).to eq('x86_64-apple-darwin18')
            expect(build_configs['build']).to eq('x86_64-apple-darwin18.7.0')
            %w(target_cpu host_cpu build_cpu).∀{|config| expect(build_configs[config]).to eq('x86_64')}
          end
          it 'needed ENV_VARs are set' do
            expect(ENV['ARCHFLAGS']).to eq('-arch x86_64')
          end
          it 'as defined through{Gem}' do
            expect(::Gem.java_platform?).to eq(false)
            expect(::Gem::Platform.local.os).to eq('darwin')
            expect(::Gem::Platform.local.version).to eq('18')
            expect(::Gem::Platform.local.cpu).to eq('x86_64')
          end
        end
      end # end: {current platform matches build platform{64-bit}}

      context 'Just-In_Time compiler{JIT} is supported' do
        it 'as defined through build-settings{::RbConfig}' do
          expect(build_configs['MJIT_SUPPORT']).to eq('yes')
        end
      end # end: {Just-In_Time compiler{JIT} is supported}

      context 'GIT is supported' do
        it 'as defined through build-settings{::RbConfig}' do
          expect(build_configs['HAVE_GIT']).to eq('yes')
        end
      end # end: {GIT is supported}

      context 'GCC is supported' do
        it 'as defined through build-settings{::RbConfig}' do
          expect(build_configs['GCC']).to eq('yes')
        end
      end # end: {GCC is supported}

    end

  end # end: {locale}

end
