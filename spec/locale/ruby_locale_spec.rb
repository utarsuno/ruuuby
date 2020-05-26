# coding: UTF-8

RSpec.describe 'ruby' do

  context 'locale', :locale do

    context 'rubygems' do

      it 'extension_api_version matches RUBY_VERSION' do
        expect(Gem.extension_api_version).to eq(RUBY_VERSION)
      end

      it 'has correct version{3.1.2}' do
        expect(Gem.rubygems_version.to_s).to eq('3.1.2')
      end

      it 'is not marked as Java platform' do
        # note: too expensive for unit test but this output can be confirmed w/ cmd: "gem -v"
        expect(Gem.java_platform?).to eq(false)
      end

    end

    context 'Ruby build configs are as expected' do

      it 'ruby major version is correct' do
        expect(RUBY_VERSION).to eq('2.7.0')
      end

      it 'ruby minor version is correct' do
        expect(RUBY_PATCHLEVEL).to eq(0)
        expect(RUBY_REVISION).to eq('647ee6f091eafcce70ffb75ddf7e121e192ab217')
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
