# -*- encoding : utf-8 -*-

RSpec.describe 'sym' do

  context 'extends class[Object]' do
    context 'by adding' do
      context 'function[sym?]' do
        it 'as expected' do
          expect_func_in_class(::Object, :sym?)
        end
        context 'with correct return values of' do
          it 'true' do
            another_test = :hello
            [:test, another_test].⨍{|n|expect(n.sym?).to eq(true)}
          end
          it 'false' do
            test = :test
            [nil, 1337, 'test', ':test', test.to_s].⨍{|n|expect(n.sym?).to eq(false)}
          end
        end
        it 'without effecting Symbol instance' do
          expect(Symbol.sym?).to eq(false)
        end
      end
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    context 'func[sym?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{:sym.sym?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{'sym'.sym?}.to perform_extremely_quickly
      end
    end
  end

end
