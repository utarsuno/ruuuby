# coding: UTF-8

RSpec.describe 'f05_b00' do

  context 'functionality' do
    context 'extends class{String}' do
      context 'by adding func{>>}' do
        context 'handling needed scenarios' do
          context 'cases: positive' do
            it 'simple data' do
              [['', ''], %w(a a), %w(ab ab), [" abcde 101 \n", " abcde 101 \n"]].∀{|a|expect('' >> a[0]).to eq(a[1])}
            end
            it 'complex data' do
              expect('' >> '').to eq('')
              expect('' >> 'a').to eq('a')
              expect('b' >> '').to eq('b')
              expect('b' >> 'a').to eq('ab')
              expect('baa' >> 'ba').to eq('babaa')
              expect('baaDd' >> 'baaDdd').to eq('baaDddbaaDd')

              expect('γ' >> '𝚽').to eq('𝚽γ')
              expect('⁻¹' >> 'ᵣ𝔸').to eq('ᵣ𝔸⁻¹')
              expect('⁹' >> 'ᵣ𝔸').to eq('ᵣ𝔸⁹')

              expect('Ä°nanÃ§ EsaslarÄ' >> '1').to eq('1Ä°nanÃ§ EsaslarÄ')
            end
            it 'preserves object_id' do
              a = 'apple'
              b = a.🆔
              a >> 'c'
              expect(a).to eq('capple')
              expect(a.🆔).to eq(b)
            end
          end
          context 'cases: error' do
            it 'catches wrong parameter type provided' do
              [nil, 1337, {}].∀{|a|expect{'' >> a}.to raise_exception(ArgumentError)}
              expect{'' >> [1] }.to raise_error(ArgumentError)
              expect{'' >> nil }.to raise_error(ArgumentError)
              expect{'' >> 1337 }.to raise_error(ArgumentError)
              expect{'' >> {'apple' => 'aa'} }.to raise_error(ArgumentError)
            end
            it 'catches frozen strings' do
              a = 'my_frozen_string'.❄️
              a.❄️
              expect{a.>>('bbb')}.to raise_error(FrozenError)
            end
          end
        end
      end
    end
  end

  context 'audit', :audit do
    context '{f05_b00} passes audits' do
      context 'needed funcs are defined in expected location' do
        it 'for c{Array}' do
          expect_∃⨍(:>>, ::String)
        end
      end
    end
  end # end: {audit}

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do
    let(:a_str){'any54wyv45hv'}

    context 'following scenarios passed required benchmarks' do
      it 'func{>>}' do
        expect{''.>> ''}.to perform_extremely_quickly
        expect{''.>> 'bASDVASb5t4t'}.to perform_very_quickly
        expect{a_str.>> 'bASDVASb5t4t'}.to perform_very_quickly
      end
    end

  end

end
