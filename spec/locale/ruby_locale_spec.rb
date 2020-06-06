# coding: UTF-8

RSpec.describe 'ruby' do

  context 'locale', :locale do

    context 'rubygems' do

      it 'Gem.extension_api_version is needed version' do
        # in 2.7.0
        #expect(::Gem.extension_api_version).to eq(RUBY_VERSION)

        expect(::Gem.extension_api_version).to eq('2.7.0')
      end

      # during 2.7.0->2.7.1 migration; 3.1.2->3.1.4
      it 'has correct version{3.1.4}' do
        expect(::Gem.rubygems_version.to_s).to eq('3.1.4')
      end

      it 'is not marked as Java platform' do
        expect(::Gem.java_platform?).to eq(false)
      end

    end

    context 'Ruby build configs are as expected' do

      context 'ruby major version is correct' do
        it 'as defined through global constant{RUBY_VERSION}' do
          expect(RUBY_VERSION).to eq('2.7.1')
        end
        it 'as defined by RbConfig' do
          expect(::RbConfig::CONFIG['MAJOR']).to eq('2')
          expect(::RbConfig::CONFIG['MINOR']).to eq('7')
          expect(::RbConfig::CONFIG['TEENY']).to eq('1')
        end
      end

      context 'ruby patch level is correct' do
        it 'as defined through globals{RUBY_PATCHLEVEL, RUBY_REVISION}' do
          # 2.7.0
          # expect(RUBY_PATCHLEVEL).to eq(0)
          # expect(RUBY_REVISION).to eq('647ee6f091eafcce70ffb75ddf7e121e192ab217')

          # 2.7.1
          expect(RUBY_PATCHLEVEL).to eq(83)
          expect(RUBY_REVISION).to eq('a0c7c23c9cec0d0ffcba012279cd652d28ad5bf3')
        end
        it 'as defined by RbConfig' do
          expect(::RbConfig::CONFIG['PATCHLEVEL']).to eq('83')
        end
      end

      context 'unicode settings' do
        it 'global version' do
          expect(::RbConfig::CONFIG['UNICODE_VERSION']).to eq('12.1.0')
        end
        it 'emoji version' do
          expect(::RbConfig::CONFIG['UNICODE_EMOJI_VERSION']).to eq('12.1')
        end
      end

      it 'current platform is mac{64-bit}' do
        expect(RUBY_PLATFORM).to eq('x86_64-darwin18')
      end

      it 'verify encoding' do
        expect(__ENCODING__).to eq(::Encoding::UTF_8)
      end

    end

  end

end
