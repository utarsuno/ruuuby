# coding: UTF-8

RSpec.describe 'Object' do
  let(:data_default){Object.🆕}

  before :all do
    class MockString < String; end
    class MockTrue < TrueClass; end
    class MockFalse < FalseClass; end
  end

  context 'creates Ruuuby aliases' do
    it '🆔 --> object_id' do
      expect(::Object.respond_to?(:🆔)).to eq(true)
      leet = 1337
      expect(leet.object_id == leet.🆔).to eq(true)
    end
    it '❄️ --> freeze' do
      leet = [999999, 'a']
      expect(leet.frozen?).to eq(false)
      leet.❄️
      expect(leet.frozen?).to eq(true)
    end
    it '❄️? --> frozen?' do
      leet = [999999, 'a']
      expect(leet.❄️?).to eq(false)
      leet.freeze
      expect(leet.❄️?).to eq(true)
    end
  end

  context 'extends class[Object]' do

    context 'by adding function{🛑bool❓}' do
      context 'handles needed input scenarios' do
        context 'cases: positive' do
          it 'w/ single param' do
            expect{🛑bool❓('0', false)}.to_not raise_error
          end
          it 'w/ many params' do
            expect{🛑bool❓($PRM_MANY, [true, false])}.to_not raise_error
          end
        end
        context 'cases: negative' do
          it 'w/ single param' do
            expect{🛑bool❓('0', nil)}.to raise_error(ArgumentError)
          end
          it 'w/ many params' do
            expect{🛑bool❓($PRM_MANY, [true, nil])}.to raise_error(ArgumentError)
            expect{🛑bool❓($PRM_MANY, [nil, false])}.to raise_error(ArgumentError)
            expect{🛑bool❓($PRM_MANY, [nil, nil])}.to raise_error(ArgumentError)
          end
        end
      end
    end

    context 'by adding function{🛑θ❓}' do
      context 'handles needed input scenarios' do
        context 'cases: positive' do
          it 'w/ single param' do
            expect{🛑θ❓(:θ, θ°(360.0))}.to_not raise_error
            expect{🛑θ❓(:θ, θ°(360.0))}.to_not raise_error
          end
        end
        context 'cases: negative' do
          it 'w/ single param' do
            expect{🛑θ❓(:θ, nil)}.to raise_error(ArgumentError)
            expect{🛑θ❓(:θ, 360.0)}.to raise_error(ArgumentError)
          end
        end
      end
    end

    context 'by adding function{🛑ary❓}' do
      context 'handles needed input scenarios' do
        context 'cases: positive' do
          it 'w/ single param' do
            expect{🛑ary❓('0', [])}.to_not raise_error
          end
          it 'w/ many params' do
            expect{🛑ary❓($PRM_MANY, [[], [1], [[nil]]])}.to_not raise_error
          end
        end
        context 'cases: negative' do
          it 'w/ single param' do
            expect{🛑ary❓('0', nil)}.to raise_error(ArgumentError)
          end
          it 'w/ many params' do
            expect{🛑ary❓($PRM_MANY, ['5', nil])}.to raise_error(ArgumentError)
            expect{🛑ary❓($PRM_MANY, [nil, nil])}.to raise_error(ArgumentError)
            expect{🛑ary❓($PRM_MANY, [nil, nil])}.to raise_error(ArgumentError)
          end
        end
      end
    end

    context 'by adding function{🛑str❓}' do
      context 'handles needed input scenarios' do
        context 'cases: positive' do
          context 'w/ normalization{!∅}' do
            it 'w/ single param' do
              expect{🛑str❓('0', '5', :'!∅')}.to_not raise_error
              expect{🛑str❓('0', ' ', :'!∅')}.to_not raise_error
              expect{🛑str❓('0', "\n", :'!∅')}.to_not raise_error
            end
            it 'w/ many params' do
              expect{🛑str❓($PRM_MANY, %w(a bb), :'!∅')}.to_not raise_error
            end
          end
          context 'w/o extra normalization' do
            it 'w/ single param' do
              expect{🛑str❓('0', '5')}.to_not raise_error
              expect{🛑str❓('0', ' ')}.to_not raise_error
              expect{🛑str❓('0', "\n")}.to_not raise_error
            end
            it 'w/ many params' do
              expect{🛑str❓($PRM_MANY, %w(a bb))}.to_not raise_error
            end
          end
        end
        context 'cases: negative' do
          context 'w/ bad normalizer' do
            it 'w/ single param' do
              expect{🛑str❓('0', '', nil)}.to raise_error(ArgumentError)
            end
            it 'w/ many params' do
              expect{🛑str❓('0', ['a', '', 'bb'], nil)}.to raise_error(ArgumentError)
            end
          end
          context 'w/ normalization{!∅}' do
            it 'w/ single param' do
              expect{🛑str❓('0', '', :'!∅')}.to raise_error(ArgumentError)
            end
            it 'w/ many params' do
              expect{🛑str❓($PRM_MANY, ['a', '', 'bb'], :'!∅')}.to raise_error(ArgumentError)
            end
          end
          context 'w/o extra normalization' do
            it 'w/ single param' do
              expect{🛑str❓('0', nil)}.to raise_error(ArgumentError)
            end
            it 'w/ many params' do
              expect{🛑str❓($PRM_MANY, ['5', nil])}.to raise_error(ArgumentError)
              expect{🛑str❓($PRM_MANY, [5, '5'])}.to raise_error(ArgumentError)
              expect{🛑str❓($PRM_MANY, [nil, nil])}.to raise_error(ArgumentError)
            end
          end
        end
      end
    end

    context 'by adding function{🛑sym❓}' do
      context 'handles needed input scenarios' do
        context 'cases: positive' do
          context 'w/ normalization{:∈superscripts}' do
            it 'w/ single param' do
              expect{🛑sym❓('0', :⁸, :∈superscripts)}.to_not raise_error
            end
            it 'w/ many params' do
              expect{🛑sym❓($PRM_MANY, [:⁸, :⁻⁴], :∈superscripts)}.to_not raise_error
            end
          end
          context 'w/o normalization' do
            it 'w/ single param' do
              expect{🛑sym❓('0', :symbol_fake)}.to_not raise_error
            end
            it 'w/ many params' do
              expect{🛑sym❓($PRM_MANY, [:symbol_fake_other, :symbol_fake])}.to_not raise_error
            end
          end
        end
        context 'cases: negative' do
          context 'w/ bad normalization' do
            it 'w/ single param' do
              expect{🛑sym❓('0', :a, :∈superscripts)}.to raise_error(ArgumentError)
            end
            it 'w/ many params' do
              expect{🛑sym❓($PRM_MANY, ['5', :a], :∈superscripts)}.to raise_error(ArgumentError)
              expect{🛑sym❓($PRM_MANY, [:a, 1337], :∈superscripts)}.to raise_error(ArgumentError)
              expect{🛑sym❓($PRM_MANY, [nil, :a], :∈superscripts)}.to raise_error(ArgumentError)
            end
          end
          context 'w/o normalization' do
            it 'w/ single param' do
              expect{🛑sym❓('0', nil)}.to raise_error(ArgumentError)
            end
            it 'w/ many params' do
              expect{🛑sym❓($PRM_MANY, ['5', nil])}.to raise_error(ArgumentError)
              expect{🛑sym❓($PRM_MANY, [5, 1337])}.to raise_error(ArgumentError)
              expect{🛑sym❓($PRM_MANY, [nil, nil])}.to raise_error(ArgumentError)
            end
          end
        end
      end
    end

    context 'by adding function{ary?}' do
      it 'without effecting Array instance' do
        expect(Array.ary?).to eq(false)
      end
      context 'handles needed input scenarios' do
        it 'cases[positive]' do
          [[], [] + [], [[]], [nil], [true], [false], ['a'], [1, 2]].∀{|n|expect(n.ary?).to eq(true)}
        end
        it 'cases[negative]' do
          [TrueClass, FalseClass, Class, Object, NilClass, '', 'true', 'false', -1, 1, 0, {}].∀{|n|expect(n.ary?).to eq(false)}
        end
      end
    end

    context 'by adding function{module?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(Ruuuby.module?).to eq(true)
          expect(Kernel.module?).to eq(true)
        end
        it 'cases: negative' do
          [Class, String, NilClass, nil, :Symbol, 'String', 1337].∀{|scenario|expect(scenario.module?).to eq(false)}
        end
      end
    end

    context 'by adding function{class?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(Class.class?).to eq(true)
          expect(String.class?).to eq(true)
          expect(NilClass.class?).to eq(true)
        end
        it 'cases: negative' do
          expect(Ruuuby.class?).to eq(false)
          expect(nil.class?).to eq(false)
          expect(:Symbol.class?).to eq(false)
          expect('String'.class?).to eq(false)
        end
      end
    end

    context 'by adding function{singleton?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(💎.api.singleton?).to eq(true)
          expect(💎.orm.singleton?).to eq(true)
          expect(💎.engine.singleton?).to eq(true)
        end
        it 'cases: negative' do
          expect(💎.meta_orm.singleton?).to eq(false)
          expect(String.singleton?).to eq(false)
          expect(💎.meta_orm.singleton?).to eq(false)
          expect(1337.singleton?).to eq(false)
        end
      end
    end

    context 'by adding function{nucleotide?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          [Ruuuby, Kernel, Class, String, NilClass].∀{|scenario| expect(scenario.nucleotide?).to eq(true)}
        end
        it 'cases: negative' do
          [nil, :Symbol, 'String', []].∀{|scenario| expect(scenario.nucleotide?).to eq(false)}
        end
      end
    end

    context 'by adding function{bool?}' do
      context 'handling needed scenarios' do
        it 'cases: positive' do
          [true, false, 1 == 1, 1 != 2].∀{|n|expect(n.bool?).to eq(true)}
        end
        context 'cases: negative' do
          it 'without effecting TrueClass instance or FalseClass instance' do
            [TrueClass, FalseClass, MockTrue, MockFalse].∀{|scenario| expect(scenario.bool?).to eq(false)}
          end
          it 'normal data types checks' do
            [Class, Object, NilClass, '', 'true', 'False', -1, 1, 0, [], {}, [false], [true]].∀{|n|expect(n.bool?).to eq(false)}
          end
        end
      end
    end

    context 'function{θ?}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'w/ single param' do
            expect(θ°(0).θ?).to eq(true)
            expect(θᵍ(0).θ?).to eq(true)
            expect(θʳ(0).θ?).to eq(true)
            expect(θ𝞽(0).θ?).to eq(true)
          end
        end
        context 'cases: negative' do
          it 'w/ single param' do
            expect(0.θ?).to eq(false)
            expect(360.0.θ?).to eq(false)
            expect(Rational(::Math::PI, 2).θ?).to eq(false)
            expect(nil.θ?).to eq(false)
            expect(''.θ?).to eq(false)
          end
        end
      end
    end

    context 'function{θ?}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'w/ single param' do
            expect(θ°(0).θ?).to eq(true)
            expect(θᵍ(0).θ?).to eq(true)
            expect(θʳ(0).θ?).to eq(true)
            expect(θ𝞽(0).θ?).to eq(true)
          end
        end
        context 'cases: negative' do
          it 'w/ single param' do
            expect(0.θ?).to eq(false)
            expect(360.0.θ?).to eq(false)
            expect(Rational(::Math::PI, 2).θ?).to eq(false)
            expect(nil.θ?).to eq(false)
            expect(''.θ?).to eq(false)
          end
        end
      end
    end

    context 'by adding function{hsh?}' do
      it 'without effecting Integer instance' do
        expect(Hash.hsh?).to eq(false)
      end
      context 'handles needed input scenarios' do
        it 'returns correct value{true}' do
          [{}, {'a' => 5}, {a: {}}, {nil: nil}, {[] => nil}].∀{|h|expect(h.hsh?).to eq(true)}
        end
        it 'returns correct value{false}' do
          [nil, '', '{}', [], [{}], 1337].∀{|h|expect(h.hsh?).to eq(false)}
        end
      end
    end

    context 'by adding function{flt?}' do
      it 'without effecting Class-instance{Float}' do
        expect(Float.flt?).to eq(false)
      end
      context 'handles needed input scenarios' do
        it 'returns correct value{true}' do
          data_range_floats_boolean.∀{|n| expect(n.flt?).to eq(true)}
        end
        it 'returns correct value{false}' do
          [nil, '', '1337', {}, [], 2].∀{|n| expect(n.flt?).to eq(false)}
        end
      end
    end

    context 'by adding function{str?}' do
      context 'with correct return values of' do
        it 'true' do
          ['', ' ', 'hello world', '2', 'nil', 2.to_s].∀{|s|expect(s.str?).to eq(true)}
        end
        it 'false' do
          [String, nil, 0, 1, {}, [], ['str'], :str].∀{|s|expect(s.str?).to eq(false)}
        end
        it 'a newly created object inheriting String (does not match)' do
          expect(MockString.🆕('my_str').str?).to eq(false)
        end
      end
    end

    context 'by adding function{sym?}' do
      context 'w/ normalizer(:∈superscripts)' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'regular exponents' do
              expect(:⁴.sym?(:∈superscripts)).to eq(4)
              expect(:².sym?(:∈superscripts)).to eq(2)
              expect(:⁰.sym?(:∈superscripts)).to eq(0)
              expect(:⁻².sym?(:∈superscripts)).to eq(-2)
              expect(:⁻⁴.sym?(:∈superscripts)).to eq(-4)
            end
            it '± inf' do
              expect(:∞.sym?(:∈superscripts)).to eq(::Float::INFINITY)
              expect(:'-∞'.sym?(:∈superscripts)).to eq(::Float::INFINITY_NEGATIVE)
            end
            it 'complex inf' do
              expect(:∞ℂ.sym?(:∈superscripts)).to eq(::Float::INFINITY_COMPLEX)
            end
          end
          context 'cases: negative' do
            it 'invalid inf' do
              expect(:∞∞.sym?(:∈superscripts)).to eq(false)
              expect(:'--∞'.sym?(:∈superscripts)).to eq(false)
            end
            it 'complex inf' do
              expect(:ℂ∞ℂ.sym?(:∈superscripts)).to eq(false)
            end
            it 'invalid exponent' do
              expect(:²²².sym?(:∈superscripts)).to eq(false)
              expect(:₂.sym?(:∈superscripts)).to eq(false)
              expect(:a.sym?(:∈superscripts)).to eq(false)
            end
          end
        end
      end # end: {w/ normalizer(:∈superscripts)}

      context 'w/o any normalizer' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            [:test, :hello, :²²², :₂].∀{|n|expect(n.sym?).to eq(true)}
          end
          it 'cases: negative' do
            [Symbol, nil, 1337, 'test', ':test', :test.to_s].∀{|n|expect(n.sym?).to eq(false)}
          end
        end
      end # end: {w/o any normalizer}
    end # end: {by adding function{sym?}}
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'func{class?}: performs very quickly' do
      it 'for cases: true' do
        expect{NilClass.class?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{nil.class?}.to perform_very_quickly
      end
    end

    context 'func{module?}: performs very quickly' do
      it 'for cases: true' do
        expect{Ruuuby.module?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{String.module?}.to perform_very_quickly
      end
    end

    context 'func{singleton?}: performs very quickly' do
      it 'for cases: true' do
        expect{💎.api.singleton?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{String.singleton?}.to perform_very_quickly
      end
    end

    context 'func{nucleotide?}: performs very quickly' do
      it 'for cases: true' do
        expect{Ruuuby.nucleotide?}.to perform_very_quickly
      end
      it 'for cases: false' do
        expect{nil.nucleotide?}.to perform_very_quickly
      end
    end

    context 'func{sym?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{:sym.sym?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{'sym'.sym?}.to perform_extremely_quickly
      end
    end

    context 'func{ary?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{['a'].ary?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{0.ary?}.to perform_extremely_quickly
      end
    end

    context 'func{bool?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{true.bool?}.to perform_extremely_quickly
        expect{false.bool?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{0.bool?}.to perform_extremely_quickly
      end
    end

    context 'func{hsh?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{{}.hsh?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{5.hsh?}.to perform_extremely_quickly
      end
    end

    context 'func{int?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{5.int?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{'0'.int?}.to perform_extremely_quickly
      end
    end

    context 'func{flt?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{5.0.flt?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{'0'.flt?}.to perform_extremely_quickly
      end
    end

    context 'func{str?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{''.str?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{5.str?}.to perform_extremely_quickly
      end
    end

    context 'func{🛑bool❓}: performs extremely quickly' do
      it 'cases[positive]' do
        expect{🛑bool❓('0', false)}.to perform_extremely_quickly
      end
    end

    context 'funcs{🛑sym❓}: performs extremely quickly' do
      context 'cases: positive' do
        it 'w/ single param' do
          expect{🛑sym❓('0', :symbol_fake)}.to perform_extremely_quickly
        end
        it 'w/ many params' do
          expect{🛑sym❓($PRM_MANY, [:symbol_fake_other, :symbol_fake])}.to perform_extremely_quickly
        end
      end
    end

    context 'func{🛑int❓}: performs extremely quickly' do
      it 'cases: positive' do
        expect{🛑int❓('0', 5)}.to perform_extremely_quickly
      end
    end
    context 'func{🛑ary❓}: performs extremely quickly' do
      it 'cases: positive' do
        expect{🛑ary❓('0', [])}.to perform_extremely_quickly
      end
    end

    context 'func{🛑str❓}: performs extremely quickly' do
      it 'cases: positive' do
        expect{🛑str❓('0', '5')}.to perform_extremely_quickly
      end
    end

    context 'function{🛑θ❓}: performs extremely quickly' do
      context 'for needed scenarios' do
        context 'cases: positive' do
          it 'w/ single param' do
            the_angle = θ°(360.0)
            expect{🛑θ❓(:θ, the_angle)}.to perform_extremely_quickly
          end
        end
      end
    end

  end

end
