# encoding: UTF-8

RSpec.describe 'f12' do
  let(:flag_f12_b00){💎.engine.stats_ext['F12_B00']}

  context 'needed global funcs get added to main' do
    context 'func{📁}' do
      it 'aliases File' do
        if flag_f12_b00
          expect(📁).to eq(::File)
        else
          expect{📁}.to raise_error(::NameError)
        end
      end
    end
    context 'func{🗄️}' do
      it 'aliases Dir' do
        if flag_f12_b00
          expect(🗄️).to eq(::Dir)
        else
          expect{🗄️}.to raise_error(::NameError)
        end
      end
    end
  end

  context 'audit', :audit do

    context 'feature(f12) passes audits' do
      context 'funcs provided are defined in correct location' do
        context 'for c{File}' do
          it 'static functions' do
            expect_∃⨍_static(:replace_expr_with!, ::File)
            expect_∃⨍_static(:replace_expr_with, ::File)
            expect_∃⨍_static(:insert_line_before_expr, ::File)
            expect_∃⨍_static(:insert_lines_before_expr, ::File)
            expect_∃⨍_static(:∃?, ::File)
          end
          it 'instance functions' do
            expect_∃⨍(:∅?, ::File)
          end
        end
      end
    end

  end

end
