
RSpec.describe Object do
  context 'extends class[Object]' do
    context 'by adding function[ary?]' do
      it 'exists' do
        expect_func_in_class(::Object, :ary?)
      end
      it 'a newly created generic object also has it' do
        expect(Object.new.respond_to?(:ary?)).to eq(true)
      end
      it 'without effecting Array instance' do
        expect(Array.ary?).to eq(false)
      end
    end
    context 'handles needed input scenarios' do
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

    context 'by adding function[remove_empty!]' do
      it 'was added' do
        expect(%w().respond_to?(:remove_empty!)).to eq(true)
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

      context 'dynamically re-assigns variable or not' do
        it 'assigns variable in-place' do
          scenario = ['a', 1337, nil, '', [], {}, 'b', 'c']
          scenario.remove_empty!
          expect(scenario).to eq(['a', 1337, 'b', 'c'])
        end
        it 'returns the same object (id)' do
          scenario    = [nil, 5, [], 6, nil]
          scenario_id = scenario.object_id
          scenario.remove_empty!
          expect(scenario.object_id).to eq(scenario_id)
          expect(scenario).to eq([5, 6])
        end
        it 'does not perform deep copy on individual elements' do
          new_obj   = Object.new
          ary_obj   = %w(a bb c)
          ary_id    = ary_obj.object_id
          scenario  = [ary_obj, [], 1337, nil, new_obj]
          reference = scenario[0]
          scenario.remove_empty!
          reference[0] = 'd'
          expect(scenario).to eq([%w(d bb c), 1337, new_obj])
          expect(scenario[0].object_id).to eq(ary_id)
        end
      end
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
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
  end

end
