
RSpec.describe 'nil' do
  context 'creates function[empty?] for class[NilClass]' do
    it 'responds to function[empty?]' do
      expect(nil.respond_to?(:empty?)).to eq(true)
    end
    it 'returns correct value{true}' do
      expect(nil.empty?).to eq(true)
    end
  end
end
