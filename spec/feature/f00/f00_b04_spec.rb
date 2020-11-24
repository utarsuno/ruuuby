# encoding: UTF-8

RSpec.describe 'f00_b04' do

  context 'functionality' do
    it 'main adds funcs{📅, 🕒, 📅🕒}' do
      if 💎.engine.stats_ext['F00_B04']
        expect(📅).to eq(::Date)
        expect(🕒).to eq(::Time)
        expect(📅🕒).to eq(::DateTime)
      else
        expect{📅}.to raise_error(::NameError)
        expect{🕒}.to raise_error(::NameError)
        expect{📅🕒}.to raise_error(::NameError)
      end
    end
  end

end
