# encoding: UTF-8

RSpec.describe 'f12' do

  context 'needed global funcs get added to main' do
    context 'func{📁}' do
      it 'aliases ::File' do
        expect(📁).to eq(::File)
      end
    end
    context 'func{🗄️}' do
      it 'aliases ::Dir' do
        expect(🗄️).to eq(::Dir)
      end
    end
  end

  context 'audit', :audit do

    context 'feature(f12) passes audits (tests not relating to observed functionality)' do
      context 'funcs provided are defined in correct location' do
        context 'for c{File}' do
          it 'static functions' do
            expect_∃static⨍(:replace_expr_with!, ::File)
            expect_∃static⨍(:replace_expr_with, ::File)
            expect_∃static⨍(:insert_line_before_expr, ::File)
            expect_∃static⨍(:insert_lines_before_expr, ::File)
            expect_∃static⨍(:dirname⁴, ::File)
            expect_∃static⨍(:dirname³, ::File)
            expect_∃static⨍(:dirname², ::File)
            expect_∃static⨍(:∃?, ::File)
          end
          it 'instance functions' do
            expect_∃⨍(:∅?, ::File)
          end
        end
      end
    end

  end

end
