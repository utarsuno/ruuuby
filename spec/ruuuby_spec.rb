RSpec.describe Ruuuby do
  context 'defines the current version' do
    it 'has a version number' do
      expect(subject::VERSION).not_to be nil
      expect(subject::VERSION.class).to eq(String)
    end
    it 'has valid version number syntax' do
      expect(%r(\A\d.\d.\d\z).match?(subject::VERSION)).to eq(true)
    end
  end
  context 'has correct namings, definitions, and scopes' do
    it 'is a Module' do
      expect(subject.class).to eq(::Module)
    end
    it 'has correct gem name' do
      expect(subject.name.downcase).to eq('ruuuby')
    end
    it 'exists on global scope' do
      expect(defined?(::Ruuuby)).to eq('constant')
    end
    context 'has all needed modules' do
      it 'has module[Enum]' do
        expect(Ruuuby.const_defined?('Enum')).to eq(true)
      end
    end
  end
end
