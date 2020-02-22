# coding: utf-8

RSpec.describe 'str' do
  let(:data_empty){''}

  context 'extends class[String]' do

    it 'by creating needed functions' do
      expect_response_to(data_empty, :ensure_ending!)
      expect_response_to(data_empty, :∋?)
      expect_response_to(data_empty, :∌?)
      expect_response_to(data_empty, :∈?)
      expect_response_to(data_empty, :∉?)
      expect_response_to(data_empty, :>>)
      expect_response_to(data_empty, :ensure_start!)
    end


    context 'func{ensure_ending!}' do
      context 'handles cases' do
        context 'positive' do
          context 'with partial fill in' do
            it 'passes simple scenarios' do
              [
                  ['', '', ''], ['', 'aaa', 'aaa'], ['aaa', '', 'aaa'], %w(hello? ? hello?), %w(hello ?a hello?a), %w(hellb ?? hellb??), %w(hello? ?? hello??)
              ].∀{|a|expect(a[0].ensure_ending!(a[1], true)).to eq(a[2])}
            end
            it 'passes complex scenarios' do
              [
                  %w(baa aaa baaa), %w(bba aaa bbaaa), %w(baa aaaaaaaaa baaaaaaaaa),
                  %w(baaaaa aaaaaa baaaaaa), %w(ba aaaaaaaa baaaaaaaa), %w(abc bca abca),
                  ['hi ', ' ', 'hi '], [' hi', ' ', ' hi '], %w(abc bcd abcd)
              ].∀{|a|expect(a[0].ensure_ending!(a[1], true)).to eq(a[2])}
            end
          end # end context 'positive' -> 'with partial fill in'
          context 'without partial fill in' do
            it 'passes simple scenarios' do
              [
                  ['', '', ''], ['', 'aaa', 'aaa'], ['aaa', '', 'aaa'], %w(hello? ? hello?), %w(hello ?a hello?a), %w(hellb ?? hellb??), %w(hello? ?? hello???)
              ].∀{|a|expect(a[0].ensure_ending!(a[1], false)).to eq(a[2])}
            end
            it 'passes complex scenarios' do
              [
                  %w(baa aaa baaaaa), %w(bba aaa bbaaaa), %w(baa aaaaaaaaa baaaaaaaaaaa),
                  %w(baaaaa aaaaaa baaaaaaaaaaa), %w(ba aaaaaaaa baaaaaaaaa), %w(abc bca abcbca),
                  ['hi ', ' ', 'hi '], [' hi', ' ', ' hi '], %w(abc bcd abcbcd)
              ].∀{|a|expect(a[0].ensure_ending!(a[1], false)).to eq(a[2])}
            end
          end # end context 'positive' -> 'without partial fill in'
        end # end context 'positive'
        context 'error' do
          it 'catches bad param: start' do
            [nil, 1337, {}].∀{|a|expect{''.ensure_ending!(a, true)}.to throw_arg_error}
            [nil, 1337, {}].∀{|a|expect{''.ensure_ending!(a, false)}.to throw_arg_error}
          end
          it 'catches bad param: use_partial_fill_in' do
            expect{''.ensure_ending!('nil', nil)}.to throw_arg_error
            expect{''.ensure_ending!('1337', 1337)}.to throw_arg_error
            expect{''.ensure_ending!('', {})}.to throw_arg_error
          end
          it 'catches frozen string' do
            a = 'my_frozen_string'.❄️
            a.❄️
            expect{a.ensure_ending!('bbb', true)}.to be_frozen
            expect{a.ensure_ending!('bbb', false)}.to be_frozen
          end
        end # end context 'error'
      end
    end

    context 'func{∋?} (include?)' do
      it 'works correctly' do
        expect('abc'.∋? 'b').to eq(true)
        expect('abc'.∋? 'd').to eq(false)
      end
      it 'catches bad arg' do
        expect{'b'.∋? nil}.to throw_arg_error
      end
    end

    context 'func{∌?} (excluded?)' do
      it 'works correctly' do
        expect('abc'.∌? 'd').to eq(true)
        expect('abc'.∌? 'b').to eq(false)
      end
      it 'catches bad arg' do
        expect{'b'.∌? nil}.to throw_arg_error
      end
    end

    context 'func{∈?} (include?)' do
      it 'works correctly' do
        expect('b'.∈? 'abc').to eq(true)
        expect('d'.∈? 'abc').to eq(false)
      end
      it 'catches bad arg' do
        expect{'b'.∈? nil}.to throw_arg_error
      end
    end

    context 'func{∉?} (excluded?)' do
      it 'works correctly' do
        expect('d'.∉? 'abc').to eq(true)
        expect('b'.∉? 'abc').to eq(false)
      end
      it 'catches bad arg' do
        expect{'b'.∉? nil}.to throw_arg_error
      end
    end

    context 'func{>>} (prepend operation)' do
      context 'handles cases' do
        context 'positive' do
          it 'simple data' do
            [['', ''], %w(a a), %w(ab ab), [" abcde 101 \n", " abcde 101 \n"]].∀{|a|expect('' >> a[0]).to eq(a[1])}
          end
          it 'complex data' do
            expect('b' >> 'a').to eq('ab')
            expect('baa' >> 'ba').to eq('babaa')
            expect('baaDd' >> 'baaDdd').to eq('baaDddbaaDd')
          end
          it 'preserves object_id' do
            a = 'apple'
            b = a.🆔
            a >> 'c'
            expect(a).to eq('capple')
            expect(a.🆔).to eq(b)
          end
        end
        context 'error' do
          it 'catches wrong parameter type provided' do
            [nil, 1337, {}].∀{|a|expect{'' >> a}.to throw_arg_error}
          end
          it 'catches frozen strings' do
            a = 'my_frozen_string'.❄️
            a.❄️
            expect{a.>>('bbb')}.to be_frozen
          end
        end
      end
    end

    context 'func{ensure_start!}' do
      context 'handles cases' do
        context 'positive' do
          context 'with partial fill in' do
            it 'simple data' do
              [
                  ['', '', ''], ['', ' ', ' '], [' ', ' ', ' '], ['', 'a', 'a'], %w(b a ab), %w(c aaac aaac)
              ].∀{|a|expect(a[0].ensure_start!(a[1], true)).to eq(a[2])}
            end
            it 'complex data' do
              [
                  %w(baa b baa), %w(baa ba baa), %w(baa baa baa), %w(baa bb bbaa), %w(baa bba bbaa),
                  %w(baa bbaa bbaa), %w(baa bbaaa bbaaabaa), %w(abc123xyz 123 123abc123xyz)
              ].∀{|a|expect(a[0].ensure_start!(a[1], true)).to eq(a[2])}
            end
          end
          context 'without partial fill in' do
            it 'simple data' do
              [
                  ['', '', ''], ['', ' ', ' '], [' ', ' ', ' '], ['', 'a', 'a'], %w(b a ab), %w(b aaab aaabb)
              ].∀{|a|expect(a[0].ensure_start!(a[1], false)).to eq(a[2])}
            end
            it 'complex data' do
              [
                  %w(baa b baa), %w(baa ba baa), %w(baa baa baa), %w(baa bb bbbaa), %w(baa bba bbabaa),
                  %w(baa bbaa bbaabaa), %w(baa bbaaa bbaaabaa), %w(abc123xyz 123 123abc123xyz)
              ].∀{|a|expect(a[0].ensure_start!(a[1], false)).to eq(a[2])}
            end
          end
        end # end context 'positive'

        context 'error' do
          it 'catches bad param: start' do
            [nil, 1337, {}].∀{|a|expect{''.ensure_start!(a, true)}.to throw_arg_error}
            [nil, 1337, {}].∀{|a|expect{''.ensure_start!(a, false)}.to throw_arg_error}
          end
          it 'catches bad param: use_partial_fill_in' do
            expect{''.ensure_start!('nil', nil)}.to throw_arg_error
            expect{''.ensure_start!('1337', 1337)}.to throw_arg_error
            expect{''.ensure_start!('', {})}.to throw_arg_error
          end
          it 'catches frozen string' do
            a = 'my_frozen_string'.❄️
            a.❄️
            expect{a.ensure_start!('bbb', true)}.to be_frozen
            expect{a.ensure_start!('bbb', false)}.to be_frozen
          end
        end
      end
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    let(:big_str){'ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^'}

    it 'func[∋?] runs fast enough' do
      expect{'any54wyv45hv'.∋? 'c'}.to perform_very_quickly
    end

    it 'func[∌?] runs fast enough' do
      expect{'any54wyv45hv'.∌? 'c'}.to perform_very_quickly
    end

    it 'func[∈?] runs fast enough' do
      expect{'any54wyv45hv'.∈? 'c'}.to perform_very_quickly
    end

    it 'func[∉?] runs fast enough' do
      expect{'any54wyv45hv'.∉? 'c'}.to perform_very_quickly
    end

    it 'func[>>] runs fast enough' do
      expect{'any54wyv45hv'.>> 'bASDVASb5t4t'}.to perform_very_quickly
    end

    context 'with partial fill in, performs quickly' do
      it 'func[ensure_ending!]' do
        [%w(hello ?a), ['', big_str], [big_str, '']].∀{|a|expect{a[0].ensure_ending!(a[1], true)}.to perform_quickly}
      end
      it 'func[ensure_start!]' do
        [%w(hello ?a), ['', big_str], [big_str, '']].∀{|a|expect{a[0].ensure_start!(a[1], true)}.to perform_quickly}
      end
    end
    context 'without partial fill in, performs quickly' do
      it 'func[ensure_ending!]' do
        [%w(hello ?a), ['', big_str], [big_str, '']].∀{|a|expect{a[0].ensure_ending!(a[1], false)}.to perform_quickly}
      end
      it 'func[ensure_start!]' do
        [%w(hello ?a), ['', big_str], [big_str, '']].∀{|a|expect{a[0].ensure_start!(a[1], false)}.to perform_quickly}
      end
    end
  end

end
