# coding: utf-8

RSpec.describe Object do

  context 'extends class[Object]' do

    context 'by creating Ruuuby(Array) aliases' do
      it '∑ --> each' do
        expect_func_alias(::Array, :each, :∑)
      end
      it '⨍ --> map' do
        expect_func_alias(::Array, :map, :⨍)
      end
    end

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
          [[], [] + [], [[]], [nil], [true], [false], ['a'], [1, 2]].⨍{|n|expect(n.ary?).to eq(true)}
        end
        it 'cases[negative]' do
          [TrueClass, FalseClass, Class, Object, NilClass, '', 'true', 'false', -1, 1, 0, {}].⨍{|n|expect(n.ary?).to eq(false)}
        end
      end
    end

    context 'by adding function[>>]' do
      it 'was added' do
        expect_response_to(%w(), :>>)
      end
      it 'works correctly' do
        expect([] >> 1337).to eq([1337])
        expect([1337, 1337] >> 1337).to eq([1337, 1337, 1337])
        expect([1, 2, 3] >> 1337).to eq([1337, 1, 2, 3])
        expect([1, 2, 3] >> nil).to eq([nil, 1, 2, 3])
        expect([1, 2, 3] >> [1, 2]).to eq([[1, 2], 1, 2, 3])
      end
    end

    context 'by adding function[⊕] (symmetric difference)' do
      it 'was added' do
        expect_response_to(%w(), :⊕)
      end
      it 'works correctly' do
        expect([1, 2, 3].⊕([3, 4])).to eq([1, 2, 4])
      end
      it 'detects bad param' do
        expect{%w().⊕ nil}.to throw_arg_error
      end
    end

    context 'by adding function[∖] (relative complement)' do
      it 'was added' do
        expect_response_to(%w(), :∖)
      end
      it 'works correctly' do
        expect([2, 3, 4].∖([1, 2, 3])).to eq([4])
        expect([1, 2, 3].∖([2, 3, 4])).to eq([1])
        expect([1, 1, 2, 2, 3].∖([2, 3, 4])).to eq([1, 1])
      end
      it 'detects bad param' do
        expect{%w().∖ nil}.to throw_arg_error
      end
    end

    context 'func{∋?} (include?)' do
      it 'was added' do
        expect_response_to([], :∋?)
        expect_func_in_class(Array, :∋?)
      end
      it 'works correctly' do
        expect(['a', 1337, [[1337]]].∋? [[1337]]).to eq(true)
        expect(['a', 1337, [[1337]]].∋? 'b').to eq(false)
      end
    end

    context 'func{∌?} (include?)' do
      it 'was added' do
        expect_response_to([], :∌?)
        expect_func_in_class(Array, :∌?)
      end
      it 'works correctly' do
        expect(['a', 1337, [[1337]]].∌? [[1337]]).to eq(false)
        expect(['a', 1337, [[1337]]].∌? 'b').to eq(true)
      end
    end

    context 'by adding function[remove_empty!]' do
      it 'was added' do
        expect_response_to(%w(), :remove_empty!)
      end

      context 'handles cases[positive]' do
        it 'all empty' do
          expect([nil, nil, nil, nil, nil, nil].remove_empty!).to eq([])
          expect([nil, 1, nil, nil, nil, nil].remove_empty!).to eq([1])
          expect([nil, nil, 'a', nil, 2, 'aa'].remove_empty!).to eq(['a', 2, 'aa'])
        end
        it 'normal array' do
          expect([1, 2, 3].remove_empty!).to eq([1, 2, 3])
        end
        it 'complicated array' do
          scenario = ['0', nil, 'a', 1337, [], {}, 0, '', 'hiya', {nil: nil}]
          expect(scenario.remove_empty!).to eq(['0', 'a', 1337, 0, 'hiya', {nil: nil}])
        end
      end

      it 'handles cases[negative]' do
        expect(%w().remove_empty!).to eq(%w())
      end

      context 'frozen arrays' do
        it 'handles frozen arrays' do
          expect{[1337, 'abc', nil, {leet: 'okay'}, [], 0, 'yikes'].❄️.remove_empty!}.to be_frozen
        end
      end

      context 'dynamically re-assigns variable or not' do
        it 'assigns variable in-place' do
          scenario = ['a', 1337, nil, '', [], {}, 'b', 'c']
          scenario.remove_empty!
          expect(scenario).to eq(['a', 1337, 'b', 'c'])
        end
        it 'returns the same object (id)' do
          scenario    = [nil, 5, [], 6, nil]
          scenario_id = scenario.🆔
          scenario.remove_empty!
          expect(scenario.🆔).to eq(scenario_id)
          expect(scenario).to eq([5, 6])
        end
        it 'does not perform deep copy on individual elements' do
          new_obj   = Object.new
          ary_obj   = %w(a bb c)
          ary_id    = ary_obj.🆔
          scenario  = [ary_obj, [], 1337, nil, new_obj]
          reference = scenario[0]
          scenario.remove_empty!
          reference[0] = 'd'
          expect(scenario).to eq([%w(d bb c), 1337, new_obj])
          expect(scenario[0].🆔).to eq(ary_id)
        end
      end
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    it 'func[⊕] runs fast enough' do
      expect{[1, 2, 3].⊕ [3, 4]}.to perform_quickly
    end
    it 'func[∖] runs fast enough' do
      expect{[1, 2, 3].∖ [2, 3, 4]}.to perform_quickly
    end
    it 'func[>>] runs fast enough' do
      expect{[1, 2, 3] >> [2, 3, 4]}.to perform_quickly
    end
    context 'fast tests' do
      it 'func[ary?] runs extremely quickly' do
        expect{['a'].ary?}.to perform_extremely_quickly
      end
      it 'func[remove_empty!] (with small array) runs very quickly' do
        expect{[%w(a bb c)].remove_empty!}.to perform_very_quickly
        expect{[nil, nil, 'c'].remove_empty!}.to perform_very_quickly
      end
    end
    it 'func[remove_empty!]: runs quickly' do
      scenario = ['0', nil, 'a', 1337, [], {}, 0, '', 'hiya', {nil: nil}]
      expect{scenario.remove_empty!}.to perform_quickly
    end
    it 'func[remove_empty!]: runs quickly with a bigger array' do
      scenario = ['0', nil, 'a', 1337, [], {}, 0, '', 'hiya', {nil: nil}, nil, nil, nil, 1, [{}], [], nil, [], 1, 2, 56672323]
      expect{scenario.remove_empty!}.to perform_quickly
    end
    it 'func[remove_empty!]: runs quickly with an even bigger array' do
      scenario = [123, 123, :f, :rsdvd, 532512, "fcer\n", [[[[[['a'], 'b']]]]], '0', nil, 'a', 1337, [], {}, 0, '', 'hiya', {nil: nil}, nil, nil, nil, 1, [{}], [], nil, [], 1, 2, 56672323]
      expect{scenario.remove_empty!}.to perform_quickly
    end
  end

end
