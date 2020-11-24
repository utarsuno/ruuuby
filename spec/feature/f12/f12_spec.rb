# encoding: UTF-8

RSpec.describe 'f12' do

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
