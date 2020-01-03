
RSpec.describe Object do

  context 'creates function[bool?]' do
    context 'responds to function[bool?]' do
      it 'test subject' do
        expect(subject.respond_to?(:bool?)).to eq(true)
      end
      it 'a newly created generic object' do
        expect(Object.new.respond_to?(:bool?)).to eq(true)
      end
    end
    context 'handles all input scenarios' do
      it 'cases[positive]' do
        expect(true.bool?).to eq(true)
        expect(false.bool?).to eq(true)
        expect((1 == 1).bool?).to eq(true)
        expect((2 != 1).bool?).to eq(true)
      end
      it 'cases[negative]' do
        expect(TrueClass.bool?).to eq(false)
        expect(FalseClass.bool?).to eq(false)
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
    it 'func[bool?]: runtime <= .0001s' do
      expect{true.bool?}.to perform_under(0.0001).sec.sample(10).times
    end
  end

end
