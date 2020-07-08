# encoding: UTF-8

RSpec.describe 'f06_b01' do

  context 'functionality' do

    context 'by adding function{str?}' do
      context 'with correct return values of' do
        it 'true' do
          ['', ' ', 'hello world', '2', 'nil', 2.to_s].∀{|s|expect(s.str?).to eq(true)}
        end
        it 'false' do
          [String, nil, 0, 1, {}, [], ['str'], :str].∀{|s|expect(s.str?).to eq(false)}
        end
        it 'a newly created object inheriting String (does not match)' do
          expect(MockString.🆕('my_str').str?).to eq(false)
        end
      end
    end

    context 'by adding function{🛑str❓}' do
      context 'handles needed input scenarios' do
        context 'cases: positive' do
          context 'w/ normalization{∉∅}' do
            it 'w/ single param' do
              expect{🛑str❓('0', '5', :∉∅)}.to_not raise_error
              expect{🛑str❓('0', ' ', :∉∅)}.to_not raise_error
              expect{🛑str❓('0', "\n", :∉∅)}.to_not raise_error
            end
            it 'w/ many params' do
              expect{🛑strs❓(%w(a bb), :∉∅)}.to_not raise_error
            end
          end
          context 'w/o extra normalization' do
            it 'w/ single param' do
              expect{🛑str❓('0', '5')}.to_not raise_error
              expect{🛑str❓('0', ' ')}.to_not raise_error
              expect{🛑str❓('0', "\n")}.to_not raise_error
            end
            it 'w/ many params' do
              expect{🛑strs❓(%w(a bb))}.to_not raise_error
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
              expect{🛑strs❓(['a', '', 'bb'], :∉∅)}.to raise_error(ArgumentError)
            end
          end
          context 'w/o extra normalization' do
            it 'w/ single param' do
              expect{🛑str❓('0', nil)}.to raise_error(ArgumentError)
            end
            it 'w/ many params' do
              expect{🛑strs❓(['5', nil])}.to raise_error(ArgumentError)
              expect{🛑strs❓([5, '5'])}.to raise_error(ArgumentError)
              expect{🛑strs❓([nil, nil])}.to raise_error(ArgumentError)
            end
          end
        end
      end
    end

  end # end: {functionality}

  context 'audit', :audit do
    context 'feature{f06}:behavior{b01} passes audits' do
      context 'funcs provided are defined in correct location' do
        it 'for m{ObjectF06}' do
          expect_∃⨍(:🛑str❓, ::Ruuuby::Feature::Includable::ObjectF06)
        end
      end
    end
  end # end: {audit}

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'func{str?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{''.str?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{5.str?}.to perform_extremely_quickly
      end
    end

    context 'func{🛑str❓}: performs extremely quickly' do
      it 'cases: positive' do
        expect{🛑str❓('0', '5')}.to perform_extremely_quickly
      end
    end
  end # end: {performance}

end
