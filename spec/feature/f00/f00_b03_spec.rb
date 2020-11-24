# encoding: UTF-8

RSpec.describe 'f00_b03' do

  context 'functionality' do
    it 'for ENV' do
      expect(ENV.𝔠).to eq(ENV.length)
    end
  end

  context 'audit', :audit do
    context 'feature(f03) passes audits' do
      context 'funcs provided are defined in correct location' do
        it 'for c{Proc}' do
          expect_∃⨍(:𝔠, ::Proc)
        end
        it 'for ENV' do
          expect(ENV.respond_to?(:𝔠)).to eq(true)
        end
        it 'for Enumerables' do
          expect_∃⨍(:𝔠, ::Hash)
          expect_∃⨍(:𝔠, ::Array)
          expect_∃⨍(:𝔠, ::Set)
          expect_∃⨍(:𝔠, ::String)
        end
      end
    end
  end

end
