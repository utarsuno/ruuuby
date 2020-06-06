# encoding: UTF-8

RSpec.describe 'f06' do

  context 'functionality' do

    context 'type checks for{Integer}' do

      context 'func{int?}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'for needed matches' do
              data_range_ints_boolean.∀{|n| expect(n.int?).to eq(true)}
            end
            it 'exists in scope of new generic object' do
              expect(Object.new.respond_to?(:int?)).to eq(true)
            end
          end
          it 'cases: negative' do
            [Integer, nil, '', '1337', {}, [], 0.0].∀{|n| expect(n.int?).to eq(false)}
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

  end

  context 'audit', :audit do
    context 'feature(f06) passes audits (tests not relating to observed functionality)' do
      it 'module is defined in correct location' do
        expect(🧬.∃ᵐ?(:ObjectF06, ::Ruuuby::Feature::Includable)).to eq(true)
      end
      context 'funcs provided are defined in correct location' do
        context 'for' do
          it 'm{ObjectF06}' do
            expect_∃⨍(:θ?, ::Ruuuby::Feature::Includable::ObjectF06)

            expect_∃⨍(:🛑θ❓, ::Ruuuby::Feature::Includable::ObjectF06)
            expect_∃⨍(:🛑bool❓, ::Ruuuby::Feature::Includable::ObjectF06)
            expect_∃⨍(:🛑int❓, ::Ruuuby::Feature::Includable::ObjectF06)
            expect_∃⨍(:🛑flt❓, ::Ruuuby::Feature::Includable::ObjectF06)
            expect_∃⨍(:🛑ary❓, ::Ruuuby::Feature::Includable::ObjectF06)
            expect_∃⨍(:🛑str❓, ::Ruuuby::Feature::Includable::ObjectF06)
            expect_∃⨍(:🛑sym❓, ::Ruuuby::Feature::Includable::ObjectF06)
          end
          it 'f06-b00' do
            expect_∃⨍(:🛑num❓, ::Ruuuby::Feature::Includable::ObjectF06)
          end
        end
      end
    end
  end

end
