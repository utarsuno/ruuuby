# encoding: UTF-8

RSpec.describe 'f06_b07' do

  context 'functionality{f06_b07}' do
    context 'adding needed functions' do

      context 'func{hsh?}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/o normalizer' do
              [{}, {'a' => 5}, {a: {}}, {nil: nil}, {[] => nil}].∀{|scenario|expect(scenario.hsh?).to eq(true)}
            end
          end
          context 'cases: negative' do
            it 'non matches' do
              [nil, '', '{}', [], [{}], 1337].∀{|scenario|expect(scenario.hsh?).to eq(false)}
            end
            it 'Class instance does not match either' do
              expect(::Hash.hsh?).to eq(false)
            end
          end
        end
      end # end: {func{hsh?}}

      context 'func{🛑hsh❓}' do
        context 'handles needed input scenarios' do
          context 'cases: positive' do
            it 'w/ single param' do
              expect{🛑hsh❓('0', {})}.to_not raise_error
              expect{🛑hsh❓('0', {a: nil})}.to_not raise_error
              expect{🛑hsh❓('0', {x: 1337, y: {z: nil}})}.to_not raise_error
            end
            it 'w/ many params' do
              expect{🛑hshs❓([{a: 1}, {b: 1337}, {c: nil}])}.to_not raise_error
            end
          end
          context 'cases: negative' do
            it 'w/ single param' do
              expect{🛑hsh❓('0', nil)}.to raise_error(ArgumentError)
            end
            it 'w/ many params' do
              expect{🛑hshs❓([{}, nil])}.to raise_error(ArgumentError)
              expect{🛑hshs❓([5, 1337])}.to raise_error(ArgumentError)
              expect{🛑hshs❓([nil, nil])}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{🛑hsh❓}}

    end # end: {adding needed functions}
  end # end: {functionality}

  context 'audit', :audit do
    context 'feature{f06}:behavior{b07} passes audits' do
      context 'funcs provided are defined in correct location' do
        it 'for c{Object}' do
          expect_∃⨍(:hsh?, ::Object)
        end
        it 'for m{ObjectF06}' do
          expect_∃⨍(:🛑hsh❓, ::Ruuuby::Feature::Includable::ObjectF06)
          expect_∃⨍(:🛑hshs❓, ::Ruuuby::Feature::Includable::ObjectF06)
        end
      end
    end
  end # end: {audit}

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'func{hsh?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{{}.hsh?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{5.hsh?}.to perform_extremely_quickly
      end
    end

    context 'funcs{🛑hsh❓}: performs extremely quickly' do
      context 'cases: positive' do
        it 'w/ single param' do
          expect{🛑hsh❓('0', {})}.to perform_extremely_quickly
          expect{🛑hsh❓('0', {nil: nil})}.to perform_extremely_quickly
        end
        it 'w/ many params' do
          expect{🛑hshs❓([{}, {nil: nil}])}.to perform_extremely_quickly
        end
      end
    end
  end # end: {performance}

end
