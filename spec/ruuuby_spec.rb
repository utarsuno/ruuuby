# coding: utf-8

RSpec.describe Ruuuby do
  let(:configs_requirements){::RuuubyConfigs::Requirements}
  let(:configs_gems){::RuuubyConfigs::GemDependencies}
  let(:configs_dev){configs_gems::EnvironmentDevelopment::ALL_GEMS}
  let(:configs_prod){configs_gems::EnvironmentRuntime::ALL_GEMS}

  context 'Ruuuby added as module' do
    it 'exists' do
      expect(∃module?(:Ruuuby)).to eq(true)
    end
    context 'and adds needed sub-modules & classes' do
      it 'module(Version) under module(::Ruuuby)' do
        expect(∃module?(:Version, ::Ruuuby)).to eq(true)
      end
      it 'module(ParamErr) under module(::Ruuuby)' do
        expect(∃module?(:ParamErr, ::Ruuuby)).to eq(true)
      end
      it 'class(WrongParamType) under module(::Ruuuby::ParamErr)' do
        expect(∃class?(:WrongParamType, ::Ruuuby::ParamErr)).to eq(true)
      end
    end
  end

#                   __          ___     __
#   /\     |  |    |  \    |     |     /__`
#  /~~\    \__/    |__/    |     |     .__/

  context 'audits', :'audits' do

    before :all do
      path_project_base         = File.dirname(File.dirname(__FILE__))
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
              is_directory           = !File.file?(path_current_extension) && File.directory?(path_current_extension)
              puts "\t\t| checking if directory: {#{path_current_extension}}"
              expect(is_directory).to eq(true)
              if is_directory
                sub_paths             = Dir.🆕("#{path_current_extension}/")
                directory_has_content = false
                puts "\t\t\t| traversing directory: {#{path_current_extension}/}"
                sub_paths.each do |sub_path|
                  unless @relative_paths_to_ignore.include?(sub_path)
                    sub_full_path = "#{path_current_extension}/#{sub_path}"
                    is_file        = File.file?(sub_full_path) && !File.directory?(sub_full_path)
                    puts "\t\t\t| checking if file: {#{sub_full_path.to_s}}"
                    expect(is_file).to eq(true)
                    if is_file
                      directory_has_content = true
                      if sub_path.end_with?('.c')
                        puts "\t\t\t\t| parent-dir-name{#{path.to_s}} should equal file-name{#{sub_path.to_s}}"
                        expect(path.to_s).to eq(sub_path[0..sub_path.length-3].to_s)

                        puts "\t\t\t\t| file-name{#{sub_path.to_s}} should not equal {conftest.c}"
                        expect(sub_path).to_not eq('conftest.c')
                      elsif sub_path.end_with?('.rb')
                        # do nothing =)
                      else
                        puts "\t\t\t\t| unexpected-file{#{sub_path.to_s}}, which is not supported!"
                        raise RuntimeError.🆕("unexpected-file{#{sub_path.to_s}}, for directory{#{path_current_extension}}")
                      end
                    end
                  end
                end
                puts "\t\t\t| the directory had contents"
                expect(directory_has_content).to eq(true)
              end
            end
          end #end{@directory_ext.each do |path|}
        end # end{directory{ext/} is healthy}
      end # end{extension files have correct file schema}
    end

    context 'running with correct configs' do
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
    end

    context 'README.md examples' do
      it 'works as described' do
        expect(√(25) == 5).to eq(true)

        expect(5^²).to eq(5 * 5)

        expect(-5^⁴).to eq(-5 * -5 * -5 * -5)


        expect('b'.∈? 'abc').to eq(true)
        expect('abc'.∌? 'd').to eq(true)
        expect('d'.∈? 'abc').to eq(false)

        data = {hello: 'world', ye: 'ee'}
        expect([data.🔑?(:hello), data.🔑?(:non_existing_key)]).to eq([true, false])
        expect([data.∃🔑?(:hello), data.∃🔑?(:non_existing_key)]).to eq([true, false])

        elements_a = [1, 'a', 2, nil, [], 2]
        elements_b = [nil, 2, 2, 'a', 1, []]
        expect(elements_a.≈≈ elements_b).to eq(true)
        expect(elements_a == elements_b).to eq(false)

        expect([-5.ℕ?, 7.0.ℤ?, Complex(Float::NAN).ℝ?, Rational(2, 3).ℚ?]).to eq([false, true, false, true])

        expect([1, 2, 3].⊕ [3, 4]).to eq([1, 4, 2])

        expect([2, 3, 4].∖ [1, 2, 3]).to eq([4])
      end
      it 'alternative version works too' do
        expect(√(25) == 5.0).to eq(true)
        expect(√(25.0) == 5).to eq(true)
        expect(√(25.0) == 5.0).to eq(true)

        data = {hello: 'world', ye: 'ee'}
        expect([data.🗝?(:hello), data.🗝?(:non_existing_key)]).to eq([true, false])
        expect([data.∃🗝?(:hello), data.∃🗝?(:non_existing_key)]).to eq([true, false])

        result_a = [1, 2, 3].⊕ [3, 4]
        expect(result_a).to eq([1, 4, 2])

        result_b = [2, 3, 4].∖ [1, 2, 3]
        expect(result_b).to eq([4])
      end
    end
  end

end
