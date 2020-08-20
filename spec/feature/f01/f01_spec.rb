# encoding: UTF-8

RSpec.describe 'f01' do

  context 'functionality' do
    context 'ENV' do

      context 'func{validate_feature_behavior_syntax!}' do
        context 'handles needed cases' do
          it 'cases: positive' do
            expect(ENV.validate_feature_behavior_syntax!('b00')).to eq('b00')
            expect(ENV.validate_feature_behavior_syntax!('b01')).to eq('b01')
            expect(ENV.validate_feature_behavior_syntax!('b10')).to eq('b10')
            expect(ENV.validate_feature_behavior_syntax!('b99')).to eq('b99')
          end
          it 'cases: negative' do
            expect{ENV.validate_feature_behavior_syntax!('b0')}.to raise_error(ArgumentError)
            expect{ENV.validate_feature_behavior_syntax!('b001')}.to raise_error(ArgumentError)
            expect{ENV.validate_feature_behavior_syntax!('b_10')}.to raise_error(ArgumentError)
            expect{ENV.validate_feature_behavior_syntax!('b-9')}.to raise_error(ArgumentError)
          end
        end
      end # end: {func{validate_feature_behavior_syntax!}}

      context 'func{parse_feature_behaviors}' do
        context 'handles needed cases' do
          context 'cases: positive' do
            it 'regular data' do
              expect(ENV.parse_feature_behaviors('RUUUBY_F0R_QA_POSITIVE_0', 99)).to eq(%w(b00 b01 b10 b99))
            end
            it 'data w/ args' do
              expect(ENV.parse_feature_behaviors('RUUUBY_F0R_QA_POSITIVE_1', 99)).to eq(%w(b00 b01 b02{1337} b10 b99))
            end
            it 'data w/ args' do
              expect(ENV.parse_feature_behaviors('RUUUBY_F0R_QA_POSITIVE_1', 99, 5, 5)).to eq(%w(b00 b01 b02{1337} b10 b99))
            end
          end
          context 'cases: negative' do
            it 'no content' do
              expect{ENV.parse_feature_behaviors('RUUUBY_F0R_QA_NEGATIVE_0', 99)}.to raise_error(ArgumentError)
            end
            it 'bad values' do
              expect{ENV.parse_feature_behaviors('RUUUBY_F0R_QA_NEGATIVE_1', 99)}.to raise_error(ArgumentError)
            end
            it 'duplicate value' do
              expect{ENV.parse_feature_behaviors('RUUUBY_F0R_QA_NEGATIVE_2', 99)}.to raise_error(ArgumentError)
            end
            it 'out of bounds value' do
              expect{ENV.parse_feature_behaviors('RUUUBY_F0R_QA_NEGATIVE_3', 10)}.to raise_error(ArgumentError)
            end
            it 'too few' do
              expect{ENV.parse_feature_behaviors('RUUUBY_F0R_QA_NEGATIVE_3', 20, 5, 10)}.to raise_error(ArgumentError)
            end
            it 'too many' do
              expect{ENV.parse_feature_behaviors('RUUUBY_F0R_QA_NEGATIVE_3', 20, 0, 3)}.to raise_error(ArgumentError)
              expect{ENV.parse_feature_behaviors('RUUUBY_F0R_QA_NEGATIVE_3', 20, 0, 2)}.to raise_error(ArgumentError)
              expect{ENV.parse_feature_behaviors('RUUUBY_F0R_QA_NEGATIVE_3', 20, 0, 1)}.to raise_error(ArgumentError)
            end
          end
        end
      end # end: {func{parse_feature_behaviors}}

    end # end: {ENV}
  end # end: {functionality}

  #context 'logging audits' do
  #  context 'b00', :logging_mode => 'b00' do
  #    specify { expect { 💎.debug('oof') }.to_not output.to_stdout }
  #  end
  #  context 'b01', :logging_mode => 'b01' do
  #    specify { expect { 💎.debug('oof') }.to output.to_stdout }
  #  end
  #  context 'b02', :logging_mode => 'b02' do
  #    specify { expect { 💎.debug('oof') }.to_not output.to_stdout }
  #  end
  #  context 'b03', :logging_mode => 'b03' do
  #    specify { expect { 💎.debug('oof') }.to_not output.to_stdout }
  #  end
  #end

end
