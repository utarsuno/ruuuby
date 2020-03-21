# coding: utf-8

RSpec.describe 'Object' do
  let(:data_default){Object.🆕}

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

    it 'has needed aliases' do
      RuuubyTestHelper::CONFIG_OBJECT[:ruby].∀{|c| expect(::Object.∃func?(c)).to eq(true)}
      RuuubyTestHelper::CONFIG_OBJECT[:c].∀{|config| expect(::Object.∃func?(config)).to eq(true)}
      RuuubyTestHelper::CONFIG_OBJECT[:aliases].∀{|base_func, func_alias| expect(::Object.∃func?(func_alias)).to eq(true)}
    end

    context 'by adding function{🛑bool❓}' do
      context 'handles needed input scenarios' do
        it 'cases[positive]' do
          expect{🛑bool❓('0', false)}.to_not raise_error
          expect{🛑🅱️❓('0', true)}.to_not raise_error
        end
        it 'cases[negative]' do
          expect{🛑bool❓('0', nil)}.to raise_error(ArgumentError)
          expect{🛑🅱️❓('0', nil)}.to raise_error(ArgumentError)
        end
      end
    end

    context 'by adding function{🛑int❓}' do
      context 'handles needed input scenarios' do
        it 'cases[positive]' do
          expect{🛑int❓('0', 5)}.to_not raise_error
        end
        it 'cases[negative]' do
          expect{🛑int❓('0', '5')}.to raise_error(ArgumentError)
        end
      end
    end

    context 'by adding function{🛑ary❓}' do
      context 'handles needed input scenarios' do
        it 'cases[positive]' do
          expect{🛑ary❓('0', [])}.to_not raise_error
        end
        it 'cases[negative]' do
          expect{🛑ary❓('0', nil)}.to raise_error(ArgumentError)
        end
      end
    end

    context 'by adding function{🛑str❓}' do
      context 'handles needed input scenarios' do
        it 'cases[positive]' do
          expect{🛑str❓('0', '5')}.to_not raise_error
        end
        it 'cases[negative]' do
          expect{🛑str❓('0', 5)}.to raise_error(ArgumentError)
        end
      end
    end

    context 'by adding function{🛑stry❓}' do
      context 'handles needed input scenarios' do
        it 'cases[positive]' do
          expect{🛑stry❓('0', '5')}.to_not raise_error
          expect{🛑stry❓('0', :a_symbol)}.to_not raise_error
        end
        it 'cases[negative]' do
          expect{🛑stry❓('0', 5)}.to raise_error(ArgumentError)
        end
      end
    end

    context 'by adding function{🛑countable❓}' do
      context 'handles needed input scenarios' do
        it 'cases[positive]' do
          expect{🛑countable❓('0', '5')}.to_not raise_error
          expect{🛑countable❓('0', data_ary_leet)}.to_not raise_error
          expect{🛑countable❓('0', data_set_leet)}.to_not raise_error
        end
        it 'cases[negative]' do
          expect{🛑countable❓('0', 5)}.to raise_error(ArgumentError)
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

    context 'by adding function{bool?}' do
      it 'without effecting TrueClass instance or FalseClass instance' do
        expect(TrueClass.bool?).to eq(false)
        expect(TrueClass.🅱️?).to eq(false)
        expect(FalseClass.bool?).to eq(false)
        expect(FalseClass.🅱️?).to eq(false)
        class MockTrue < TrueClass; end
        class MockFalse < TrueClass; end
        expect(MockTrue.bool?).to eq(false)
        expect(MockTrue.🅱️?).to eq(false)
        expect(MockFalse.bool?).to eq(false)
        expect(MockFalse.🅱️?).to eq(false)
      end
      context 'handles needed input scenarios' do
        it 'cases[positive]' do
          [true, false, 1 == 1, 1 != 2].∀{|n|expect(n.bool? && n.🅱️?).to eq(true)}
        end
        it 'cases[negative]' do
          [Class, Object, NilClass, '', 'true', 'False', -1, 1, 0, [], {}, [false], [true]].∀{|n|expect(n.bool? && n.🅱️?).to eq(false)}
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

    context 'by adding function{int?}' do
      it 'without effecting Class-instance{Integer}' do
        expect(Integer.int?).to eq(false)
      end
      context 'handles needed input scenarios' do
        it 'returns correct value{true}' do
          data_range_ints_boolean.∀{|n| expect(n.int?).to eq(true)}
        end
        it 'returns correct value{false}' do
          [nil, '', '1337', {}, []].∀{|n| expect(n.int?).to eq(false)}
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

    context 'by adding function{num?}' do
      it 'without effecting Class-instance{Integer, Float, Rational, Complex, BigDecimal}' do
        expect(::Integer.num?).to eq(false)
        expect(::Float.num?).to eq(false)
        expect(::Rational.num?).to eq(false)
        expect(::Complex.num?).to eq(false)
        expect(::BigDecimal.num?).to eq(false)
      end
      context 'handles needed input scenarios' do
        it 'returns correct value{true}' do
          expect(1.num?).to eq(true)
          expect(1.0.num?).to eq(true)
          expect(Rational(1, 1).num?).to eq(true)
          expect(Complex(1, 1).num?).to eq(true)
          expect(data_big_decimal_one.num?).to eq(true)
        end
        it 'returns correct value{false}' do
          [nil, '', '1337', {}, []].∀{|n| expect(n.num?).to eq(false)}
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
          class MockString < String; end
          mock_str = MockString.🆕('my_str')
          expect(mock_str.str?).to eq(false)
        end
      end
    end

    context 'by adding function{stry?}' do
      context 'with correct return values of' do
        it 'true' do
          ['hello_world', '_2', 'nil', 2.to_s].∀{|s|expect(s.stry? && s.to_sym.stry?).to eq(true)}
        end
        it 'false' do
          [String, nil, 0, 1, {}, [], ['str']].∀{|s|expect(s.stry?).to eq(false)}
        end
        it 'a newly created object inheriting String (does not match)' do
          class MockString < String; end
          mock_str = MockString.🆕('my_str')
          expect(mock_str.stry?).to eq(false)
        end
      end
    end

    context 'by adding function{sym?}' do
      context 'with correct return values of' do
        it 'true' do
          another_test = :hello
          [:test, another_test].∀{|n|expect(n.sym?).to eq(true)}
        end
        it 'false' do
          test = :test
          [nil, 1337, 'test', ':test', test.to_s].∀{|n|expect(n.sym?).to eq(false)}
        end
      end
      it 'without effecting Symbol instance' do
        expect(Symbol.sym?).to eq(false)
      end
    end

  end


  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do

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
        expect{true.🅱️?}.to perform_extremely_quickly
        expect{false.bool?}.to perform_extremely_quickly
        expect{false.🅱️?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{0.bool?}.to perform_extremely_quickly
        expect{0.🅱️?}.to perform_extremely_quickly
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

    context 'func{num?}: performs very quickly' do
      it 'for cases: true' do
        expect{1.num?}.to perform_very_quickly
        expect{1.0.num?}.to perform_very_quickly
        expect{data_rational_one.num?}.to perform_very_quickly
        expect{data_complex_one.num?}.to perform_very_quickly
        expect{data_big_decimal_one.num?}.to perform_very_quickly

      end
      it 'for cases: false' do
        expect{'0'.num?}.to perform_very_quickly
        expect{nil.num?}.to perform_very_quickly
        expect{::Integer.num?}.to perform_very_quickly
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

    context 'func{stry?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{'a'.stry?}.to perform_extremely_quickly
        expect{:a.stry?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{5.stry?}.to perform_extremely_quickly
      end
    end

    context 'func{🛑bool❓}: performs extremely quickly' do
      it 'cases[positive]' do
        expect{🛑bool❓('0', false)}.to perform_extremely_quickly
        expect{🛑🅱️❓('0', true)}.to perform_extremely_quickly
      end
      # TODO: missing coverage
      #it 'cases[negative]' do
      #  expect{🛑bool❓('0', nil)}.to perform_extremely_quickly
      #end
    end

    context 'func{🛑int❓}: performs extremely quickly' do
      it 'cases[positive]' do
        expect{🛑int❓('0', 5)}.to perform_extremely_quickly
      end
      # TODO: missing coverage
      #it 'cases[negative]' do
      #  expect{🛑int❓('0', '5')}.to perform_extremely_quickly
      #end
    end

    context 'func{🛑ary❓}: performs extremely quickly' do
      it 'cases[positive]' do
        expect{🛑ary❓('0', [])}.to perform_extremely_quickly
      end
      # TODO: missing coverage
      #it 'cases[negative]' do
      #  expect{🛑ary❓('0', nil)}.to perform_extremely_quickly
      #end
    end

    context 'func{🛑str❓}: performs extremely quickly' do
      it 'cases[positive]' do
        expect{🛑str❓('0', '5')}.to perform_extremely_quickly
      end
      # TODO: missing coverage
      #it 'cases[negative]' do
      #  expect{🛑str❓('0', 5)}.to perform_extremely_quickly
      #end
    end

    context 'func{🛑stry❓}: performs extremely quickly' do
      it 'cases[positive]' do
        expect{🛑stry❓('0', '5')}.to perform_extremely_quickly
        expect{🛑stry❓('0', :a_symbol)}.to perform_extremely_quickly
      end
      # TODO: missing coverage
      #it 'cases[negative]' do
      #  expect{🛑stry❓('0', 5)}.to raise_error(ArgumentError)
      #end
    end

    context 'func{🛑countable❓}: performs extremely quickly' do
      it 'cases[positive]' do
        expect{🛑countable❓('0', '5')}.to perform_extremely_quickly
        expect{🛑countable❓('0', data_ary_leet)}.to perform_extremely_quickly
        expect{🛑countable❓('0', data_set_leet)}.to perform_extremely_quickly
      end
      # TODO: missing coverage
      #it 'cases[negative]' do
      #  expect{🛑countable❓('0', 5)}.to perform_extremely_quickly
      #end
    end

  end

end
