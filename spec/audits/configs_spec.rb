# coding: UTF-8

RSpec.describe 'general configs' do
  let(:ruuuby_metadata){::Ruuuby::MetaData}
  let(:path_dir_ext){"#{💎.api_git.repo.workdir}ext"}
  let(:the_dir_ext){🗄️.🆕(path_dir_ext)}

  #                   __          ___     __
  #   /\     |  |    |  \    |     |     /__`
  #  /~~\    \__/    |__/    |     |     .__/

  context 'audit', :audit do

    context 'passes file structure audits' do
      context 'extension files have correct file schema' do
        it 'directory{ext/} is healthy' do

          puts "\t\t| --- parsing directory{ext/} --- "
          puts "\t\t| #{path_dir_ext} |"
          puts "\t\t| ------------------------------- "

          the_dir_ext.η̂_paths do |path|
            path_current_extension = "#{path_dir_ext}/#{path.to_s}"
            puts "\t\t| checking if directory: {#{path_current_extension}} w/ content"
            expect(🗄️.∃?(path_current_extension)).to eq(true)
            sub_paths = 🗄️.🆕("#{path_current_extension}/")
            expect(sub_paths.∅?).to eq(false)
            puts "\t\t\t| traversing directory: {#{path_current_extension}/}"
            sub_paths.η̂_paths do |sub_path|
              sub_full_path = "#{path_current_extension}/#{sub_path}"
              puts "\t\t\t| checking if file: {#{sub_full_path.to_s}}"
              expect(📁.∃?(sub_full_path)).to eq(true)
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

  end

end
