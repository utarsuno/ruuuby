# coding: UTF-8

RSpec.describe 'ary' do

  context 'extends class{Array}' do

    context 'by adding function{≈≈} (equal_contents?)' do
      context 'handles needed scenarios' do
        context 'for cases: positive' do
          it 'handles empty values' do
            expect(([].≈≈([]))).to eq(true)
          end
          it 'handles regular checks' do
            expect(([1].≈≈([1]))).to eq(true)
            expect(([nil].≈≈([nil]))).to eq(true)
            expect(([1, nil, 'a', 1].≈≈([nil, 'a', 1, 1]))).to eq(true)
            expect(([nil, nil].≈≈([nil, nil]))).to eq(true)
            expect(([1, 2, 3].≈≈([3, 1, 2]))).to eq(true)
            expect(([1, 2, 3].≈≈([1, 2, 3]))).to eq(true)
            expect(([1, 4, 2].≈≈([1, 2, 4]))).to eq(true)
          end
        end
        context 'for cases: negative' do
          it 'handles empty values' do
            expect([].≈≈ [nil]).to eq(false)
            expect([nil].≈≈ []).to eq(false)
          end
          it 'handles regular checks' do
            expect(([1, 2, 3].≈≈([1, 2]))).to eq(false)
            expect(([1, 'a', 1].≈≈(['a', 1]))).to eq(false)
            expect(([1, nil, 'a', 1].≈≈([nil, 'a', 1]))).to eq(false)
            expect(([nil].≈≈([]))).to eq(false)
            expect(([5].≈≈([9]))).to eq(false)
            expect(([5].≈≈([]))).to eq(false)
            expect(([].≈≈([9]))).to eq(false)
            expect(([5].≈≈([9, 4]))).to eq(false)
          end
        end
      end
      it 'detects bad param' do
        expect{%w().≈≈ nil}.to raise_exception(ArgumentError, "| c{Array}-> m{≈≈} got arg(them) w/ type{NilClass}, required-type{Array} |")
        expect{[1, nil, 'abc'].≈≈({})}.to raise_exception(ArgumentError, "| c{Array}-> m{≈≈} got arg(them) w/ type{Hash}, required-type{Array} |")
      end
    end

    context 'by adding function{📊} (frequency counts)' do
      context 'handles needed scenarios' do
        it 'for cases: empty' do
          expect([].📊).to eq({})
        end
        it 'for cases: positive' do
          results = {}
          results[nil] = 1
          results[1] = 2
          results[2] = 1
          results['a'] = 1
          results['1'] = 1
          results[[]] = 1

          expect([1, 1, 2, 'a', '1', nil, []].📊).to eq(results)

          results_one      = {}
          results_one['1'] = 1
          results_one[1]   = 1
          expect(['1', 1].📊).to eq(results_one)

          results_just_one = {}
          results_just_one['1'] = 1
          expect(['1'].📊).to eq(results_just_one)

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

    context 'by adding function{disjunctive_union} (symmetric difference), (alias: ⊕)' do
      context 'handles needed scenarios' do
        it 'for cases: one side is empty' do
          expect(([].⊕ [])).to eq([])
          expect(([1, 2, 3].⊕ [])).to eq([1, 2, 3])
          expect(([].⊕ [1, 2, 3])).to eq([1, 2, 3])
        end
        it 'for cases: positive' do
          expect(([1, 2, 3].⊕([3, 4])).≈≈([1, 2, 4])).to eq(true)
          expect(([1, 2, 3, 1, 1].⊕([3, 4])).≈≈([1, 2, 4, 1, 1])).to eq(true)
          expect([3, 4].⊕([1, 2, 3]).≈≈([1, 2, 4])).to eq(true)
        end
        it 'for matching output of: (self - ary) | (ary - self)' do
          ary_a  = [1337, 8, 2, 9, 3, 56, 1337]
          ary_b  = [9, 2, 1337, 929645, 0]
          result = ((ary_a - ary_b) | (ary_b - ary_a))
          expect((ary_a.⊕(ary_b)).≈≈(result)).to eq(true)
        end
        it 'for cases: bad param' do
          expect{%w().⊕ nil}.to raise_exception(ArgumentError)
        end
      end
    end

    context 'func{ensure_start!}' do
      context 'works for needed scenarios' do
        it 'with empty input scenarios' do
          expect([].ensure_start!([])).to eq([[]])
          expect([].ensure_start!()).to eq([])
          expect([].ensure_start!('a', 1)).to eq(['a', 1])
          expect([].ensure_start!(['a'])).to eq([['a']])
          expect(['a'].ensure_start!([])).to eq([[], 'a'])
          expect(['a', nil].ensure_start!(nil)).to eq([nil, 'a', nil])
          expect([].ensure_start!(['a', 'b', 1337])).to eq([['a', 'b', 1337]])
        end
        it 'works for cases: positive' do
          expect([2].ensure_start!('a', 1, 333)).to eq(['a', 1, 333, 2])
          expect(['b', 'a', 'a'].ensure_start!('b')).to eq(['b', 'a', 'a'])
          expect(['b', 'a', 'a'].ensure_start!('b', ['a'])).to eq(['b', ['a'], 'b', 'a', 'a'])
          expect(['b', 'a', 'a'].ensure_start!('a')).to eq(['a', 'b', 'a', 'a'])
          expect(['b', 'a', 'a'].ensure_start!('b', 'a')).to eq(['b', 'a', 'a'])
          expect(['b', 'a', 'a'].ensure_start!('b', 'a', 'a')).to eq(['b', 'a', 'a'])
          expect(['b', 'a', 'a'].ensure_start!('b', 'b', 'a')).to eq(['b', 'b', 'a', 'a'])
          expect(['b', 'a', 'a'].ensure_start!('b', 'b', 'a', 'a')).to eq(['b', 'b', 'a', 'a'])
          expect(['b', nil, 'a'].ensure_start!('b', 'b', 'a', 22, 'b')).to eq(['b', 'b', 'a', 22, 'b', nil, 'a'])
          expect(['b', 'a', 'a'].ensure_start!('b', 'b', 'b', 'a')).to eq(['b', 'b', 'b', 'a', 'a'])
          expect(['b', 'a', 'a'].ensure_start!('b', 'b', 'b', 'a', 'b')).to eq(['b', 'b', 'b', 'a', 'b', 'a', 'a'])
          expect(['b', 'a', 'a'].ensure_start!('b', 'b', 'b', 'a', 'a')).to eq(['b', 'b', 'b', 'a', 'a'])
          expect(['b', 'a', 'a'].ensure_start!('b', 'b', 'a', 'a', 'a')).to eq(['b', 'b', 'a', 'a', 'a', 'b', 'a', 'a'])
          expect(['a', 'b', 'c', 1, 2, 3, 'x', nil, 'z'].ensure_start!(1, 2, 3)).to eq([1, 2, 3, 'a', 'b', 'c', 1, 2, 3, 'x', nil, 'z'])
        end
      end
    end

    context 'func{ensure_ending!}' do
      context 'works for needed scenarios' do
        it 'with empty input scenarios' do
          expect([].ensure_ending!([])).to eq([[]])
          expect([].ensure_ending!(['a'])).to eq([['a']])
          expect(['a'].ensure_ending!([])).to eq(['a', []])
          expect([].ensure_ending!(['a', 'b', 1337])).to eq([['a', 'b', 1337]])
        end
        it 'works for cases: positive' do
          expect([].ensure_ending!('a')).to eq(['a'])
          expect([].ensure_ending!('a', 'a')).to eq(['a', 'a'])
          expect([nil].ensure_ending!('a', 2, nil, nil)).to eq([nil, 'a', 2, nil, nil])

          expect(['a'].ensure_ending!('b')).to eq(%w(a b))
          expect(['a'].ensure_ending!(['b'])).to eq(['a', ['b']])
          expect(['a'].ensure_ending!('b', 'c')).to eq(%w(a b c))
          expect(%w(a bb).ensure_ending!('cc')).to eq(%w(a bb cc))
          expect([3, nil, {b: 'apple'}].ensure_ending!(nil, {b: 'apple'}, 4)).to eq([3, nil, {b: 'apple'}, 4])
          expect([3, nil, {b: 'apple'}].ensure_ending!(nil, {b: 'apple'}, nil, 4)).to eq([3, nil, {b: 'apple'}, nil, 4])
          expect([3, nil, {b: 'apple'}].ensure_ending!(nil, {b: 'apple'}, 4, nil)).to eq([3, nil, {b: 'apple'}, 4, nil])
          expect(['a', 1337, nil, {}, ['b']].ensure_ending!(nil, {}, ['b'], 'c', 'cc', 123456)).to eq(['a', 1337, nil, {}, ['b'], 'c', 'cc', 123456])
          expect(%w(b a).ensure_ending!(%w(a a a))).to eq(['b', 'a', %w(a a a)])
          expect(%w(b a).ensure_ending!('a', 'a', 'a')).to eq(%w(b a a a))
          expect(%w(b).ensure_ending!('a', 'a', 'a')).to eq(%w(b a a a))
          expect(%w(b a a).ensure_ending!('a', 'a', 'a')).to eq(%w(b a a a))
        end
        it 'works for complex-cases: positive' do
          big_node = ['CC', nil, 9]
          expect([3, 'b', big_node].ensure_ending!('b', big_node, 'aa')).to eq([3, 'b', big_node, 'aa'])
          expect(['6', 2].ensure_ending!(2, 2, 2, 2, 2, 2, 2, 2)).to eq(['6', 2, 2, 2, 2, 2, 2, 2, 2])
          expect(['6', 2, 3].ensure_ending!(2, 3)).to eq(['6', 2, 3])
          expect(['6', 2, 3].ensure_ending!(3, 3)).to eq(['6', 2, 3, 3])
          expect(['6', 2].ensure_ending!(3, 3)).to eq(['6', 2, 3, 3])
          expect(['6', 2, 3].ensure_ending!(2, 3, 3)).to eq(['6', 2, 3, 3])
          expect(['6', 2, 3].ensure_ending!(2, 3, 4)).to eq(['6', 2, 3, 4])
        end
        it 'preserves object_id' do
          big_node = ['CC', nil, 9]
          node_id  = big_node.🆔
          expect([3, 'b', big_node].ensure_ending!('b', big_node, 'aa')).to eq([3, 'b', big_node, 'aa'])
          expect(big_node.🆔).to eq(node_id)
        end
      end
    end

    context 'by adding function{∖} (relative complement)' do
      it 'works correctly' do
        expect([2, 3, 4].∖([1, 2, 3])).to eq([4])
        expect([1, 2, 3].∖([2, 3, 4])).to eq([1])
        expect([1, 1, 2, 2, 3].∖([2, 3, 4])).to eq([1, 1])
      end
      it 'detects bad param' do
        expect{%w().∖ nil}.to raise_exception(ArgumentError)
      end
    end

    context 'func{start_with?}' do
      context 'works for needed scenarios' do
        it 'works for cases: positive' do
          expect([nil].start_with?(nil)).to eq(true)
          expect([nil, 1].start_with?(nil, 1)).to eq(true)
          expect([nil, false].start_with?(nil)).to eq(true)
          expect([nil, 1, false].start_with?(nil, 1)).to eq(true)
          expect(['a', 1, 3, 3, 3, 'b', nil, [], []].start_with?('a', 1, 3, 3)).to eq(true)
        end
        it 'works for cases: negative' do
          expect([nil].start_with?([])).to eq(false)
          expect([].start_with?([])).to eq(false)
          expect([].start_with?(nil)).to eq(false)
          expect([1].start_with?([1])).to eq(false)
          expect([1, 2].start_with?(2, 1)).to eq(false)
          expect([nil].start_with?('')).to eq(false)
        end
      end
    end

    context 'func{end_with?}' do
      context 'works for needed scenarios' do
        it 'works for cases: positive' do
          expect([nil].end_with?(nil)).to eq(true)
          expect([nil, 1].end_with?(nil, 1)).to eq(true)
          expect([false, nil].end_with?(nil)).to eq(true)
          expect([false, nil, 1].end_with?(nil, 1)).to eq(true)

          expect([1, 2, 'a'].end_with?(2, 'a')).to eq(true)
          expect([1, 2, ['a']].end_with?(2, ['a'])).to eq(true)
          expect(['a', []].end_with?([])).to eq(true)
          expect(['a', [[]]].end_with?([[]])).to eq(true)
          expect(['a', 1337].end_with?(1337)).to eq(true)
          expect(['a', 1337, nil].end_with?(nil)).to eq(true)
          expect(['a', 1337, nil, ''].end_with?('')).to eq(true)
          expect(['a', ['bb'], 5, 'a', ['bb']].end_with?('a', ['bb'])).to eq(true)
          expect([{a: 'b'}, 'a', [['b']], :c].end_with?([['b']], :c)).to eq(true)
        end
        it 'works for cases: negative' do
          expect([].end_with?()).to eq(false)
          expect([nil].end_with?()).to eq(false)
          expect([].end_with?(nil)).to eq(false)
          expect([1, 2, 'a'].end_with?()).to eq(false)
          expect([1, 2, 'a'].end_with?(['a'])).to eq(false)

          expect([nil].end_with?(1, 2, 3, 4, 5)).to eq(false)
        end
      end
    end

    context 'by adding function{remove_empty!}' do
      context 'handles cases' do
        context 'positive' do
          it 'all empty' do
            expect([].remove_empty!).to eq([])
            expect([nil, nil, '', nil, [], Set[]].remove_empty!).to eq([])
            expect([{}, 1, nil, nil, nil, nil].remove_empty!).to eq([1])
            expect([nil, nil, 'a', nil, 2, 'aa'].remove_empty!).to eq(['a', 2, 'aa'])
            expect([1, 2, 3].remove_empty!).to eq([1, 2, 3])
          end
          it 'complicated array' do
            scenario = ['0', nil, 'a', 1337, [], {}, 0, '', 'hiya', {nil: nil}]
            expect(scenario.remove_empty!).to eq(['0', 'a', 1337, 0, 'hiya', {nil: nil}])
          end
        end
        it 'negative' do
          expect(%w().remove_empty!).to eq(%w())
        end
        it 'frozen arrays' do
          expect{[1337, 'abc', nil, {leet: 'okay'}, [], 0, 'yikes'].❄️.remove_empty!}.to raise_error(FrozenError)
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
            new_obj   = Object.🆕
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

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do
    it 'func{📊} runs fast enough' do
      expect{[1, nil, 'a', 1, [], 'b', 6, 6, 3, 1].📊}.to perform_very_quickly
    end
    it 'func{≈≈} runs fast enough' do
      expect{[1, 'a', nil, [], 1].≈≈([1, nil, 'a', 1, []])}.to perform_very_quickly
    end
    it 'func{⊕} runs fast enough' do
      expect{[1, 2, 3].⊕ [3, 4]}.to perform_very_quickly
    end
    it 'func{∖} runs fast enough' do
      expect{[1, 2, 3].∖ [2, 3, 4]}.to perform_quickly
    end

    context 'func{ensure_start!} runs fast enough' do
      it 'for scenarios: positive' do
        expect{expect(%w(b a a).ensure_start!('b', 'b', 'b', 'a', 'b'))}.to perform_very_quickly
      end
    end

    context 'func{start_with?} runs fast enough' do
      it 'for scenarios: positive' do
        expect{['a', 1, 3, 3, 3, 'b', nil, [], []].start_with?('a', 1, 3, 3)}.to perform_very_quickly
      end
      it 'for scenarios: negative' do
        expect{[1, 2].start_with?(2, 1)}.to perform_very_quickly
      end
    end

    context 'func{end_with?} runs fast enough' do
      it 'for scenarios: positive' do
        expect{['a', ['bb'], 5, 'a', ['bb']].end_with?('a', ['bb'])}.to perform_very_quickly
      end
      it 'for scenarios: negative' do
        expect{[1, 2, 'a'].end_with?(['a'])}.to perform_very_quickly
      end
    end

    context 'func{ensure_ending!} runs fast enough' do
      it 'for scenarios: positive' do
        expect{[3, nil, {b: 'apple'}].ensure_ending!(nil, {b: 'apple'}, 4)}.to perform_very_quickly
      end
    end

    it 'func{remove_empty!}: runs perform_quickly' do
      expect{[%w(a bb c)].remove_empty!}.to perform_very_quickly
      expect{[nil, nil, 'c'].remove_empty!}.to perform_very_quickly
      scenario = ['0', nil, 'a', 1337, [], {}, 0, '', 'hiya', {nil: nil}]
      expect{scenario.remove_empty!}.to perform_quickly
    end
    it 'func{remove_empty!}: runs quickly with a bigger array' do
      scenario = ['0', nil, 'a', 1337, [], {}, 0, '', 'hiya', {nil: nil}, nil, nil, nil, 1, [{}], [], nil, [], 1, 2, 56672323]
      expect{scenario.remove_empty!}.to perform_quickly
    end
    it 'func{remove_empty!}: runs quickly with an even bigger array' do
      scenario = [123, 123, :f, :rsdvd, 532512, "fcer\n", [[[[[['a'], 'b']]]]], '0', nil, 'a', 1337, [], {}, 0, '', 'hiya', {nil: nil}, nil, nil, nil, 1, [{}], [], nil, [], 1, 2, 56672323]
      expect{scenario.remove_empty!}.to perform_quickly
    end

    # TODO: performance tests for: {η̂!}
  end

end
