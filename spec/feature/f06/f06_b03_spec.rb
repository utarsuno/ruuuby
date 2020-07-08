# encoding: UTF-8

RSpec.describe 'f06_b03' do

  context 'functionality' do

    context 'by adding function{ary?}' do
      context 'handling needed scenarios' do
        context 'cases: positive' do
          it 'w/ normalization{∉∅}' do
            [[[]], [nil], [true], [false], ['a'], [1337]].∀{|n|expect(n.ary?(:∉∅)).to eq(true)}
          end
          it 'w/o normalization' do
            [[], [] + [], [[]], [nil], [true], [false], ['a'], [1337]].∀{|n|expect(n.ary?).to eq(true)}
          end
        end
        context 'cases: negative' do
          it 'w/o effecting Class-instance{Array}' do
            expect(::Array.ary?).to eq(false)
            expect(::Array.ary?(:∉∅)).to eq(false)
          end
          context 'data-based' do
            it 'w/ normalization{∉∅}' do
              [TrueClass, FalseClass, Class, Object, NilClass, '', 'true', 'false', -1, 1, 0, {}].∀{|n|expect(n.ary?(:∉∅)).to eq(false)}
              expect([].ary?(:∉∅)).to eq(false)
              expect(([] + []).ary?(:∉∅)).to eq(false)
            end
            it 'w/o normalization' do
              [TrueClass, FalseClass, Class, Object, NilClass, '', 'true', 'false', -1, 1, 0, {}].∀{|n|expect(n.ary?).to eq(false)}
            end
          end
        end
      end
    end

    context 'by adding function{🛑ary❓}' do
      context 'handles needed input scenarios' do
        context 'cases: positive' do
          context 'w/ normalization{∉∅}' do
            it 'w/ single param' do
              expect{🛑ary❓(:arg, [nil], :∉∅)}.to_not raise_error
              expect{🛑ary❓(:arg, [1337, '1337'], :∉∅)}.to_not raise_error
            end
            it 'w/ many params' do
              expect{🛑arys❓([[nil], [1], [[nil]]], :∉∅)}.to_not raise_error
            end
          end
          context 'w/o extra normalization' do
            it 'w/ single param' do
              expect{🛑ary❓(:arg, [])}.to_not raise_error
            end
            it 'w/ many params' do
              expect{🛑arys❓([[], [1], [[nil]]])}.to_not raise_error
            end
          end
        end
        context 'cases: negative' do
          context 'w/ bad normalizer' do
            it 'w/ single param' do
              expect{🛑ary❓(:arg, '', nil)}.to raise_error(ArgumentError)
            end
            it 'w/ many params' do
              expect{🛑ary❓(:arg, ['a', '', 'bb'], nil)}.to raise_error(ArgumentError)
            end
          end
          context 'w/ normalization{∉∅}' do
            it 'w/ single param' do
              expect{🛑ary❓(:arg, [], :∉∅)}.to raise_error(ArgumentError)
            end
          end
          context 'w/o extra normalization' do
            it 'w/ single param' do
              expect{🛑ary❓(:arg, nil)}.to raise_error(ArgumentError)
            end
          end
        end
      end
    end

  end # end: {functionality}

  context 'audit', :audit do
    context 'feature{f06}:behavior{b03} passes audits' do
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
      context 'for needed scenarios' do
        context 'cases: positive' do
          it 'w/o normalizer' do
            expect{[].ary?}.to perform_extremely_quickly
            expect{['a'].ary?}.to perform_extremely_quickly
          end
          it 'w/ normalizer{∉∅}' do
            expect{['a'].ary?(:∉∅)}.to perform_extremely_quickly
          end
        end
        context 'cases: negative' do
          it 'w/o normalizer' do
            expect{0.ary?}.to perform_extremely_quickly
          end
          it 'w/ normalizer{∉∅}' do
            expect{[].ary?(:∉∅)}.to perform_extremely_quickly
          end
        end
      end
    end

    context 'func{🛑ary❓}: performs extremely quickly' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'w/o normalizer' do
            expect{🛑ary❓(:arg, [])}.to perform_extremely_quickly
            expect{🛑ary❓(:arg, [nil])}.to perform_extremely_quickly
          end
          it 'w/ normalizer{∉∅}' do
            expect{🛑ary❓(:arg, [nil], :∉∅)}.to perform_extremely_quickly
          end
        end
      end
    end

  end # end: {performance}

end
