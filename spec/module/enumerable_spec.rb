# coding: utf-8

RSpec.describe ::Enumerable do
  let(:data_ary){['a', 1337, [[1337]]]}
  let(:data_ary_alt){['a', 1337, nil]}
  let(:data_set){Set['a', 1337, [[1337]]]}
  let(:data_set_alt){Set['a', 1337, nil]}
  let(:data_empty_ary){[]}
  let(:data_empty_hsh){{}}
  let(:data_empty_set){Set[]}

  context 'extends module[Enumerable]' do

    it 'by creating needed aliases' do
      expect_added_ruby_methods(::Enumerable, cΔ_Enumerable)
      RuuubyTestHelper::CONFIG_ENUMERABLE[:aliases].∀ do |base_func, aliases|
        expect(::Enumerable.∃⨍?(aliases)).to eq(true)
      end
    end

    context 'by adding needed functions & aliases' do

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

end
