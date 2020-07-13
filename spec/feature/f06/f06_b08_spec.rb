# encoding: UTF-8

RSpec.describe 'f06_b08' do
  let(:data_matrix){::Matrix[[0,0],[0,0]]}

  context 'functionality{f06_b08}' do
    context 'adding needed functions' do

      context 'func{matrix?}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'w/o normalizer' do
              expect(data_matrix.matrix?).to eq(true)
            end
          end
          context 'cases: negative' do
            it 'non matches' do
              [nil, '', '{}', [], [{}], 1337].∀{|scenario|expect(scenario.matrix?).to eq(false)}
            end
            it 'Class instance does not match either' do
              expect(::Matrix.matrix?).to eq(false)
            end
          end
        end
      end # end: {func{matrix?}}

      context 'func{🛑matrix❓}' do
        context 'handles needed input scenarios' do
          context 'cases: positive' do
            it 'w/ single param' do
              expect{🛑matrix❓('arg', data_matrix)}.to_not raise_error
            end
          end
          context 'cases: negative' do
            it 'w/ single param' do
              expect{🛑matrix❓('0', nil)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{🛑matrix❓}}

    end # end: {adding needed functions}
  end # end: {functionality}

  context 'audit', :audit do
    context 'feature{f06}:behavior{b07} passes audits' do
      context 'funcs provided are defined in correct location' do
        it 'for c{Object}' do
          expect_∃⨍(:matrix?, ::Object)
        end
        it 'for m{ObjectF06}' do
          expect_∃⨍(:🛑matrix❓, ::Ruuuby::Feature::Includable::ObjectF06)
        end
      end
    end
  end # end: {audit}

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'func{matrix?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{data_matrix.matrix?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{1337.matrix?}.to perform_extremely_quickly
      end
    end

    context 'funcs{🛑matrix❓}: performs extremely quickly' do
      context 'cases: positive' do
        it 'w/ single param' do
          expect{🛑matrix❓('arg', data_matrix)}.to perform_extremely_quickly
        end
      end
    end
  end # end: {performance}

end
