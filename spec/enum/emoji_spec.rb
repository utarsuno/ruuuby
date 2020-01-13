
RSpec.describe Ruuuby::Enum::Emoji do
  context 'creates module[Emoji]' do
    it 'Ruuuby::Enum responds to [Emoji]' do
      expect(Ruuuby::Enum.const_defined?('Emoji')).to eq(true)
    end
    context 'with correct values' do
      it 'emoji: warning' do
        expect(subject::WARNING.to_s).to eq("⚠️")
        expect(subject::WARNING.class).to eq(Symbol)
      end
      it 'emoji: positive' do
        expect(subject::POSITIVE.to_s).to eq("✅")
        expect(subject::POSITIVE.class).to eq(Symbol)
      end
      it 'emoji: negative' do
        expect(subject::NEGATIVE.to_s).to eq("❌")
        expect(subject::NEGATIVE.class).to eq(Symbol)
      end
    end
    context 'cant be changed' do
      it 'emoji: warning' do
        expect {::Ruuuby::Enum::Emoji::POSITIVE = :bad}.to be_frozen
      end
      it 'emoji: positive' do
        expect {::Ruuuby::Enum::Emoji::NEGATIVE = :bad}.to be_frozen
      end
      it 'emoji: negative' do
        expect {::Ruuuby::Enum::Emoji::WARNING = :bad}.to be_frozen
      end
    end
  end
end
