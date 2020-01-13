
RSpec.describe 'str' do
  context 'extends class[Object]' do
    context 'by adding function[str?]' do
      it 'responds to it' do
        expect(::Object.method_defined?(:str?)).to eq(true)
      end
      it 'a newly created generic object responds to it' do
        expect(String.new('strstr').respond_to?(:str?)).to eq(true)
      end
    end

    context 'covers needed scenarios' do
      it 'returns correct value{true}' do
        expect(''.str?).to eq(true)
        expect(' '.str?).to eq(true)
        expect('hello world'.str?).to eq(true)
        expect('2'.str?).to eq(true)
        expect('nil'.str?).to eq(true)
        expect(2.to_s.str?).to eq(true)
      end
      context 'handles case[negative]' do
        it 'returns {false}' do
          expect(String.str?).to eq(false)
          expect(nil.str?).to eq(false)
          expect(0.str?).to eq(false)
          expect(1.str?).to eq(false)
          expect({}.str?).to eq(false)
          expect(['str'].str?).to eq(false)
          expect(:str.str?).to eq(false)
        end
        it 'a newly created object inheriting String (does not match)' do
          class MockString < String; end
          mock_str = MockString.new('my_str')
          expect(mock_str.str?).to eq(false)
        end
      end
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    it 'func[str?]: runtime <= .00001s' do
      expect{'hi'.str?}.to perform_extremely_quickly
    end
  end

end
