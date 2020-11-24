# encoding: UTF-8

RSpec.describe 'f00_b01' do
  let(:f00_b04){Ruuuby::MetaData.engine.stats_ext['F00_B04']}

  context 'functionality' do

    context 'for c{String}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(''.∅?).to eq(true)
        end
        it 'cases: negative' do
          expect(' '.∅?).to eq(false)
          expect("\t".∅?).to eq(false)
          expect($/.∅?).to eq(false)
          expect('0'.∅?).to eq(false)
          expect('∅'.∅?).to eq(false)
          expect('❓'.∅?).to eq(false)
          expect('a'.∅?).to eq(false)
        end
      end
    end

    context 'for c{NilClass}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(nil.empty?).to eq(true)
          if f00_b04
            expect(nil.∅?).to eq(true)
          else
            expect{nil.∅?}.to_not raise_error
          end
        end
        it 'cases: negative' do
          expect(NilClass.respond_to?(:empty?)).to eq(false)
          expect(NilClass.respond_to?(:∅?)).to eq(false)
        end
        it 'cases: error' do
          unless f00_b04
            expect{nil.∅?}.to raise_error(::NoMethodError)
          end
        end
      end
    end

    context 'for {ENV}' do
      it 'handles needed case' do
        expect(ENV.∅?).to eq(ENV.empty?)
      end
    end
  end # end: {functionality}

  context 'f00_b01', :audit do
    context 'funcs provided are defined in correct location' do
      it 'for ENV' do
        expect(ENV.respond_to?(:∅?)).to eq(true)
      end
      it 'for data-structure based Classes' do
        expect_∃⨍(:∅?, ::Hash)
        expect_∃⨍(:∅?, ::Array)
        expect_∃⨍(:∅?, ::Set)
        expect_∃⨍(:∅?, ::String)
      end
      it 'for IO classes' do
        expect_∃⨍(:∅?, ::Dir)
        expect_∃⨍(:∅?, ::File)
      end
      it 'for NilClass' do
        expect_∃⨍(:∅?, ::NilClass)
      end

      context 'w/o side-effects' do
        it 'on classes effected' do
          expect(::String.respond_to?(:∅?)).to eq(false)
          expect(::NilClass.respond_to?(:∅?)).to eq(false)
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
        it 'w/ positive cases' do
          expect{nil.∅?}.to perform_extremely_quickly
          expect{''.∅?}.to perform_extremely_quickly
        end
        it 'w/ negative cases' do
          expect{' '.∅?}.to perform_extremely_quickly
        end
      end
    end

  end # end: {performance}

end
