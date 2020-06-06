# coding: UTF-8

RSpec.describe 'f04' do

  context 'functionality' do
    context 'for c{NilClass}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(nil.empty?).to eq(true)
          expect(nil.∅?).to eq(true)
        end
        it 'cases: positive' do
          expect(NilClass.respond_to?(:empty?)).to eq(false)
          expect(NilClass.respond_to?(:∅?)).to eq(false)
        end
      end
    end
  end # end: {functionality}

  context 'audit', :audit do
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
  end # end: {audit}


  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'the following perform extremely quickly' do
      it 'func{empty?}' do
        expect{nil.empty?}.to perform_extremely_quickly
        expect{nil.∅?}.to perform_extremely_quickly
      end
    end

  end # end: {performance}

end
