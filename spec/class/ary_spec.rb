# coding: utf-8

RSpec.describe 'ary' do
  let(:data_empty){[]}

  context 'extends class[Object]' do

    it 'by creating needed aliases' do
      expect(::Array.∃func_alias?(:each, :∑)).to eq(true)
      expect(::Array.∃func_alias?(:each, :∀)).to eq(true)
      expect(::Array.∃func_alias?(:map, :⨍)).to eq(true)
      expect(::Array.∃func_alias?(:include?, :∋?)).to eq(true)
    end

    it 'by creating needed functions' do
      expect_response_to(data_empty, :>>)
      expect_response_to(data_empty, :≈)
      expect_response_to(data_empty, :📊)
      expect_response_to(data_empty, :⊕)
      expect_response_to(data_empty, :∖)
      expect_response_to(data_empty, :∋?)
      expect_response_to(data_empty, :∌?)
      expect_response_to(data_empty, :remove_empty!)
    end

    context 'by adding function[>>]' do
      it 'works correctly' do
        expect([] >> 1337).to eq([1337])
        expect([1337, 1337] >> 1337).to eq([1337, 1337, 1337])
        expect([1, 2, 3] >> 1337).to eq([1337, 1, 2, 3])
        expect([1, 2, 3] >> nil).to eq([nil, 1, 2, 3])
        expect([1, 2, 3] >> [1, 2]).to eq([[1, 2], 1, 2, 3])
      end
      it 'handles frozen arrays' do
        a = [1, 'a'].❄️
        a.❄️
        expect{a >> 'test'}.to raise_error(FrozenError)
      end
      it 'while preserving object_id' do
        a = [1337, 'a']
        b = a.🆔
        a >> []
        expect(a).to eq([[], 1337, 'a'])
        expect(a.🆔).to eq(b)
      end
    end

    context 'by adding function[≈] (equal_contents?)' do
      context 'handles needed scenarios' do
        it 'for cases: positive' do
          expect(([].≈([]))).to eq(true)
          expect(([1].≈([1]))).to eq(true)
          expect(([nil].≈([nil]))).to eq(true)
          expect(([1, nil, 'a', 1].≈([nil, 'a', 1, 1]))).to eq(true)
          expect(([nil, nil].≈([nil, nil]))).to eq(true)
          expect(([1, 2, 3].≈([3, 1, 2]))).to eq(true)
          expect(([1, 2, 3].≈([1, 2, 3]))).to eq(true)
          expect(([1, 4, 2].≈([1, 2, 4]))).to eq(true)
        end
        it 'for cases: negative' do
          expect(([1, 2, 3].≈([1, 2]))).to eq(false)
          expect(([1, 'a', 1].≈(['a', 1]))).to eq(false)
          expect(([1, nil, 'a', 1].≈([nil, 'a', 1]))).to eq(false)
          expect(([nil].≈([]))).to eq(false)
          expect(([5].≈([9]))).to eq(false)
          expect(([5].≈([]))).to eq(false)
          expect(([].≈([9]))).to eq(false)
          expect(([5].≈([9, 4]))).to eq(false)
        end
      end
      it 'detects bad param' do
        expect{%w().≈ nil}.to raise_exception(ArgumentError)
        expect{[1, nil, 'abc'].≈({})}.to raise_exception(ArgumentError)
      end
    end

    context 'by adding function[📊] (frequency counts)' do
      context 'handles needed scenarios' do
        it 'for cases: positive' do
          results = {}
          results[nil] = 1
          results[1] = 2
          results[2] = 1
          results['a'] = 1
          results['1'] = 1
          results[[]] = 1

          expect([1, 1, 2, 'a', '1', nil, []].📊).to eq(results)

          expect([].📊).to eq({})

          results2 = {}
          results2[nil] = 2
          expect([nil, nil].📊).to eq(results2)

          results3             = {}
          results3[1]          = 1
          results3['1']        = 2
          results3['']         = 1
          results3[nil]        = 3
          results3[Float::NAN] = 1
          results3[0]          = 1
          results3[[nil, nil]] = 2
          expect([[nil, nil], '1', nil, nil, 1, Float::NAN, '', '1', 0, nil, [nil, nil]].📊).to eq(results3)
        end
      end
    end

    context 'by adding function[⊕] (symmetric difference)' do
      it 'works correctly' do
        expect(([1, 2, 3].⊕([3, 4])).≈([1, 2, 4])).to eq(true)
        what = [3, 4].⊕([1, 2, 3])
        expect(what.≈([1, 2, 4])).to eq(true)
      end
      it 'matches output of: (self - ary) | (ary - self)' do
        ary_a  = [1337, 8, 2, 9, 3, 56, 1337]
        ary_b  = [9, 2, 1337, 929645, 0]
        result = ((ary_a - ary_b) | (ary_b - ary_a))
        expect((ary_a.⊕(ary_b)).≈(result)).to eq(true)
      end
      it 'detects bad param' do
        expect{%w().⊕ nil}.to raise_exception(ArgumentError)
      end
    end

    context 'by adding function[∖] (relative complement)' do
      it 'works correctly' do
        expect([2, 3, 4].∖([1, 2, 3])).to eq([4])
        expect([1, 2, 3].∖([2, 3, 4])).to eq([1])
        expect([1, 1, 2, 2, 3].∖([2, 3, 4])).to eq([1, 1])
      end
      it 'detects bad param' do
        expect{%w().∖ nil}.to raise_exception(ArgumentError)
      end
    end

    context 'func{∋?} (include?)' do
      it 'works correctly' do
        expect(['a', 1337, [[1337]]].∋? [[1337]]).to eq(true)
        expect(['a', 1337, [[1337]]].∋? 'b').to eq(false)
      end
    end

    context 'func{∌?} (include?)' do
      it 'works correctly' do
        expect(['a', 1337, [[1337]]].∌? [[1337]]).to eq(false)
        expect(['a', 1337, [[1337]]].∌? 'b').to eq(true)
      end
    end

    context 'by adding function[remove_empty!]' do

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
          expect{[1337, 'abc', nil, {leet: 'okay'}, [], 0, 'yikes'].❄️.remove_empty!}.to raise_error(FrozenError)
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
    it 'func[📊] runs fast enough' do
      expect{[1, nil, 'a', 1, [], 'b', 6, 6, 3, 1].📊}.to perform_very_quickly
    end
    it 'func[≈] runs fast enough' do
      expect{[1, 'a', nil, [], 1].≈([1, nil, 'a', 1, []])}.to perform_very_quickly
    end
    it 'func[⊕] runs fast enough' do
      expect{[1, 2, 3].⊕ [3, 4]}.to perform_very_quickly
    end
    it 'func[∖] runs fast enough' do
      expect{[1, 2, 3].∖ [2, 3, 4]}.to perform_quickly
    end
    it 'func[>>] runs fast enough' do
      expect{[1, 2, 3] >> [2, 3, 4]}.to perform_quickly
    end
    it 'func[remove_empty!]: runs perform_quickly' do
      expect{[%w(a bb c)].remove_empty!}.to perform_very_quickly
      expect{[nil, nil, 'c'].remove_empty!}.to perform_very_quickly
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
