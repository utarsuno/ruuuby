
RSpec.describe Ruuuby::Enum::Emoji do
  context 'creates module[Emoji]' do
    it 'Ruuuby::Enum responds to [Emoji]' do
      expect(Ruuuby::Enum.const_defined?('Emoji')).to eq(true)
    end
    it 'with correct values' do
      expect(subject::WARNING).to eq("⚠️")
      expect(subject::POSITIVE).to eq("✅")
      expect(subject::NEGATIVE).to eq("❌")
    end
  end
end
