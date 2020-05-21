# coding: UTF-8

RSpec.describe 'general configs' do
  let(:ruuuby_metadata){::Ruuuby::MetaData}
  let(:ruuuby_gems){ruuuby_metadata::BuiltWith::GemDependencies}
  let(:configs_dev){ruuuby_gems::Environment::Development::ALL_GEMS}
  let(:configs_prod){ruuuby_gems::Environment::Runtime::ALL_GEMS}
  let(:configs_code){::File::Syntax::SourceCode}

  #                   __          ___     __
  #   /\     |  |    |  \    |     |     /__`
  #  /~~\    \__/    |__/    |     |     .__/

  context 'audits', :audits do

    before :all do
      @directory_ext = Dir.🆕(::Ruuuby::MetaData::Paths::DIR_EXT)
    end

    context 'passes file structure audits' do
      context 'extension files have correct file schema' do
        it 'directory{ext/} is healthy' do

          puts "\t\t| --- parsing directory{ext/} --- "
          puts "\t\t| #{::Ruuuby::MetaData::Paths::DIR_EXT} |"
          puts "\t\t| ------------------------------- "

          @directory_ext.η̂_paths do |path|
            path_current_extension = "#{::Ruuuby::MetaData::Paths::DIR_EXT}/#{path.to_s}"
            puts "\t\t| checking if directory: {#{path_current_extension}} w/ content"
            expect(🗄️.∃?(path_current_extension)).to eq(true)
            sub_paths = 🗄️.🆕("#{path_current_extension}/")
            expect(sub_paths.∅?).to eq(false)
            puts "\t\t\t| traversing directory: {#{path_current_extension}/}"
            sub_paths.η̂_paths do |sub_path|
              sub_full_path = "#{path_current_extension}/#{sub_path}"
              puts "\t\t\t| checking if file: {#{sub_full_path.to_s}}"
              expect(📁.∃?(sub_full_path)).to eq(true)
              if sub_path.end_with?(configs_code::C::CODE)
                puts "\t\t\t\t| parent-dir-name{#{path.to_s}} should equal file-name{#{sub_path.to_s}}"
                expect(path.to_s).to eq(sub_path[0..sub_path.length-3].to_s)

                puts "\t\t\t\t| file-name{#{sub_path.to_s}} should not equal {conftest.c}"
                expect(sub_path).to_not eq('conftest.c')
              elsif sub_path.end_with?(configs_code::Ruby::CODE) || sub_path.end_with?(configs_code::C::HEADER)
                # do nothing =)
              else
                puts "\t\t\t\t| unexpected-file{#{sub_path.to_s}}, which is not supported!"
                raise RuntimeError.🆕("unexpected-file{#{sub_path.to_s}}, for directory{#{path_current_extension}}")
              end
            end
          end
        end # end{directory{ext/} is healthy}
      end # end{extension files have correct file schema}
    end

=begin
    context 'f12' do
      before :all do
        @f12 = ::RuuubyConfigs::RuuubyFeature::f12
      end
      it 'defines needed global funcs' do
        @f12.methods_global.∀ do |m, p|
          # expect ::Kernel (in file `kernel.rb`) to define the methods with name(m)
          expect(::Kernel.method(m).🏠[0].end_with?(p[0].to_s)).to eq(true)
        end
      end
      it 'defines needed funcs' do
        @f12.methods_per_file.∀ do |f, methods|
          # expect ::Kernel (in file `kernel.rb`) to define the methods with name(m)
          #expect(::Kernel.method(m).🏠[0].end_with?(p[0].to_s)).to eq(true)

          methods.∀ do |m|
            expect(@f12.methods_per_class[])
          end

        end
      end
    end
=end

    context 'running with correct/expected Ruby configs' do
      it 'ruby major version is correct' do
        expect(RUBY_VERSION).to eq(ruuuby_metadata::BuiltWith::RUBY_VERSION)
      end
      it 'ruby minor version is correct' do
        expect(RUBY_PATCHLEVEL).to eq(ruuuby_metadata::BuiltWith::RUBY_VERSION_PATCH)
        expect(RUBY_REVISION).to eq(ruuuby_metadata::BuiltWith::RUBY_VERSION_REVISION)
      end
      it 'current platform is compatible' do
        expect(RUBY_PLATFORM).to eq(ruuuby_metadata::BuiltWith::RUBY_PLATFORM)
      end
      it 'set file encoding' do
        expect(__ENCODING__).to eq(ruuuby_metadata::BuiltWith::RUBY_ENCODING)
        expect(__ENCODING__).to eq(::Encoding::UTF_8)

        #TODO: ruby -e "p Encoding.default_external"
      end
    end

    context 'has expected configurations for{Float}' do
      it 'MANT_DIG' do
        expect(::Float::MANT_DIG).to eq(53)
      end
      it 'DIG' do
        expect(::Float::DIG).to eq(15)
      end
      it 'supports denormalized numbers' do
        expect((::Float::MIN.next_float) > ::Float::MIN).to eq(true)
      end
    end

    context 'has correct gem versions' do
      context 'bundler is healthy' do
        it 'by having correct configs' do
          expect(Bundler.requires_sudo?).to eq(false)
          expect(Bundler::VERSION).to eq(configs_dev[ruuuby_gems::GEM_BUNDLER])
        end
      end

      context 'tty-command is healthy' do
        it 'by having correct configs' do
          expect(TTY::Command::VERSION).to eq(configs_prod[ruuuby_gems::GEM_TTY_COMMAND])
        end
      end

      context 'rdoc is healthy' do
        it 'by having correct configs' do
          expect(RDoc::VERSION).to eq(configs_dev[ruuuby_gems::GEM_RDOC])
        end
      end

      context 'rake is healthy' do
        it 'by having correct configs' do
          expect(Rake::VERSION).to eq(configs_dev[ruuuby_gems::GEM_RAKE])
        end
      end

      context 'rspec is healthy' do
        it 'by having correct configs' do
          expect(RSpec::Version::STRING).to eq(configs_dev[ruuuby_gems::GEM_RSPEC])
        end
      end

      context 'rspec-benchmark is healthy' do
        it 'by having correct configs' do
          expect(RSpec::Benchmark::VERSION).to eq(configs_dev[ruuuby_gems::GEM_RSPEC_BENCHMARK])
        end
      end

      context 'sqlite3 is healthy' do
        it 'by having correct configs' do
          expect(SQLite3::VERSION).to eq(configs_dev[ruuuby_gems::GEM_SQLITE3])
        end
      end

      context 'activerecord is healthy' do
        it 'by having correct configs' do
          expect(ActiveRecord::VERSION::STRING).to eq(configs_dev[ruuuby_gems::GEM_ACTIVERECORD])
        end
      end

      context 'rugged is healthy' do
        it 'by having correct configs' do
          expect(Rugged::VERSION).to eq(configs_dev[ruuuby_gems::GEM_RUGGED])
        end
      end

      context 'schema_plus_foreign_keys is healthy' do
        # TODO: version audits?
      end

      context 'ruuuby is healthy' do
        it 'by having correct configs' do
          expect(Ruuuby::VERSION).to eq(::Ruuuby::VERSION)
        end
      end
    end

  end

end
