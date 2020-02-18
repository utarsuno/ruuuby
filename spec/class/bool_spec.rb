# coding: utf-8

RSpec.describe 'Boolean' do
  context 'extending class[Object]' do
    context 'by adding function[bool?]' do
      it 'exists' do
        expect_func_in_class(::Object, :bool?)
      end
      it 'a newly created generic object also responds' do
        expect_response_to(Object.new, :bool?)
      end
      it 'without effecting TrueClass instance or FalseClass instance' do
        expect(TrueClass.bool?).to eq(false)
        expect(FalseClass.bool?).to eq(false)
        class MockTrue < TrueClass; end
        class MockFalse < TrueClass; end
        expect(MockTrue.bool?).to eq(false)
        expect(MockFalse.bool?).to eq(false)
      end
      context 'handles needed input scenarios' do
        it 'cases[positive]' do
          [true, false, 1 == 1, 1 != 2].⨍{|n|expect(n.bool?).to eq(true)}
        end
        it 'cases[negative]' do
          [Class, Object, NilClass, '', 'true', 'False', -1, 1, 0, [], {}, [false], [true]].⨍{|n|expect(n.bool?).to eq(false)}
        end
      end
    end
  end
  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    context 'func[bool?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{true.bool?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{0.bool?}.to perform_extremely_quickly
      end
    end
  end

end
