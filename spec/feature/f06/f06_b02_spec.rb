# encoding: UTF-8

RSpec.describe 'f06_b02' do

  context 'functionality' do

    context 'type checks for{Integer}' do
      context 'func{int?}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it '𝕌' do
              data_range_ints.∀{|n| expect(n.int?(:∈𝕌)).to eq(true)}
            end # end: {𝕌}
            it 'ℤ' do
              data_range_ints.∀{|n| expect(n.int?(:∈ℤ)).to eq(true)}
            end # end: {ℤ}
            it 'ℕ' do
              data_range_ints_positive.∀{|n| expect(n.int?(:∈ℕ)).to eq(true)}
            end # end: {ℕ}
            it '𝕎' do
              data_range_ints_whole_nums.∀{|n| expect(n.int?(:∈𝕎)).to eq(true)}
            end # end: {𝕎}
            it 'w/o normalizer' do
              data_range_ints.∀{|n| expect(n.int?).to eq(true)}
            end
            it 'exists in scope of new generic object' do
              expect(data_new_obj.respond_to?(:int?)).to eq(true)
            end
          end
          context 'cases: negative' do
            it 'ℕ' do
              expect(-1337.int?(:∈ℕ)).to eq(false)
              expect(-1.int?(:∈ℕ)).to eq(false)
              expect(-0.int?(:∈ℕ)).to eq(false)
              expect(0.int?(:∈ℕ)).to eq(false)
            end # end: {ℕ}
            it '𝕎' do
              expect(-1337.int?(:∈ℕ)).to eq(false)
              expect(-1.int?(:∈ℕ)).to eq(false)
            end # end: {𝕎}
            it 'w/o normalizer' do
              [Integer, nil, '', '1337', {}, [], 0.0].∀{|n| expect(n.int?).to eq(false)}
            end
          end
        end
      end # end: {func{int?}}

      context 'func{🛑int❓}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            context 'w/ normalization{∈ℕ}' do
              it 'w/ single param' do
                expect{🛑int❓('0', 5, :∈ℕ)}.to_not raise_error
              end
              it 'w/ many params' do
                expect{🛑int❓($PRM_MANY, [1, 3, 1337], :∈ℕ)}.to_not raise_error
              end
            end
            context 'w/o extra normalization' do
              it 'w/ single param' do
                expect{🛑int❓('0', 5)}.to_not raise_error
              end
              it 'w/ many params' do
                expect{🛑int❓($PRM_MANY, [-1, 0, 1])}.to_not raise_error
              end
            end
          end
          context 'cases: negative' do
            context 'w/ bad normalizer' do
              it 'w/ single param' do
                expect{🛑int❓('0', 1337, nil)}.to raise_error(ArgumentError)
              end
              it 'w/ many params' do
                expect{🛑int❓('0', [-1, 0, 1], nil)}.to raise_error(ArgumentError)
              end
            end
            context 'w/ normalization{∈ℕ}' do
              it 'w/ single param' do
                expect{🛑int❓('0', -1337, :∈ℕ)}.to raise_error(ArgumentError)
              end
              it 'w/ many params' do
                expect{🛑int❓($PRM_MANY, [-1, 0, 1], :∈ℕ)}.to raise_error(ArgumentError)
              end
            end
            context 'w/o extra normalization' do
              it 'w/ single param' do
                expect{🛑int❓('0', '5')}.to raise_error(ArgumentError)
              end
              it 'w/ many params' do
                expect{🛑int❓($PRM_MANY, [-1, 0, nil])}.to raise_error(ArgumentError)
                expect{🛑int❓($PRM_MANY, [-1, '1', 1])}.to raise_error(ArgumentError)
                expect{🛑int❓($PRM_MANY, [[], 0, 1])}.to raise_error(ArgumentError)
                expect{🛑int❓($PRM_MANY, [nil, nil, nil])}.to raise_error(ArgumentError)
              end
            end
          end
        end
      end # end: {func{🛑int❓}}
    end # end: {type checks for{Integer}}

  end # end: {functionality}

  context 'audit', :audit do
    context 'feature{f06}:behavior{b00} passes audits' do
      context 'funcs provided are defined in correct location' do
        it 'for m{ObjectF06}' do
          expect_∃⨍(:🛑int❓, ::Ruuuby::Feature::Includable::ObjectF06)
        end
      end
    end
  end # end: {audit}

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do
    context 'func{🛑int❓}: performs extremely quickly' do
      it 'cases: positive' do
        expect{🛑int❓('0', 5)}.to perform_extremely_quickly
      end
    end
  end # end: {performance}

end
