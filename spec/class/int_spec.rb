
RSpec.describe 1337 do
  context 'creates function[int?] for class[Object]' do
    context 'responds to function[int?]' do
      it 'test subject' do
        expect(subject.respond_to?(:int?)).to eq(true)
      end
      it 'a newly created generic object' do
        expect(Object.new.respond_to?(:int?)).to eq(true)
      end
    end

    context 'covers all scenarios' do
      it 'returns correct value{true}' do
        expect(-1337.int?).to eq(true)
        expect(-1.int?).to eq(true)
        expect(0.int?).to eq(true)
        expect(1.int?).to eq(true)
        expect(1337.int?).to eq(true)
      end
      it 'returns correct value{false}' do
        expect(Integer.int?).to eq(false)
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
      expect{5.int?}.to perform_under(0.00001).sec.sample(10).times
    end
  end

end
