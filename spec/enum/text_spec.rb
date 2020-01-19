
RSpec.describe ::Ruuuby::Enum::Text do
  context 'creates module[Text]' do
    it 'Ruuuby::Enum responds to [Text]' do
      expect(::Ruuuby::Enum.const_defined?('Text')).to eq(true)
    end
    context 'with correct values' do
      it 'emoji: EOL_DOS' do
        expect(subject::EOL_DOS).to eq("\r\n")
        expect(subject::EOL_DOS.str?).to eq(true)
      end
      it 'emoji: EOL_UNIX' do
        expect(subject::EOL_UNIX).to eq("\n")
        expect(subject::EOL_UNIX.str?).to eq(true)
      end
    end
    context 'cant be changed' do
      it 'emoji: EOL_DOS' do
        expect {::Ruuuby::Enum::Text::EOL_DOS = :bad}.to be_frozen
      end
      it 'emoji: EOL_UNIX' do
        expect {::Ruuuby::Enum::Text::EOL_UNIX = :bad}.to be_frozen
      end
    end
  end
end
