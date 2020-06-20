# encoding: UTF-8

RSpec.describe 'f06_b03' do

  context 'functionality' do

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

    context 'by adding function{🛑ary❓}' do
      context 'handles needed input scenarios' do
        context 'cases: positive' do
          context 'w/ normalization{∉∅}' do
            it 'w/ single param' do
              expect{🛑ary❓('0', [nil], :∉∅)}.to_not raise_error
              expect{🛑ary❓('0', [1337, '1337'], :∉∅)}.to_not raise_error
            end
            it 'w/ many params' do
              expect{🛑ary❓($PRM_MANY, [[nil], [1], [[nil]]], :∉∅)}.to_not raise_error
            end
          end
          context 'w/o extra normalization' do
            it 'w/ single param' do
              expect{🛑ary❓('0', [])}.to_not raise_error
            end
            it 'w/ many params' do
              expect{🛑ary❓($PRM_MANY, [[], [1], [[nil]]])}.to_not raise_error
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
          context 'w/ normalization{∉∅}' do
            it 'w/ single param' do
              expect{🛑str❓('0', '', :∉∅)}.to raise_error(ArgumentError)
            end
            it 'w/ many params' do
              expect{🛑str❓($PRM_MANY, ['a', '', 'bb'], :∉∅)}.to raise_error(ArgumentError)
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

  end # end: {functionality}

  context 'audit', :audit do
    context 'feature{f06}:behavior{b00} passes audits' do
      context 'funcs provided are defined in correct location' do
        it 'for m{ObjectF06}' do
          expect_∃⨍(:🛑ary❓, ::Ruuuby::Feature::Includable::ObjectF06)
        end
      end
    end
  end # end: {audit}

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'func{ary?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{['a'].ary?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{0.ary?}.to perform_extremely_quickly
      end
    end

    context 'func{🛑str❓}: performs extremely quickly' do
      it 'cases: positive' do
        expect{🛑ary❓('0', [])}.to perform_extremely_quickly
      end
    end
  end # end: {performance}

end
