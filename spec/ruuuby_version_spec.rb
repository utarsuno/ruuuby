# coding: utf-8

RSpec.describe Ruuuby::Version do
  context 'defines the current version' do
    it 'has a version number' do
      [subject::VERSION, ::Ruuuby::VERSION].∀{|scenario|expect(scenario.str? && scenario.❄️?).to eq(true)}
    end
    it 'major version matches' do
      expect(subject::VERSION.split('.')[0].to_i).to eq(0)
    end
    it 'minor version matches' do
      expect(subject::VERSION.split('.')[1].to_i).to eq(0)
    end
    it 'tiny version matches' do
      expect(subject::VERSION.split('.')[2].to_i).to eq(18)
    end
    context 'preventing changes' do
      it 'version number can not be changed' do
        expect{::Ruuuby::Version::MAJOR   = 1337}.to raise_error(FrozenError)
        expect{::Ruuuby::Version::MINOR   = 1337}.to raise_error(FrozenError)
        expect{::Ruuuby::Version::TINY    = 1337}.to raise_error(FrozenError)
        expect{::Ruuuby::Version::VERSION = '1.0.0'}.to raise_error(FrozenError)
      end
    end
    it 'has valid version number syntax' do
      expect(%r(\A\d.\d.\d(\d?)\z).match?(subject::VERSION)).to eq(true)
    end
  end
  context 'has correct scope' do
    it 'is a Module' do
      expect(subject.class).to eq(::Module)
    end
  end
end
