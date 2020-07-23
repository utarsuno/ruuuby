# encoding: UTF-8

RSpec.describe 'ruby' do

  context 'locale', :locale do
    let(:build_configs){::RbConfig::CONFIG}

    context 'web protocol' do

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

      context 'lib{zlib} utilized w/ protocol{HTTP} is built as needed' do
        context '{zlib}' do
          it 'found w/ ::Net::HTTP' do
            expect(::Net::HTTP::HAVE_ZLIB).to eq(true)
          end
          context 'found locally' do
            it 'for lib{zlib} version{11.14.0_1}' do
              expect(💎.engine.api_locale.∃_brew_h_file?('11.14.0_1', 'zlib.h'))
            end
          end
        end
      end

    end # end: {web protocol}

    context 'recommended configs' do

      context 'for gem{rubygems-update}' do
        it 'has correct version{3.2.0.rc.1}' do
          expect(::Gem.rubygems_version.to_s).to eq('3.2.0.rc.1')
        end
        it 'matching output of cmd{gem -v}' do
          expect(::Gem.rubygems_version.to_s).to eq(💎.engine.api.run_cmd!('gem -v'))
        end

        context 'has needed configs' do
          it 'w/ expected path for{Gemfile}' do
            expect(ENV['BUNDLE_GEMFILE']).to eq("#{💎.engine.path_base}Gemfile")
          end
        end

      end # end: {for gem{rubygems-update}}

    end # end: {recommended configs}

    context 'additional configs for GCC' do
      context 'needed libs for GCC can be found' do
        context 'brew based, see lib{ruby-build}' do
          it 'for lib{gmp.h} version{6.2.0}' do
            expect(💎.engine.api_locale.∃_brew_h_file?('6.2.0', 'gmp.h'))
          end
          it 'for lib{mpfr.h} version{4.0.2}' do
            expect(💎.engine.api_locale.∃_brew_h_file?('4.0.2', 'mpfr.h'))
          end
          it 'for lib{mpc.h} version{1.1.0}' do
            expect(💎.engine.api_locale.∃_brew_h_file?('1.1.0', 'mpc.h'))
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
            expect(💎.engine.api_brew.version).to eq(["Homebrew 2.4.8-48-gee648ef", "Homebrew/homebrew-core (git revision 0dc26; last commit 2020-07-21)", "Homebrew/homebrew-cask (git revision 80899; last commit 2020-07-22)"])
          end
          context 'for{docker}' do
            it 'has needed version' do
              expect(💎.engine.api_locale.api_docker.version).to eq('Docker version 19.03.8, build afacb8b')
            end
            it 'has needed version for{docker-compose}' do
              expect(💎.engine.api_locale.api_docker.version_compose).to eq('docker-compose version 1.25.5, build 8a1c60f6')
            end
          end
          it 'for{git}' do
            expect(💎.engine.api_git.version).to eq('git version 2.24.3 (Apple Git-128)')
          end
          it '${clang --version} matches ${cc --version}' do
            result_a = 💎.engine.api.run_cmd!('clang --version')
            result_b = 💎.engine.api.run_cmd!('cc --version')
            expect(result_a).to eq(result_b)
          end
          # TODO: test having #{gcc -v} match too
        end # end: {correct version tests from CLI-APIs}
      end # end: {optional tests}
    end

    context 'current user' do
      context 'is correctly identified' do
        it 'w/ ENV{USER}' do
          expect(💎.engine.os.current_user).to eq(ENV['USER'])
        end
        it 'w/ external libs' do
          expect(💎.engine.os.current_user).to eq(::Etc.getlogin)
        end
        context 'w/ freshly executed terminal cmds' do
          it 'id -u -n' do
            expect(💎.engine.os.current_user).to eq(💎.engine.api.run_cmd!('id -u -n'))
          end
          it 'whoami' do
            expect(💎.engine.os.current_user).to eq(💎.engine.api.run_cmd!('whoami'))
          end
        end
      end
      context 'w/ expected local specs' do
        it 'number of CPUs' do
          expect(ENV['RUUUBY_NUM_CPU']).to eq(💎.engine.os.num_cpu_cores.to_s)
          expect(::Etc.nprocessors).to eq(💎.engine.os.num_cpu_cores)
        end
      end
    end # end: {current user}

    context 'needed settings for{ZSH}' do
      it 'expected version{5.7.1} matches' do
        expect(💎.engine.api.run_cmd!('zsh --version')).to eq('zsh 5.8 (x86_64-apple-darwin18.7.0)')
      end
    end

    context '(thus far) recommended settings for {iconv}' do
      it 'has needed version{1.11}' do
        expect(💎.engine.api_locale.iconv_version?('1.11')).to eq(true)
      end
      it 'supports needed encoding{UTF-8}' do
        expect(💎.engine.api_locale.iconv_∃_encoding?('UTF-8')).to eq(true)
      end
    end

    context 'misc configs are as needed' do
      it '$PATH separator is defined as{:}' do
        expect(build_configs['PATH_SEPARATOR']).to eq(':')
      end
    end

  end
end
