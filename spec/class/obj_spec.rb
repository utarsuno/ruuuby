
RSpec.describe 'Object' do

  context 'creates Ruuuby aliases' do
    it '🆔 --> object_id' do
      expect_response_to(::Object, :🆔)
      leet = 1337
      expect(leet.object_id == leet.🆔).to eq(true)
    end
    it '❄️ --> freeze' do
      expect_response_to(::Object, :❄️)
      leet = [999999, 'a']
      expect(leet.frozen?).to eq(false)
      leet.❄️
      expect(leet.frozen?).to eq(true)
    end
    it '❄️? --> frozen?' do
      expect_response_to(::Object, :❄️?)
      leet = [999999, 'a']
      expect(leet.❄️?).to eq(false)
      leet.freeze
      expect(leet.❄️?).to eq(true)
    end
  end

end
