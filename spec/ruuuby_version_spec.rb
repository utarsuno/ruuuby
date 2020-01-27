# -*- encoding : utf-8 -*-

RSpec.describe Ruuuby::VERSION do
  context 'defines the current version' do
    it 'has a version number' do
      expect(subject::VERSION).not_to be nil
      expect(subject::VERSION.str?).to eq(true)
      expect(::Ruuuby.version).not_to be nil
      expect(::Ruuuby.version.str?).to eq(true)
    end
    it 'version number cant be changed' do
      expect{::Ruuuby::VERSION::VERSION = '1.0.0'}.to be_frozen
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
      expect(subject.name.downcase).to eq('ruuuby::version')
    end
    it 'exists on global scope' do
      expect(defined?(::Ruuuby::VERSION)).to eq('constant')
    end
    context 'has all needed modules' do
      it 'has module[Enum]' do
        expect(Ruuuby.const_defined?('Enum')).to eq(true)
      end
      it 'has module[Version]' do
        expect(Ruuuby.const_defined?('VERSION')).to eq(true)
      end
      it 'has func[version]' do
        expect_response_to(Ruuuby, 'version')
      end
    end
  end
end
