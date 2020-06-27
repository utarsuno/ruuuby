# coding: UTF-8

RSpec.describe 'ruby' do

  context 'locale', :locale do
    let(:build_configs){::RbConfig::CONFIG}

    context 'OpenSSL is built as needed' do
      it 'w/ needed ENV_VARs' do
        expect(ENV["RUBY_CONFIGURE_OPTS=\"--with-openssl-dir=#{💎.engine.api.path_openssl}\""])
      end
      it 'w/ needed globals' do
        version_openssl = 💎.engine.api.run_cmd!("#{💎.engine.api.path_openssl}/bin/openssl version")
        expect(::OpenSSL::OPENSSL_VERSION).to eq(version_openssl)
      end
    end # end: {OpenSSL is built as needed}

    context 'recommended configs' do

      # during 2.7.0->2.7.1 migration; 3.1.2->3.1.4
      context 'for gem{rubygems-update}' do
        it 'has correct version{3.1.4}' do
          expect(::Gem.rubygems_version.to_s).to eq('3.1.4')
        end
        it 'matching output of cmd{gem -v}' do
          expect(::Gem.rubygems_version.to_s).to eq(💎.engine.api.run_cmd!('gem -v'))
        end
      end # end: {for gem{rubygems-update}}

    end # end: {recommended configs}

    context 'additional configs for GCC' do
      context 'needed libs for GCC can be found' do
        context 'brew based, see lib{ruby-build}' do
          it 'for lib{gmp.h} version{6.2.0}' do
            result = 💎.engine.api.run_cmd!('find /usr/local/Cellar -name "gmp.h"')
            expect(result.∋?('6.2.0')).to eq(true)
            expect(result.∋?('include/gmp.h')).to eq(true)
          end
          it 'for lib{mpfr.h} version{4.0.2}' do
            result = 💎.engine.api.run_cmd!('find /usr/local/Cellar -name "mpfr.h"')
            expect(result.∋?('4.0.2')).to eq(true)
            expect(result.∋?('include/mpfr.h')).to eq(true)
          end
          it 'for lib{mpc.h} version{1.1.0}' do
            result = 💎.engine.api.run_cmd!('find /usr/local/Cellar -name "mpc.h"')
            expect(result.∋?('1.1.0')).to eq(true)
            expect(result.∋?('include/mpc.h')).to eq(true)
          end
        end
      end

      context 'optional tests' do
        context 'correct version tests from CLI-APIs' do
          it 'for{ruby-build}' do
            result = 💎.engine.api.run_cmd!('ruby-build --version')
            expect(result).to eq('ruby-build 20200520')
          end
          it 'for{brew}' do
            result = 💎.engine.api.run_cmd!('brew --version')
            expect(result).to eq(💎.engine.api_brew.get_version)
            expect(result).to eq(["Homebrew 2.4.2-14-gdb99886", "Homebrew/homebrew-core (git revision 3e5b8; last commit 2020-06-26)", "Homebrew/homebrew-cask (git revision 65947; last commit 2020-06-26)"])
          end
          it 'for{docker}' do
            result = 💎.engine.api.run_cmd!('docker --version')
            expect(result).to eq(💎.engine.api_docker.get_version)
            expect(result).to eq('Docker version 19.03.8, build afacb8b')
          end
          it 'for{git}' do
            result = 💎.engine.api.run_cmd!('git --version')
            expect(result).to eq(💎.engine.api_git.get_version)
            expect(result).to eq('git version 2.24.3 (Apple Git-128)')
          end
          it '${clang --version} matches ${cc --version}' do
            result_a = 💎.engine.api.run_cmd!('clang --version')
            result_b = 💎.engine.api.run_cmd!('cc --version')
            expect(result_a).to eq(result_b)
          end
          # TODO: test having #{gcc -v} match too
        end # end: {correct version tests from CLI-APIs}
      end # end: {optional tets}
    end

  end
end
