# encoding: UTF-8

RSpec.describe 'ruby' do
  context 'locale', :preferences do

    context 'for gem{bundler}' do
      it 'passes all health checks' do
        expect(::Bundler.healthy?).to eq(true)
      end
      it 'has correct version' do
        expect_needed_version(::Bundler, '2.2.0.rc.2', ::Bundler::VERSION)
      end
      it 'as defined by {Gem}' do
        expect(::Gem::BundlerVersionFinder.bundler_version.to_s).to eq(::Bundler.version_current)
      end
      it 'w/ needed ENV_VARs' do
        expected_path = "#{💎.engine.path_base}Gemfile"
        expect(::ENV['BUNDLE_GEMFILE']).to eq(expected_path)
        expect(::Bundler.path_gemfile).to eq(expected_path)
      end
      it 'does not require sudo (depending on OS)' do
        if 💎.engine.os.mac?
          expect(::Bundler.requires_sudo?).to eq(false)
        elsif 💎.engine.os.unix
          # currently, only Alpine-Linux is supported/expected, which will run w/ user{`root`}
          expect(::Bundler.requires_sudo?).to eq(true)
        else
          # ¯\_(ツ)_/¯
        end
      end
    end # end: {for gem{bundler}}

  end
end
