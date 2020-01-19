
RSpec.describe 1337 do
  context 'extends class[Object]' do
    context 'by adding function[int?]' do
      it 'exists' do
        expect_func_in_class(::Object, :int?)
      end
      it 'a newly created generic object has it as well' do
        expect(Object.new.respond_to?(:int?)).to eq(true)
      end
      it 'without effecting Integer instance' do
        expect(Integer.int?).to eq(false)
      end
    end

    context 'handles needed input scenarios' do
      it 'returns correct value{true}' do
        expect(-1337.int?).to eq(true)
        expect(-1.int?).to eq(true)
        expect(0.int?).to eq(true)
        expect(1.int?).to eq(true)
        expect(1337.int?).to eq(true)
      end
      it 'returns correct value{false}' do
        expect(nil.int?).to eq(false)
        expect(''.int?).to eq(false)
        expect('9'.int?).to eq(false)
        expect({}.int?).to eq(false)
      end
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    it 'func[empty?]: runtime <= .00001s' do
      expect{5.int?}.to perform_extremely_quickly
    end
  end

end
