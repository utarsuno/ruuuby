# coding: utf-8

RSpec.describe 'general configs' do
  let(:configs_requirements){::RuuubyConfigs::Requirements}
  let(:configs_gems){::RuuubyConfigs::GemDependencies}
  let(:configs_dev){configs_gems::EnvironmentDevelopment::ALL_GEMS}
  let(:configs_prod){configs_gems::EnvironmentRuntime::ALL_GEMS}

  #                   __          ___     __
  #   /\     |  |    |  \    |     |     /__`
  #  /~~\    \__/    |__/    |     |     .__/

  context 'audits', :'audits' do

    before :all do
      path_project_base         = File.dirname³(__FILE__)
      @relative_paths_to_ignore = %w(. .. .DS_Store)
      @path_dir_c_extensions    = "#{path_project_base.to_s}/ext"
      @directory_ext            = Dir.🆕(@path_dir_c_extensions)
    end

    context 'passes file structure audits' do
      context 'extension files have correct file schema' do
        it 'directory{ext/} is healthy' do

          puts "\t\t| --- parsing directory{ext/} --- "
          puts "\t\t| #{@path_dir_c_extensions.to_s} |"
          puts "\t\t| ------------------------------- "

          @directory_ext.each do |path|
            unless @relative_paths_to_ignore.include?(path)
              path_current_extension = "#{@path_dir_c_extensions.to_s}/#{path.to_s}"
              puts "\t\t| checking if directory: {#{path_current_extension}}"
              expect(🗄️.∃?(path_current_extension)).to eq(true)
              sub_paths             = 🗄️.🆕("#{path_current_extension}/")
              directory_has_content = false
              puts "\t\t\t| traversing directory: {#{path_current_extension}/}"
              sub_paths.each do |sub_path|
                unless @relative_paths_to_ignore.include?(sub_path)
                  sub_full_path = "#{path_current_extension}/#{sub_path}"
                  puts "\t\t\t| checking if file: {#{sub_full_path.to_s}}"
                  expect(📁.∃?(sub_full_path)).to eq(true)
                  directory_has_content = true
                  if sub_path.end_with?('.c')
                    puts "\t\t\t\t| parent-dir-name{#{path.to_s}} should equal file-name{#{sub_path.to_s}}"
                    expect(path.to_s).to eq(sub_path[0..sub_path.length-3].to_s)

                    puts "\t\t\t\t| file-name{#{sub_path.to_s}} should not equal {conftest.c}"
                    expect(sub_path).to_not eq('conftest.c')
                  elsif sub_path.end_with?('.rb') || sub_path.end_with?('.h')
                    # do nothing =)
                  else
                    puts "\t\t\t\t| unexpected-file{#{sub_path.to_s}}, which is not supported!"
                    raise RuntimeError.🆕("unexpected-file{#{sub_path.to_s}}, for directory{#{path_current_extension}}")
                  end
                end
              end
              puts "\t\t\t| the directory had contents"
              expect(directory_has_content).to eq(true)
            end
          end #end{@directory_ext.each do |path|}
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

    context 'running with correct Ruby configs' do
      it 'ruby major version is correct' do
        expect(RUBY_VERSION).to eq(configs_requirements::RUBY_VERSION)
      end
      it 'ruby minor version is correct' do
        expect(RUBY_PATCHLEVEL).to eq(configs_requirements::RUBY_VERSION_PATCH)
        expect(RUBY_REVISION).to eq(configs_requirements::RUBY_VERSION_REVISION)
      end
      it 'current platform is compatible' do
        expect(RUBY_PLATFORM).to eq(configs_requirements::RUBY_PLATFORM)
      end
    end

    context 'has correct gem versions' do
      context 'bundler is healthy' do
        it 'by having correct configs' do
          expect(Bundler.requires_sudo?).to eq(false)
          expect(Bundler::VERSION).to eq(configs_dev[configs_gems::GEM_BUNDLER])
        end
      end

      context 'tty-command is healthy' do
        it 'by having correct configs' do
          expect(TTY::Command::VERSION).to eq(configs_dev[configs_gems::GEM_TTY_COMMAND])
        end
      end

      context 'rdoc is healthy' do
        it 'by having correct configs' do
          expect(RDoc::VERSION).to eq(configs_dev[configs_gems::GEM_RDOC])
        end
      end

      context 'rake is healthy' do
        it 'by having correct configs' do
          expect(Rake::VERSION).to eq(configs_dev[configs_gems::GEM_RAKE])
        end
      end

      context 'rspec is healthy' do
        it 'by having correct configs' do
          expect(RSpec::Version::STRING).to eq(configs_dev[configs_gems::GEM_RSPEC])
        end
      end

      context 'rspec-benchmark is healthy' do
        it 'by having correct configs' do
          expect(RSpec::Benchmark::VERSION).to eq(configs_dev[configs_gems::GEM_RSPEC_BENCHMARK])
        end
      end

      context 'sqlite3 is healthy' do
        it 'by having correct configs' do
          expect(SQLite3::VERSION).to eq(configs_dev[configs_gems::GEM_SQLITE3])
        end
      end

      context 'activerecord is healthy' do
        it 'by having correct configs' do
          expect(ActiveRecord::VERSION::STRING).to eq(configs_dev[configs_gems::GEM_ACTIVERECORD])
        end
      end
    end

    context 'has correct db configs' do
      context 'has correct directory structure' do
        it 'directory{db} exists' do
          expect(🗄️.∃?('./db')).to eq(true)
        end
        it 'directory{db/migrate} exists' do
          expect(🗄️.∃?('./db/migrate')).to eq(true)
          expect(📁.∃?('./db/migrate.rb')).to eq(false)
        end
      end
    end

    context 'running with correct GIT configs' do
      it 'has .gitignore file' do
        expect(📁.∃?('.gitignore')).to eq(true)
      end
    end

  end

end
