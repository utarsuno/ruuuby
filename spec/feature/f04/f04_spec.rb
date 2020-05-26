# coding: UTF-8

RSpec.describe 'f04' do

  #context 'functionality' do
  #end

  context 'audits', :audits do
    context 'feature(f04) passes audits (tests not relating to observed functionality)' do
      context 'funcs provided are defined in correct location' do
        it 'for c{NilClass}' do
          expect_∃⨍(:∅?, ::NilClass)
        end
        it 'for c{Dir}' do
          expect_∃⨍(:∅?, ::Dir)
        end
        it 'for c{File}' do
          expect_∃⨍(:∅?, ::File)
        end
        it 'for Enumerables' do
          expect_∃⨍(:∅?, ::Hash)
          expect_∃⨍(:∅?, ::Array)
          expect_∃⨍(:∅?, ::Set)
        end
        it 'for ENV' do
          expect(ENV.respond_to?(:∅?)).to eq(true)
          expect(ENV.∅?).to eq(ENV.empty?)
        end
      end
    end
  end
end
