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

    context 'misc configs are as needed' do
      it '$PATH separator is defined as{:}' do
        expect(build_configs['PATH_SEPARATOR']).to eq(':')
      end
    end

  end
end
