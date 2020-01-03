
RSpec.describe Object do
  context 'creates function[ary?]' do
    it 'responds to function[ary?]' do
      expect(subject.respond_to?(:ary?)).to eq(true)
    end
    context 'handles all input scenarios' do
      it 'cases[positive]' do
        expect([].ary?).to eq(true)
        expect(([] + []).ary?).to eq(true)
        expect([[]].ary?).to eq(true)
        expect([nil].ary?).to eq(true)
        expect([false].ary?).to eq(true)
        expect([true].ary?).to eq(true)
        expect(['a'].ary?).to eq(true)
        expect([1, 2].ary?).to eq(true)
      end
      it 'cases[negative]' do
        expect(Array.ary?).to eq(false)
        expect(TrueClass.ary?).to eq(false)
        expect(FalseClass.ary?).to eq(false)
        expect(Class.ary?).to eq(false)
        expect(Object.ary?).to eq(false)
        expect(NilClass.ary?).to eq(false)
        expect(''.ary?).to eq(false)
        expect('true'.ary?).to eq(false)
        expect('false'.ary?).to eq(false)
        expect(-1.ary?).to eq(false)
        expect(1.ary?).to eq(false)
        expect(0.ary?).to eq(false)
        expect({}.ary?).to eq(false)
      end
    end
  end

  context 'extends functionality of class: Array' do
    context 'adds function: remove_empty!' do
      it 'was added' do
        expect(%w().respond_to?(:remove_empty!)).to eq(true)
      end
      context 'handles cases[positive]' do
        it 'all empty' do
          expect([nil, nil, nil, nil, nil, nil].remove_empty!).to eq([])
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

      context 'dynamically re-assigns variable or not' do
        it 'assigns variable in-place' do
          scenario = ['a', 1337, nil, '', [], {}, 'b', 'c']
          scenario.remove_empty!
          expect(scenario).to eq(['a', 1337, 'b', 'c'])
        end
        it 'keeps object-id the same' do
          scenario    = [nil, 5, [], 6, nil]
          scenario_id = scenario.object_id
          scenario.remove_empty!
          expect(scenario.object_id).to eq(scenario_id)
          expect(scenario).to eq([5, 6])
        end
      end
    end
  end
end
