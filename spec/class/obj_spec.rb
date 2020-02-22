# coding: utf-8

RSpec.describe 'Object' do

  context 'creates Ruuuby aliases' do
    it '🆔 --> object_id' do
      expect_response_to(::Object, :🆔)
      leet = 1337
      expect(leet.object_id == leet.🆔).to eq(true)
    end
    it '❄️ --> freeze' do
      expect_response_to(::Object, :❄️)
      leet = [999999, 'a']
      expect(leet.frozen?).to eq(false)
      leet.❄️
      expect(leet.frozen?).to eq(true)
    end
    it '❄️? --> frozen?' do
      expect_response_to(::Object, :❄️?)
      leet = [999999, 'a']
      expect(leet.❄️?).to eq(false)
      leet.freeze
      expect(leet.❄️?).to eq(true)
    end
  end

  context 'extends class[Object]' do

    context 'by adding function[ary?]' do
      it 'exists' do
        expect_func_in_class(::Object, :ary?)
      end
      it 'a newly created generic object responds to it' do
        expect_response_to(Object.new, :ary?)
      end
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

    context 'by adding function[bool?]' do
      it 'exists' do
        expect_func_in_class(::Object, :bool?)
      end
      it 'a newly created generic object also responds' do
        expect_response_to(Object.new, :bool?)
      end
      it 'without effecting TrueClass instance or FalseClass instance' do
        expect(TrueClass.bool?).to eq(false)
        expect(FalseClass.bool?).to eq(false)
        class MockTrue < TrueClass; end
        class MockFalse < TrueClass; end
        expect(MockTrue.bool?).to eq(false)
        expect(MockFalse.bool?).to eq(false)
      end
      context 'handles needed input scenarios' do
        it 'cases[positive]' do
          [true, false, 1 == 1, 1 != 2].∀{|n|expect(n.bool?).to eq(true)}
        end
        it 'cases[negative]' do
          [Class, Object, NilClass, '', 'true', 'False', -1, 1, 0, [], {}, [false], [true]].∀{|n|expect(n.bool?).to eq(false)}
        end
      end
    end

    context 'by adding function[hsh?]' do
      it 'exists' do
        expect_func_in_class(::Object, :hsh?)
      end
      it 'a newly created generic object responds to it' do
        expect_response_to(Object.new, :hsh?)
      end
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

    context 'by adding function[int?]' do
      it 'exists' do
        expect_func_in_class(::Object, :int?)
      end
      it 'a newly created generic object responds to it' do
        expect_response_to(Object.new, :int?)
      end
      it 'without effecting Integer instance' do
        expect(Integer.int?).to eq(false)
      end
      context 'handles needed input scenarios' do
        it 'returns correct value{true}' do
          [-1337, -1, 0, 1, 1337].∀{|n| expect(n.int?).to eq(true)}
        end
        it 'returns correct value{false}' do
          [nil, '', '1337', {}, []].∀{|n| expect(n.int?).to eq(false)}
        end
      end
    end

    context 'by adding function[str?]' do
      it 'as expected' do
        expect(::Object.method_defined?(:str?)).to eq(true)
      end
      it 'a newly created generic object responds to it' do
        expect_response_to(String.new('strstr'), :str?)
      end
      context 'with correct return values of' do
        it 'true' do
          ['', ' ', 'hello world', '2', 'nil', 2.to_s].∀{|s|expect(s.str?).to eq(true)}
        end
        it 'false' do
          [String, nil, 0, 1, {}, [], ['str'], :str].∀{|s|expect(s.str?).to eq(false)}
        end
        it 'a newly created object inheriting String (does not match)' do
          class MockString < String; end
          mock_str = MockString.new('my_str')
          expect(mock_str.str?).to eq(false)
        end
      end
    end

    context 'by adding function[sym?]' do
      it 'as expected' do
        expect_func_in_class(::Object, :sym?)
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
  context 'performance', :'performance' do

    context 'func[sym?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{:sym.sym?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{'sym'.sym?}.to perform_extremely_quickly
      end
    end

    context 'func[ary?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{['a'].ary?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{0.ary?}.to perform_extremely_quickly
      end
    end

    context 'func[bool?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{true.bool?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{0.bool?}.to perform_extremely_quickly
      end
    end

    context 'func[hsh?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{{}.hsh?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{5.hsh?}.to perform_extremely_quickly
      end
    end

    context 'func[int?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{5.int?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{'0'.int?}.to perform_extremely_quickly
      end
    end

    context 'func[str?]: performs extremely quickly' do
      it 'for cases: true' do
        expect{''.str?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{5.str?}.to perform_extremely_quickly
      end
    end

  end

end
