# encoding: UTF-8

RSpec.describe 'f08' do
  let(:data_ary){['a', 1337, [[1337]]]}
  let(:data_ary_alt){['a', 1337, nil]}
  let(:data_set){Set['a', 1337, [[1337]]]}
  let(:data_set_alt){Set['a', 1337, nil]}
  let(:data_empty_ary){[]}
  let(:data_empty_hsh){{}}
  let(:data_empty_set){Set[]}

  context 'extends module[Enumerable]' do

    context 'by adding needed functions & aliases' do

      context 'function{∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎}' do
        context 'handles needed scenarios' do
          context 'for type: array' do
            context 'cases: positive' do
              it 'default format' do
                count = 0
                data  = [1, 10, 2, 100, -1, 5, 1337, 1337, 1337]
                data.∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎{|prev, curr| count += 1 if curr > prev}
                expect(count).to eq(4)

                count = 0
                [1, 10, 2].∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎{|prev, curr| count += 1 if curr > prev}
                expect(count).to eq(1)

                count = 0
                [1, 10, 2].∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎{|prev, curr|}
                expect(count).to eq(0)

                count = 0
                [1337, 1337, 1337, 1337, 1337, 1337].∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎{|prev, curr| count += 1}
                expect(count).to eq(5)
              end
              it 'alternative format' do
                count = 0
                data  = [1, 10, 2, 100, -1, 5, 1337, 1337, 1337]
                data.∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎ do |prev, curr|
                  count += 1 if curr > prev
                end
                expect(count).to eq(4)
              end
            end
            context 'cases: negative' do
              it 'wrong number of args' do
                count = 0
                expect{([1, 2, 3].∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎{|prev| count += 1 if prev > 1})}.to raise_error(ArgumentError)
                expect{([1, 2, 3].∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎{|prev, curr, future| count += 1 if prev > 1})}.to raise_error(ArgumentError)
              end
              it 'array length is too small' do
                count = 0
                expect{([].∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎{|prev, curr| count += 1 if prev > 1})}.to raise_error(RuntimeError)
                expect{([1].∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎{|prev, curr| count += 1 if prev > 1})}.to raise_error(RuntimeError)
              end
            end
          end
        end
      end # end: {function{∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎}}

      context 'has function{∌?}' do
        context 'handling needed scenarios' do
          context 'for type: array' do
            it 'true-positive' do
              expect(data_ary.∌? 'b').to eq(true)
              expect(data_ary.∌? [1337]).to eq(true)
            end
            it 'false-positive' do
              expect(data_ary.∌? [[1337]]).to eq(false)
              expect(data_ary_alt.∌?(nil)).to eq(false)
            end
          end
          context 'for type: set' do
            it 'true-positive' do
              expect(data_set.∌? 'b').to eq(true)
              expect(data_set.∌? [1337]).to eq(true)
            end
            it 'false-positive' do
              expect(data_set.∌? [[1337]]).to eq(false)
              expect(data_set_alt.∌?(nil)).to eq(false)
            end
          end
          context 'for type: hash' do
            it 'true-positive' do
              data = {}
              data['a'] = 'b'
              data[nil] = [1337, 2]
              data[[]]  = nil
              expect(data.∌? 'b').to eq(true)
              expect(data.∌? [1337]).to eq(true)
            end
            it 'false-positive' do
              data = {}
              data['a'] = 'b'
              data[nil] = [1337, 2]
              data[[]]  = nil
              expect(data.∌? 'a').to eq(false)
              expect(data.∌?(nil)).to eq(false)
              expect(data.∌? []).to eq(false)
            end
          end
        end
      end

      context 'has function{∋?}' do
        context 'handling needed scenarios' do
          context 'for type: hash' do
            it 'true-positive' do
              data = {}
              data['a'] = 'b'
              data[nil] = [1337, 2]
              data[[]]  = nil
              expect(data.∋? 'a').to eq(true)
              expect(data.∋?(nil)).to eq(true)
              expect(data.∋? []).to eq(true)
            end
            it 'false-positive' do
              data = {}
              data['a'] = 'ccc'
              data[nil] = [1337, 2]
              data[[]]  = nil
              expect(data.∋? 'b').to eq(false)
              expect(data.∋? [1337]).to eq(false)
            end
          end
          context 'for type: array' do
            it 'true-positive' do
              expect(data_ary.∋? [[1337]]).to eq(true)
              expect(data_ary_alt.∋?(nil)).to eq(true)
            end
            it 'false-positive' do
              expect(data_ary.∋? 'b').to eq(false)
              expect(data_ary.∋? [1337]).to eq(false)
            end
          end
          context 'for type: set' do
            it 'true-positive' do
              expect(data_set.∋? [[1337]]).to eq(true)
              expect(data_set_alt.∋?(nil)).to eq(true)
            end
            it 'false-positive' do
              expect(data_set.∋? 'b').to eq(false)
              expect(data_set.∋? [1337]).to eq(false)
            end
          end
        end
      end

      context 'has function{∅?}' do
        context 'handling needed scenarios' do
          it 'true-positive{∅?}' do
            expect([].∅?).to eq(true)
            expect((Set[]).∅?).to eq(true)
          end
          it 'true-positive{empty?}' do
            expect([].empty?).to eq(true)
            expect((Set[]).empty?).to eq(true)
          end
          it 'false-positive{∅?}' do
            expect([nil].∅?).to eq(false)
            expect((Set[nil]).∅?).to eq(false)
          end
          it 'false-positive{empty?}' do
            expect([nil].empty?).to eq(false)
            expect((Set[nil]).empty?).to eq(false)
          end
        end
      end

    end
  end

  context 'audit', :audit do
    context 'feature(f08) passes audits' do
      context 'extra sanity checks: all Classes w/ Enumerable have needed funcs' do
        context 'func{∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎}' do
          it 'exists in needed Classes' do
            expect_∃⨍(:∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎, ::Array)
            expect_∃⨍(:∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎, ::Set)
            expect_∃⨍(:∀τ²∈λ𝑓₍ᵢ،ᵢ₊₁₎, ::Range)
          end
        end
      end # end: {extra sanity checks: all Classes w/ Enumerable have needed funcs}
    end # end: {feature(f08) passes audits}
  end # end: {audit}

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'func{∋?} runs fast enough' do
      it 'for cases: positive' do
        data = {}
        data['a'] = 'b'
        data[nil] = [1337, 2]
        data[[]]  = nil
        expect{data_ary.∋? 'a'}.to perform_very_quickly
        expect{data.∋? 'a'}.to perform_very_quickly
        expect{data_set.∋? 'a'}.to perform_very_quickly
      end
      it 'for cases: negative' do
        expect{data_ary.∋? 'abc'}.to perform_very_quickly
        expect{data_empty_hsh.∋? 'abc'}.to perform_very_quickly
        expect{data_set.∋? 'abc'}.to perform_very_quickly
      end
    end

    context 'func{∌?} runs fast enough' do
      it 'for cases: positive' do
        expect{data_ary.∌? 'abc'}.to perform_very_quickly
        expect{data_empty_hsh.∌? 'abc'}.to perform_very_quickly
        expect{data_set.∌? 'abc'}.to perform_very_quickly
      end
      it 'for cases: negative' do
        data = {}
        data['a'] = 'b'
        data[nil] = [1337, 2]
        data[[]]  = nil
        expect{data_ary.∌? 'a'}.to perform_very_quickly
        expect{data.∌? 'a'}.to perform_very_quickly
        expect{data_set.∌? 'a'}.to perform_very_quickly
      end
    end

    context 'func{∅?} runs fast enough' do
      it 'for cases: positive' do
        expect{data_empty_ary.∅?}.to perform_very_quickly
        expect{data_empty_hsh.∅?}.to perform_very_quickly
        expect{data_empty_set.∅?}.to perform_very_quickly
      end
      it 'for cases: negative' do
        data = {}
        data['a'] = 'b'
        data[nil] = [1337, 2]
        data[[]]  = nil
        expect{data_ary.∅?}.to perform_very_quickly
        expect{data.∅?}.to perform_very_quickly
        expect{data_set.∅?}.to perform_very_quickly
      end
    end

  end

end # end: {f08}
