# encoding: UTF-8

RSpec.describe 'f26' do
  let(:flag_f00_b04){💎.engine.stats_ext['F26_B00']}

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
