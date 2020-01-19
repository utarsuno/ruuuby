
RSpec.describe 'Boolean' do
  context 'extending class[Object]' do
    context 'by adding function[bool?]' do
      it 'exists' do
        expect_func_in_class(::Object, :bool?)
      end
      it 'a newly created generic object also responds' do
        expect(Object.new.respond_to?(:bool?)).to eq(true)
      end
      it 'without effecting TrueClass instance or FalseClass instance' do
        expect(TrueClass.bool?).to eq(false)
        expect(FalseClass.bool?).to eq(false)
        class MockTrue < TrueClass; end
        class MockFalse < TrueClass; end
        expect(MockTrue.bool?).to eq(false)
        expect(MockFalse.bool?).to eq(false)
      end
    end
    context 'handles needed input scenarios' do
      it 'cases[positive]' do
        expect(true.bool?).to eq(true)
        expect(false.bool?).to eq(true)
        expect((1 == 1).bool?).to eq(true)
        expect((2 != 1).bool?).to eq(true)
      end
      it 'cases[negative]' do
        expect(Class.bool?).to eq(false)
        expect(Object.bool?).to eq(false)
        expect(NilClass.bool?).to eq(false)
        expect(''.bool?).to eq(false)
        expect('true'.bool?).to eq(false)
        expect('false'.bool?).to eq(false)
        expect(-1.bool?).to eq(false)
        expect(1.bool?).to eq(false)
        expect(0.bool?).to eq(false)
        expect([].bool?).to eq(false)
        expect({}.bool?).to eq(false)
        expect([false].bool?).to eq(false)
        expect([true].bool?).to eq(false)
      end
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    it 'func[bool?]: runtime <= .00001s' do
      expect{true.bool?}.to perform_extremely_quickly
    end
  end

end
