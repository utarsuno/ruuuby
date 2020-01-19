
RSpec.describe 'sym' do
  context 'extends class[Object]' do
    context 'by adding' do
      context 'function[sym?]' do
        it 'as expected' do
          expect_func_in_class(::Object, :sym?)
        end
        context 'with correct return values of' do
          it 'true' do
            expect(:test.sym?).to eq(true)
            another_test = :hello
            expect(another_test.sym?).to eq(true)
          end
          it 'false' do
            expect(nil.sym?).to eq(false)
            expect(1337.sym?).to eq(false)
            test = :test
            expect(test.to_s.sym?).to eq(false)
            expect('test'.sym?).to eq(false)
            expect(':test'.sym?).to eq(false)
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
    it 'func[sym?] runs extremely quickly' do
      expect{:sym.sym?}.to perform_extremely_quickly
    end
  end

end
