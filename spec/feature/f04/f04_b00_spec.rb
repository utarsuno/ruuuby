# encoding: UTF-8

RSpec.describe 'f04_b00' do

  context 'functionality' do

    context 'for c{String}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'w/o alias' do
            expect(''.empty?).to eq(true)
          end
          it 'w/ alias' do
            expect(''.∅?).to eq(true)
          end
        end
        context 'cases: negative' do
          it 'w/o alias' do
            expect(' '.empty?).to eq(false)
            expect("\t".empty?).to eq(false)
            expect($/.empty?).to eq(false)
            expect("0".empty?).to eq(false)
            expect("∅".empty?).to eq(false)
            expect("❓".empty?).to eq(false)
          end
          it 'w/ alias' do
            expect(' '.∅?).to eq(false)
            expect("\t".∅?).to eq(false)
            expect($/.∅?).to eq(false)
            expect("0".∅?).to eq(false)
            expect("∅".∅?).to eq(false)
            expect("❓".∅?).to eq(false)
          end
          it 'w/ Class instance' do
            expect(::String.respond_to?(:∅?)).to eq(false)
          end
        end
      end
    end # end: {for c{String}}

  end # end: {functionality}

  context 'audit', :audit do
    context 'feature(f04_b00) passes audits' do
      context 'funcs provided are defined in correct location' do
        it 'for Enumerables' do
          expect_∃⨍(:∅?, ::Hash)
          expect_∃⨍(:∅?, ::Array)
          expect_∃⨍(:∅?, ::Set)
          expect_∃⨍(:∅?, ::String)
        end
      end
    end
  end # end: {audit}


  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'the following perform extremely quickly' do
      context 'func{∅?}' do
        context 'for needed scenarios' do
          context 'w/ String' do
            it 'cases: positive' do
              expect{''.∅?}.to perform_extremely_quickly
              expect{''.empty?}.to perform_extremely_quickly
            end
            it 'cases: negative' do
              expect{' '.∅?}.to perform_extremely_quickly
              expect{''.empty?}.to perform_extremely_quickly
            end
          end
        end
      end
    end

  end # end: {performance}

end
