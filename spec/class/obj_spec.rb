# encoding: UTF-8

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
      expect_added_ruby_methods(::Object, cΔ_Object)
      RuuubyTestHelper::CONFIG_OBJECT[:c].∀{|config| expect(::Object.∃⨍?(config)).to eq(true)}
      RuuubyTestHelper::CONFIG_OBJECT[:aliases].∀{|base_func, func_alias| expect(::Object.∃⨍?(func_alias)).to eq(true)}
    end

    context 'by adding function{🛑bool❓}' do
      context 'handles needed input scenarios' do
        context 'cases: positive' do
          it 'w/ single param' do
            expect{🛑bool❓('0', false)}.to_not raise_error
            expect{🛑🅱️❓('0', true)}.to_not raise_error
          end
          it 'w/ many params' do
            expect{🛑bool❓($PRM_MANY, [true, false])}.to_not raise_error
            expect{🛑🅱️❓($PRM_MANY, [true, false])}.to_not raise_error
          end
        end
        context 'cases: negative' do
          it 'w/ single param' do
            expect{🛑bool❓('0', nil)}.to raise_error(ArgumentError)
            expect{🛑🅱️❓('0', nil)}.to raise_error(ArgumentError)
          end
          it 'w/ many params' do
            expect{🛑bool❓($PRM_MANY, [true, nil])}.to raise_error(ArgumentError)
            expect{🛑🅱️❓($PRM_MANY, [nil, false])}.to raise_error(ArgumentError)
            expect{🛑🅱️❓($PRM_MANY, [nil, nil])}.to raise_error(ArgumentError)
          end
        end
      end
    end

    context 'by adding function{🛑int❓}' do
      context 'handles needed input scenarios' do
        context 'cases: positive' do
          context 'w/ normalization{ℕ}' do
            it 'w/ single param' do
              expect{🛑int❓('0', 5, :ℕ)}.to_not raise_error
            end
            it 'w/ many params' do
              expect{🛑int❓($PRM_MANY, [0, 1, 3, 1337], :ℕ)}.to_not raise_error
            end
          end
          context 'w/o extra normalization' do
            it 'w/ single param' do
              expect{🛑int❓('0', 5)}.to_not raise_error
            end
            it 'w/ many params' do
              expect{🛑int❓($PRM_MANY, [-1, 0, 1])}.to_not raise_error
            end
          end
        end
        context 'cases: negative' do
          context 'w/ bad normalizer' do
            it 'w/ single param' do
              expect{🛑int❓('0', 1337, nil)}.to raise_error(ArgumentError)
            end
            it 'w/ many params' do
              expect{🛑int❓('0', [-1, 0, 1], nil)}.to raise_error(ArgumentError)
            end
          end
          context 'w/ normalization{ℕ}' do
            it 'w/ single param' do
              expect{🛑int❓('0', -1337, :ℕ)}.to raise_error(ArgumentError)
            end
            it 'w/ many params' do
              expect{🛑int❓($PRM_MANY, [-1, 0, 1], :ℕ)}.to raise_error(ArgumentError)
            end
          end
          context 'w/o extra normalization' do
            it 'w/ single param' do
              expect{🛑int❓('0', '5')}.to raise_error(ArgumentError)
            end
            it 'w/ many params' do
              expect{🛑int❓($PRM_MANY, [-1, 0, nil])}.to raise_error(ArgumentError)
              expect{🛑int❓($PRM_MANY, [-1, '1', 1])}.to raise_error(ArgumentError)
              expect{🛑int❓($PRM_MANY, [[], 0, 1])}.to raise_error(ArgumentError)
              expect{🛑int❓($PRM_MANY, [nil, nil, nil])}.to raise_error(ArgumentError)
            end
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
          context 'w/ normalization{:power_superscript}' do
            it 'w/ single param' do
              expect{🛑sym❓('0', :⁸, :power_superscript)}.to_not raise_error
            end
            it 'w/ many params' do
              expect{🛑sym❓($PRM_MANY, [:⁸, :⁻⁴])}.to_not raise_error
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
              expect{🛑sym❓('0', :a, :power_superscript)}.to raise_error(ArgumentError)
            end
            it 'w/ many params' do
              expect{🛑sym❓($PRM_MANY, ['5', :a], :power_superscript)}.to raise_error(ArgumentError)
              expect{🛑sym❓($PRM_MANY, [:a, 1337], :power_superscript)}.to raise_error(ArgumentError)
              expect{🛑sym❓($PRM_MANY, [nil, :a], :power_superscript)}.to raise_error(ArgumentError)
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

    context 'by adding function{🛑stry❓}' do
      context 'handles needed input scenarios' do
        context 'cases: positive' do
          it 'w/ single param' do
            expect{🛑stry❓('0', '5')}.to_not raise_error
            expect{🛑stry❓('0', :symbol_fake)}.to_not raise_error
          end
          it 'w/ many params' do
            expect{🛑stry❓($PRM_MANY, ['symbol_fake', :symbol_fake])}.to_not raise_error
          end
        end
        context 'cases: negative' do
          it 'w/ single param' do
            expect{🛑stry❓('0', nil)}.to raise_error(ArgumentError)
          end
          it 'w/ many params' do
            expect{🛑stry❓($PRM_MANY, ['5', nil])}.to raise_error(ArgumentError)
            expect{🛑stry❓($PRM_MANY, [5, :symbol_fake])}.to raise_error(ArgumentError)
            expect{🛑stry❓($PRM_MANY, [nil, nil])}.to raise_error(ArgumentError)
          end
        end
      end
    end

    context 'by adding function{🛑ℤ❓}' do
      context 'handles needed input scenarios' do
        context 'cases: positive' do
          context 'w/ single param' do
            it 'handles numericals' do
              expect{🛑ℤ❓('0', 3)}.to_not raise_error
              expect{🛑ℤ❓('0', 3.0)}.to_not raise_error
              expect{🛑ℤ❓('0', Rational(3, 1))}.to_not raise_error
              expect{🛑ℤ❓('0', ℂ(3, 0))}.to_not raise_error
              expect{🛑ℤ❓('0', BigDecimal('3.0'))}.to_not raise_error
            end
            it 'handles strings representing numericals' do
              expect{🛑ℤ❓('0', '0')}.to_not raise_error
              expect{🛑ℤ❓('0', '1.0')}.to_not raise_error
            end
          end
          context 'w/ many params' do
            it 'handles numericals' do
              expect{🛑ℤ❓($PRM_MANY, [0, 3, 3.0, Rational(3, 1), ℂ(3, 0), BigDecimal('3.0')])}.to_not raise_error
            end
            it 'handles strings representing numericals' do
              expect{🛑ℤ❓($PRM_MANY, [0, 1, 2, '3'])}.to_not raise_error
              expect{🛑ℤ❓($PRM_MANY, ['0', 0, '3', '3.0', 5])}.to_not raise_error
            end
          end
        end
        context 'cases: negative' do
          context 'w/ single param' do
            it 'handles numericals not falling within ℤ' do
              expect{🛑ℤ❓('0', data_float_nan)}.to raise_error(ArgumentError)
              expect{🛑ℤ❓('0', data_float_inf)}.to raise_error(ArgumentError)
              expect{🛑ℤ❓('0', data_float_negative_inf)}.to raise_error(ArgumentError)
            end
            it 'handles string-numericals not falling within ℤ' do
              expect{🛑ℤ❓('0', '-∞')}.to raise_error(ArgumentError)
            end
          end
          context 'w/ many params' do
            it 'handles numericals not falling within 𝕌' do
              expect{🛑ℤ❓($PRM_MANY, [0, 3, data_float_nan])}.to raise_error(ArgumentError)
              expect{🛑ℤ❓($PRM_MANY, [0, 3, '-∞'])}.to raise_error(ArgumentError)
            end
            it 'handles non-numericals' do
              expect{🛑ℤ❓($PRM_MANY, [0, nil, 1])}.to raise_error(ArgumentError)
              expect{🛑ℤ❓($PRM_MANY, ['', 0, 1])}.to raise_error(ArgumentError)
              expect{🛑ℤ❓($PRM_MANY, [0, 1, []])}.to raise_error(ArgumentError)
            end
          end
        end
      end
    end

    context 'by adding function{🛑𝕌❓}' do
      context 'handles needed input scenarios' do
        context 'cases: positive' do
          context 'w/ single param' do
            it 'handles numericals' do
              expect{🛑𝕌❓('0', 0)}.to_not raise_error
              expect{🛑𝕌❓('0', 1.337)}.to_not raise_error
              expect{🛑𝕌❓('0', Rational(3, 5))}.to_not raise_error
              expect{🛑𝕌❓('0', ℂ(2, 3))}.to_not raise_error
              expect{🛑𝕌❓('0', BigDecimal('1.337'))}.to_not raise_error
            end
            it 'handles strings representing numericals' do
              expect{🛑𝕌❓('0', '0')}.to_not raise_error
              expect{🛑𝕌❓('0', '-1.337')}.to_not raise_error
            end
          end
          context 'w/ many params' do
            it 'handles numericals' do
              expect{🛑𝕌❓($PRM_MANY, [0, 3, 3.0, Rational(3, 1), ℂ(3, 0), BigDecimal('3.0')])}.to_not raise_error
            end
            it 'handles strings representing numericals' do
              expect{🛑𝕌❓($PRM_MANY, [-1, 0, 1, 2, '3'])}.to_not raise_error
            end
          end
        end
        context 'cases: negative' do
          context 'w/ single param' do
            it 'handles numericals not falling within 𝕌' do
              expect{🛑𝕌❓('0', data_float_nan)}.to raise_error(ArgumentError)
              expect{🛑𝕌❓('0', data_float_inf)}.to raise_error(ArgumentError)
              expect{🛑𝕌❓('0', data_float_negative_inf)}.to raise_error(ArgumentError)
            end
            it 'handles non-numericals' do
              expect{🛑𝕌❓('0', nil)}.to raise_error(ArgumentError)
              expect{🛑𝕌❓('0', [])}.to raise_error(ArgumentError)
              expect{🛑𝕌❓('0', '')}.to raise_error(ArgumentError)
            end
          end
          context 'w/ many params' do
            it 'handles numericals not falling within 𝕌' do
              expect{🛑𝕌❓($PRM_MANY, [0, data_float_nan, 1])}.to raise_error(ArgumentError)
              expect{🛑𝕌❓($PRM_MANY, [data_float_inf, 0, 1])}.to raise_error(ArgumentError)
              expect{🛑𝕌❓($PRM_MANY, [0, 1, data_float_negative_inf])}.to raise_error(ArgumentError)
            end
            it 'handles non-numerical types' do
              expect{🛑𝕌❓($PRM_MANY, [0, nil, 1])}.to raise_error(ArgumentError)
              expect{🛑𝕌❓($PRM_MANY, ['', 0, 1])}.to raise_error(ArgumentError)
              expect{🛑𝕌❓($PRM_MANY, [0, 1, []])}.to raise_error(ArgumentError)
            end
          end
        end
      end
    end

    context 'by adding function{🛑countable❓}' do
      context 'handles needed input scenarios' do
        context 'cases: positive' do
          it 'w/ single param' do
            expect{🛑countable❓('0', '5')}.to_not raise_error
            expect{🛑countable❓('0', data_ary_leet)}.to_not raise_error
            expect{🛑countable❓('0', data_set_leet)}.to_not raise_error
          end
          it 'w/ many params' do
            expect{🛑countable❓($PRM_MANY, ['symbol_fake', data_ary_leet, data_set_leet])}.to_not raise_error
          end
        end
        context 'cases: negative' do
          it 'w/ single param' do
            expect{🛑countable❓('0', nil)}.to raise_error(ArgumentError)
          end
          it 'w/ many params' do
            expect{🛑countable❓($PRM_MANY, ['1337', nil])}.to raise_error(ArgumentError)
            expect{🛑countable❓($PRM_MANY, [1337, data_ary_leet])}.to raise_error(ArgumentError)
            expect{🛑countable❓($PRM_MANY, [data_set_leet, nil])}.to raise_error(ArgumentError)
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
          expect(Class.module?).to eq(false)
          expect(String.module?).to eq(false)
          expect(NilClass.module?).to eq(false)
          expect(nil.module?).to eq(false)
          expect(:Symbol.module?).to eq(false)
          expect('String'.module?).to eq(false)
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
        end
        it 'cases: negative' do
          expect(String.singleton?).to eq(false)
          expect(💎.orm_meta.singleton?).to eq(false)
          expect(1337.singleton?).to eq(false)
        end
      end
    end

    context 'by adding function{nucleotide?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          [Ruuuby, Kernel, Class, String, NilClass].∀{|scenario| expect(scenario.nucleotide? && scenario.🧬?).to eq(true)}
        end
        it 'cases: negative' do
          [nil, :Symbol, 'String', []].∀{|scenario| expect(scenario.nucleotide? || scenario.🧬?).to eq(false)}
        end
      end
    end

    context 'by adding function{bool?}' do
      context 'handling needed scenarios' do
        it 'cases: positive' do
          [true, false, 1 == 1, 1 != 2].∀{|n|expect(n.bool? && n.🅱️? && n.🅱?).to eq(true)}
        end
        context 'cases: negative' do
          it 'without effecting TrueClass instance or FalseClass instance' do
            class MockTrue < TrueClass; end
            class MockFalse < FalseClass; end
            [TrueClass, FalseClass, MockTrue, MockFalse].∀{|scenario| expect(scenario.bool? || scenario.🅱️? || scenario.🅱?).to eq(false)}
          end
          it 'normal data types checks' do
            [Class, Object, NilClass, '', 'true', 'False', -1, 1, 0, [], {}, [false], [true]].∀{|n|expect(n.bool? || n.🅱️? || n.🅱?).to eq(false)}
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
          expect(ℂ(1, 1).num?).to eq(true)
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

      it 'w/ normalizer' do
        expect(:².sym?(:power_superscript)).to eq(true)
        expect(:a.sym?(:power_superscript)).to eq(false)

      end

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

    context 'funcs{🛑sym❓}: performs extremely quickly' do
      context 'cases: positive' do
        it 'w/ single param' do
          expect{🛑sym❓('0', :symbol_fake)}.to perform_extremely_quickly
        end
        it 'w/ many params' do
          expect{🛑sym❓($PRM_MANY, [:symbol_fake_other, :symbol_fake])}.to perform_extremely_quickly
        end
      end
      # TODO: missing coverage for negative scenarios
    end

    context 'func{🛑int❓}: performs extremely quickly' do
      it 'cases: positive' do
        expect{🛑int❓('0', 5)}.to perform_extremely_quickly
      end
      # TODO: missing coverage
      #it 'cases[negative]' do
      #  expect{🛑int❓('0', '5')}.to perform_extremely_quickly
      #end
    end

    context 'func{🛑ℤ❓}: performs very quickly' do
      it 'cases: positive' do
        expect{🛑ℤ❓('0', 5)}.to perform_extremely_quickly
      end
      # TODO: missing coverage
      #it 'cases[negative]' do
      #  expect{🛑ℤ❓('0', '5')}.to perform_extremely_quickly
      #end
    end

    context 'func{🛑𝕌❓}: performs very quickly' do
      it 'cases: positive' do
        expect{🛑𝕌❓('0', 5)}.to perform_extremely_quickly
      end
      # TODO: missing coverage
      #it 'cases[negative]' do
      #  expect{🛑𝕌❓('0', '5')}.to perform_extremely_quickly
      #end
    end

    context 'func{🛑ary❓}: performs extremely quickly' do
      it 'cases: positive' do
        expect{🛑ary❓('0', ::Array::EMPTY_INSTANCE)}.to perform_extremely_quickly
      end
      # TODO: missing coverage
      #it 'cases[negative]' do
      #  expect{🛑ary❓('0', nil)}.to perform_extremely_quickly
      #end
    end

    context 'func{🛑str❓}: performs extremely quickly' do
      it 'cases: positive' do
        expect{🛑str❓('0', '5')}.to perform_extremely_quickly
      end
      # TODO: missing coverage
      #it 'cases[negative]' do
      #  expect{🛑str❓('0', 5)}.to perform_extremely_quickly
      #end
    end

    context 'func{🛑stry❓}: performs extremely quickly' do
      it 'cases: positive' do
        expect{🛑stry❓('0', '5')}.to perform_extremely_quickly
        expect{🛑stry❓('0', :a_symbol)}.to perform_extremely_quickly
      end
      # TODO: missing coverage
      #it 'cases[negative]' do
      #  expect{🛑stry❓('0', 5)}.to raise_error(ArgumentError)
      #end
    end

    context 'func{🛑countable❓}: performs extremely quickly' do
      it 'cases: positive' do
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
