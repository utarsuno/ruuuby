# encoding: UTF-8

RSpec.describe 'f26' do
  let(:flag_f26_b00){💎.engine.stats_ext['F26_B00']}

  context 'functionality' do
    it 'main adds funcs{📅, 🕒, 📅🕒}' do
      if flag_f26_b00
        expect(📅).to eq(::Date)
        expect(🕒).to eq(::Time)
        expect(📅🕒).to eq(::DateTime)
      else
        expect{📅}.to raise_error(::NameError)
        expect{🕒}.to raise_error(::NameError)
        expect{📅🕒}.to raise_error(::NameError)
      end
    end
  end # end: {functionality}

  context 'audit', :audit do
    context 'feature(f26) passes audits' do
      context 'funcs provided are' do
        context 'defined in correct location' do
          it 'for module{String}' do
            expect_∃⨍(:iso8601?, String)
            expect_∃⨍(:as_iso8601, String)
          end
        end
      end
    end
  end
end
