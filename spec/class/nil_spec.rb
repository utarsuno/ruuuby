
RSpec.describe 'nil' do
  context 'extends class[NilClass]' do
    context 'by adding function[empty?' do
      it 'exists' do
        expect(NilClass.method_defined?(:empty?)).to eq(true)
      end
      it 'and returns correct value{true}' do
        expect(nil.empty?).to eq(true)
      end
      it 'without effecting NilClass instance' do
        expect(NilClass.respond_to?(:empty?)).to eq(false)
      end
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    it 'func[empty?]: runtime <= .00001s' do
      expect{nil.empty?}.to perform_extremely_quickly
    end
  end

end
