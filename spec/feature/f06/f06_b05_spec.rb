# encoding: UTF-8

RSpec.describe 'f06_b05' do

  context 'functionality{f06_b05}' do
    context 'adding needed functions' do

      context 'func{bool?}' do
        context 'handling needed scenarios' do
          it 'cases: positive' do
            [true, false, 1 == 1, 1 != 2].∀{|n|expect(n.bool?).to eq(true)}
          end
          context 'cases: negative' do
            it 'w/o effecting TrueClass instance or FalseClass instance' do
              [::TrueClass, ::FalseClass, MockTrue, MockFalse].∀{|scenario| expect(scenario.bool?).to eq(false)}
            end
            it 'normal data types checks' do
              [::Class, ::Object, ::NilClass, '', 'true', 'False', -1, 1, 0, [], {}, [false], [true]].∀{|n|expect(n.bool?).to eq(false)}
            end
          end
        end
      end # end: {func{bool?}}

      context 'func{🛑bool❓}' do
        context 'handles needed input scenarios' do
          context 'cases: positive' do
            it 'w/ single param' do
              expect{🛑bool❓(:arg, true)}.to_not raise_error
              expect{🛑bool❓(:arg, false)}.to_not raise_error
            end
            it 'w/ many params' do
              expect{🛑bools❓([true, false])}.to_not raise_error
              expect{🛑bools❓([true, true])}.to_not raise_error
              expect{🛑bools❓([false, false])}.to_not raise_error
              expect{🛑bools❓([true, true, true, true, true])}.to_not raise_error
              expect{🛑bools❓([false])}.to_not raise_error
            end
          end
          context 'cases: negative' do
            it 'w/ single param' do
              expect{🛑bool❓(:arg, nil)}.to raise_error(::ArgumentError)
            end
            it 'w/ many params' do
              expect{🛑bools❓([true, nil])}.to raise_error(::ArgumentError)
              expect{🛑bools❓([nil, false])}.to raise_error(::ArgumentError)
              expect{🛑bools❓([nil, nil])}.to raise_error(::ArgumentError)
              expect{🛑bools❓([true, true, 1337, true, true])}.to raise_error(::ArgumentError)
            end
          end
        end
      end # end: {func{🛑bool❓}}

    end # end: {adding needed functions}
  end # end: {functionality}

  context 'audit', :audit do
    context 'feature{f06}:behavior{b05} passes audits' do
      context 'funcs provided are defined in correct location' do
        it 'for c{Object}' do
          expect_∃⨍(:bool?, ::Object)
        end
        it 'for m{ObjectF06}' do
          expect_∃⨍(:🛑bool❓, ::Ruuuby::Feature::Includable::ObjectF06)
          expect_∃⨍(:🛑bools❓, ::Ruuuby::Feature::Includable::ObjectF06)
        end
      end
    end
  end # end: {audit}

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'func{bool?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{true.bool?}.to perform_extremely_quickly
        expect{false.bool?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{0.bool?}.to perform_extremely_quickly
        expect{nil.bool?}.to perform_extremely_quickly
      end
    end

    context 'func{🛑bool❓}: performs extremely quickly' do
      it 'for cases: positive' do
        expect{🛑bool❓(:arg, true)}.to perform_extremely_quickly
        expect{🛑bool❓(:arg, false)}.to perform_extremely_quickly
      end
    end
  end # end: {performance}

end
