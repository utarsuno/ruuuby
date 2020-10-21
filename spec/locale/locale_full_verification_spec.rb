# encoding: UTF-8

RSpec.describe 'ruby' do

  context 'audits', :audit do
    context 'RSpec configs' do
      it 'are as expected' do
        expect(::RSpec::Support::RubyFeatures::module_refinement_supported?).to eq(true)
        expect(::RSpec::Support::RubyFeatures::module_prepends_supported?).to eq(true)
        expect(::RSpec::Support::RubyFeatures::optional_and_splat_args_supported?).to eq(true)
        expect(::RSpec::Support::RubyFeatures::caller_locations_supported?).to eq(true)
      end
    end
  end

  context 'locale', :locale do
    let(:build_configs){::RbConfig::CONFIG}

    context 'web protocol' do

      context 'OpenSSL is built as needed' do
        #it 'w/ needed ENV_VARs' do
          #expect(ENV["RUBY_CONFIGURE_OPTS=\"--with-openssl-dir=#{🍺.openssl_path}\""])
        #end
        context 'w/ needed globals' do
          it 'matching compiled version' do
            #🍺.openssl_version
            expect(::OpenSSL::OPENSSL_VERSION).to eq('OpenSSL 1.1.1g  21 Apr 2020')
          end
          it 'matching loaded version' do
            #🍺.openssl_version
            expect(::OpenSSL::OPENSSL_LIBRARY_VERSION).to eq('OpenSSL 1.1.1h  22 Sep 2020')
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
              expect(🍺.∃_h_file?('11.14.0_1', 'zlib.h'))
            end
          end
        end
      end

    end # end: {web protocol}

    context 'recommended configs' do

      context 'for gem{rubygems-update}' do
        it 'has correct version' do
          expect_needed_version(::Gem, '3.2.0.rc.2', ::Gem.rubygems_version.to_s)
        end
        it 'matching output of cmd{gem -v}' do
          expect(::Gem.version_current).to eq(💻('gem -v'))
        end
      end # end: {for gem{rubygems-update}}

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

    end # end: {recommended configs}

    context 'additional configs for GCC' do
      context 'needed libs for GCC can be found' do
        context 'brew based, see lib{ruby-build}' do
          it 'for lib{gmp.h} version{6.2.0}' do
            expect(🍺.∃_h_file?('6.2.0', 'gmp.h'))
          end
          it 'for lib{mpfr.h} version{4.0.2}' do
            expect(🍺.∃_h_file?('4.0.2', 'mpfr.h'))
          end
          it 'for lib{mpc.h} version{1.1.0}' do
            expect(🍺.∃_h_file?('1.1.0', 'mpc.h'))
          end
        end
      end

      context 'optional tests' do
        context 'correct version tests from CLI-APIs' do
          it 'for{ruby-build}' do
            expect(💻('ruby-build --version')).to eq('ruby-build 20200520')
          end
          #it 'for{git}' do
          #  expect($git.version).to eq('git version 2.24.3 (Apple Git-128)')
          #end
          it '${clang --version} matches ${cc --version}' do
            expect(💻('clang --version')).to eq(💻('cc --version'))
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
            expect(💎.engine.os.current_user).to eq(💻('id -u -n'))
          end
          it 'whoami' do
            expect(💎.engine.os.current_user).to eq(💻('whoami'))
          end
        end
      end
      context 'w/ expected local specs' do
        it 'number of CPUs' do
          expect(::ENV['RUUUBY_NUM_CPU']).to eq(💎.engine.os.num_cpu_cores.to_s)
          expect(::Etc.nprocessors).to eq(💎.engine.os.num_cpu_cores)
        end
      end
    end # end: {current user}

    context 'recommended settings for{ZSH}' do
      it 'expected version{5.7.1} matches' do
        expect(💎.engine.api_zsh.version).to eq('zsh 5.8 (x86_64-apple-darwin18.7.0)')
      end
    end # end: {ZSH}

    context 'recommended settings for lib' do
      context '{zsh}' do
        it 'expected version{5.7.1} matches' do
          expect(💎.engine.api_zsh.version).to eq('zsh 5.8 (x86_64-apple-darwin18.7.0)')
        end
      end # end: {ZSH}
      context '{curl}' do
        it 'expected version{7.64.1} matches' do
          expect(💻('curl --version')).to eq(["curl 7.64.1 (x86_64-apple-darwin19.0) libcurl/7.64.1 (SecureTransport) LibreSSL/2.8.3 zlib/1.2.11 nghttp2/1.39.2", "Release-Date: 2019-03-27", "Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtsp smb smbs smtp smtps telnet tftp ", "Features: AsynchDNS GSS-API HTTP2 HTTPS-proxy IPv6 Kerberos Largefile libz MultiSSL NTLM NTLM_WB SPNEGO SSL UnixSockets"])
        end
      end # end: {curl}
    end

    context '(thus far) recommended settings for {iconv}' do
      it 'passes all health checks' do
        expect(💎.engine.api_locale.api_iconv.healthy?).to eq(true)
        end
      it 'has needed version{1.11}' do
        expect_needed_version(💎.engine.api_locale.api_iconv, 'iconv (GNU libiconv 1.11)')
      end
      it 'supports needed encoding{UTF-8}' do
        expect(💎.engine.api_locale.api_iconv.∃_encoding?('UTF-8')).to eq(true)
      end
    end # end: {iconv}

    context 'misc configs are as needed' do
      it '$PATH separator is defined as{:}' do
        expect(build_configs['PATH_SEPARATOR']).to eq(':')
      end
    end

    # @see https://stackoverflow.com/questions/17980759/xcode-select-active-developer-directory-error
    context 'configs for xcode' do
      context 'xcode-select' do
        it 'has needed version' do
          expect(💻('xcode-select --version')).to eq('xcode-select version 2373.')
        end
        it 'has needed path' do
          expect(💻('xcode-select --print-path')).to eq('/Applications/Xcode.app/Contents/Developer')
        end
      end
      context 'xcodebuild' do
        it 'has needed version' do
          expect(💻('xcodebuild -version')).to eq(["Xcode 12.0", "Build version 12A7209"])
        end
      end
    end

  end
end
