# coding: UTF-8

RSpec.describe 'ruby' do

  context 'locale', :locale do
    let(:build_configs){::RbConfig::CONFIG}

    context 'OpenSSL is built as needed' do
      it 'w/ needed ENV_VARs' do
        expect(ENV["RUBY_CONFIGURE_OPTS=\"--with-openssl-dir=#{💎.engine.api.path_openssl}\""])
      end
      context 'w/ needed globals' do
        before :all do
          @version_openssl = 💎.engine.api.run_cmd!("#{💎.engine.api.path_openssl}/bin/openssl version")
        end
        after :all do
          @version_openssl = nil
        end
        it 'matching compiled version' do
          expect(::OpenSSL::OPENSSL_VERSION).to eq(@version_openssl)
        end
        it 'matching loaded version' do
          expect(::OpenSSL::OPENSSL_LIBRARY_VERSION).to eq(@version_openssl)
        end

      end
    end # end: {OpenSSL is built as needed}

    context 'recommended configs' do

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
            expect(💎.engine.api_locale.can_find_needed_brew_h_file?('6.2.0', 'gmp.h'))
          end
          it 'for lib{mpfr.h} version{4.0.2}' do
            expect(💎.engine.api_locale.can_find_needed_brew_h_file?('4.0.2', 'mpfr.h'))
          end
          it 'for lib{mpc.h} version{1.1.0}' do
            expect(💎.engine.api_locale.can_find_needed_brew_h_file?('1.1.0', 'mpc.h'))
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
            expect(💎.engine.api_brew.get_version).to eq(["Homebrew 2.4.2-14-gdb99886", "Homebrew/homebrew-core (git revision 3e5b8; last commit 2020-06-26)", "Homebrew/homebrew-cask (git revision 65947; last commit 2020-06-26)"])
          end
          it 'for{docker}' do
            expect(💎.engine.api_docker.get_version).to eq('Docker version 19.03.8, build afacb8b')
          end
          it 'for{git}' do
            expect(💎.engine.api_git.get_version).to eq('git version 2.24.3 (Apple Git-128)')
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

    context 'current user' do

      it 'ENV{USER} matches reported user' do
        expect(ENV['USER']).to eq(💎.engine.os.current_user)
        expect(::Etc.getlogin).to eq(💎.engine.os.current_user)
      end

      context 'w/ expected local specs' do
        it 'number of CPUs' do
          expect(ENV['RUUUBY_NUM_CPU']).to eq(💎.engine.os.num_cpu_cores.to_s)
          expect(::Etc.nprocessors).to eq(💎.engine.os.num_cpu_cores)
        end
      end
    end

    context 'needed settings for{ZSH}' do
      it 'expected version{5.7.1} matches' do
        expect(💎.engine.api.run_cmd!('zsh --version')).to eq('zsh 5.8 (x86_64-apple-darwin18.7.0)')
      end
    end

  end
end
