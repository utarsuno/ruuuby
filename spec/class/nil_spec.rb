
RSpec.describe 'nil' do
  context 'creates function[empty?] for class[NilClass]' do
    it 'responds to function[empty?]' do
      expect(nil.respond_to?(:empty?)).to eq(true)
    end
    it 'returns correct value{true}' do
      expect(nil.empty?).to eq(true)
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    it 'func[empty?]: runtime <= .00001s' do
      expect{nil.empty?}.to perform_under(0.00001).sec.sample(10).times
    end
  end

end
