# coding: utf-8

RSpec.describe 'str' do
  context 'extends class[Object]' do
    context 'by adding function[str?]' do
      it 'as expected' do
        expect(::Object.method_defined?(:str?)).to eq(true)
      end
      it 'a newly created generic object responds to it' do
        expect_response_to(String.new('strstr'), :str?)
      end
      context 'with correct return values of' do
        it 'true' do
          ['', ' ', 'hello world', '2', 'nil', 2.to_s].⨍{|s|expect(s.str?).to eq(true)}
        end
        it 'false' do
          [String, nil, 0, 1, {}, [], ['str'], :str].⨍{|s|expect(s.str?).to eq(false)}
        end
        it 'a newly created object inheriting String (does not match)' do
          class MockString < String; end
          mock_str = MockString.new('my_str')
          expect(mock_str.str?).to eq(false)
        end
      end
    end

    context 'func{ensure_ending!}' do
      it 'was added' do
        expect_response_to('', :ensure_ending!)
        expect_func_in_class(String, :ensure_ending!)
      end
      context 'handles cases' do
        context 'positive' do
          context 'with partial fill in' do
            it 'passes simple scenarios' do
              [
                  ['', '', ''], ['', 'aaa', 'aaa'], ['aaa', '', 'aaa'], %w(hello? ? hello?), %w(hello ?a hello?a), %w(hellb ?? hellb??), %w(hello? ?? hello??)
              ].⨍{|a|expect(a[0].ensure_ending!(a[1], true)).to eq(a[2])}
            end
            it 'passes complex scenarios' do
              [
                  %w(baa aaa baaa), %w(bba aaa bbaaa), %w(baa aaaaaaaaa baaaaaaaaa),
                  %w(baaaaa aaaaaa baaaaaa), %w(ba aaaaaaaa baaaaaaaa), %w(abc bca abca),
                  ['hi ', ' ', 'hi '], [' hi', ' ', ' hi '], %w(abc bcd abcd)
              ].⨍{|a|expect(a[0].ensure_ending!(a[1], true)).to eq(a[2])}
            end
          end # end context 'positive' -> 'with partial fill in'
          context 'without partial fill in' do
            it 'passes simple scenarios' do
              [
                  ['', '', ''], ['', 'aaa', 'aaa'], ['aaa', '', 'aaa'], %w(hello? ? hello?), %w(hello ?a hello?a), %w(hellb ?? hellb??), %w(hello? ?? hello???)
              ].⨍{|a|expect(a[0].ensure_ending!(a[1], false)).to eq(a[2])}
            end
            it 'passes complex scenarios' do
              [
                  %w(baa aaa baaaaa), %w(bba aaa bbaaaa), %w(baa aaaaaaaaa baaaaaaaaaaa),
                  %w(baaaaa aaaaaa baaaaaaaaaaa), %w(ba aaaaaaaa baaaaaaaaa), %w(abc bca abcbca),
                  ['hi ', ' ', 'hi '], [' hi', ' ', ' hi '], %w(abc bcd abcbcd)
              ].⨍{|a|expect(a[0].ensure_ending!(a[1], false)).to eq(a[2])}
            end
          end # end context 'positive' -> 'without partial fill in'
        end # end context 'positive'
        context 'error' do
          it 'catches bad param: start' do
            [nil, 1337, {}].⨍{|a|expect{''.ensure_ending!(a, true)}.to throw_arg_error}
            [nil, 1337, {}].⨍{|a|expect{''.ensure_ending!(a, false)}.to throw_arg_error}
          end
          it 'catches bad param: use_partial_fill_in' do
            expect{''.ensure_ending!('nil', nil)}.to throw_arg_error
            expect{''.ensure_ending!('1337', 1337)}.to throw_arg_error
            expect{''.ensure_ending!('', {})}.to throw_arg_error
          end
        end # end context 'error'
      end
    end

    context 'func{∋?} (include?)' do
      it 'was added' do
        expect_response_to('', :∋?)
        expect_func_in_class(String, :∋?)
      end
      it 'works correctly' do
        expect('abc'.∋? 'b').to eq(true)
        expect('abc'.∋? 'd').to eq(false)
      end
      it 'catches bad arg' do
        expect{'b'.∋? nil}.to throw_arg_error
      end
    end

    context 'func{∌?} (excluded?)' do
      it 'was added' do
        expect_response_to('', :∌?)
        expect_func_in_class(String, :∌?)
      end
      it 'works correctly' do
        expect('abc'.∌? 'd').to eq(true)
        expect('abc'.∌? 'b').to eq(false)
      end
      it 'catches bad arg' do
        expect{'b'.∌? nil}.to throw_arg_error
      end
    end

    context 'func{∈?} (include?)' do
      it 'was added' do
        expect_response_to('', :∈?)
        expect_func_in_class(String, :∈?)
      end
      it 'works correctly' do
        expect('b'.∈? 'abc').to eq(true)
        expect('d'.∈? 'abc').to eq(false)
      end
      it 'catches bad arg' do
        expect{'b'.∈? nil}.to throw_arg_error
      end
    end

    context 'func{∉?} (excluded?)' do
      it 'was added' do
        expect_response_to('', :∉?)
        expect_func_in_class(String, :∉?)
      end
      it 'works correctly' do
        expect('d'.∉? 'abc').to eq(true)
        expect('b'.∉? 'abc').to eq(false)
      end
      it 'catches bad arg' do
        expect{'b'.∉? nil}.to throw_arg_error
      end
    end

    context 'func{>>} (prepend operation)' do
      it 'was added' do
        expect_response_to('', :>>)
        expect_func_in_class(String, :>>)
      end
      context 'handles cases' do
        context 'positive' do
          it 'simple data' do
            [['', ''], %w(a a), %w(ab ab), [" abcde 101 \n", " abcde 101 \n"]].⨍{|a|expect('' >> a[0]).to eq(a[1])}
          end
          it 'complex data' do
            expect('b' >> 'a').to eq('ab')
            expect('baa' >> 'ba').to eq('babaa')
            expect('baaDd' >> 'baaDdd').to eq('baaDddbaaDd')
          end
        end
        context 'error' do
          it 'catches wrong parameter type provided' do
            [nil, 1337, {}].⨍{|a|expect{'' >> a}.to throw_arg_error}
          end
        end
      end
    end

    context 'func{ensure_start!}' do
      it 'was added' do
        expect_response_to('', :ensure_start!)
        expect_func_in_class(String, :ensure_start!)
      end
      context 'handles cases' do
        context 'positive' do
          context 'with partial fill in' do
            it 'simple data' do
              [
                  ['', '', ''], ['', ' ', ' '], [' ', ' ', ' '], ['', 'a', 'a'], %w(b a ab), %w(c aaac aaac)
              ].⨍{|a|expect(a[0].ensure_start!(a[1], true)).to eq(a[2])}
            end
            it 'complex data' do
              [
                  %w(baa b baa), %w(baa ba baa), %w(baa baa baa), %w(baa bb bbaa), %w(baa bba bbaa),
                  %w(baa bbaa bbaa), %w(baa bbaaa bbaaabaa), %w(abc123xyz 123 123abc123xyz)
              ].⨍{|a|expect(a[0].ensure_start!(a[1], true)).to eq(a[2])}
            end
          end
          context 'without partial fill in' do
            it 'simple data' do
              [
                  ['', '', ''], ['', ' ', ' '], [' ', ' ', ' '], ['', 'a', 'a'], %w(b a ab), %w(b aaab aaabb)
              ].⨍{|a|expect(a[0].ensure_start!(a[1], false)).to eq(a[2])}
            end
            it 'complex data' do
              [
                  %w(baa b baa), %w(baa ba baa), %w(baa baa baa), %w(baa bb bbbaa), %w(baa bba bbabaa),
                  %w(baa bbaa bbaabaa), %w(baa bbaaa bbaaabaa), %w(abc123xyz 123 123abc123xyz)
              ].⨍{|a|expect(a[0].ensure_start!(a[1], false)).to eq(a[2])}
            end
          end
        end # end context 'positive'

        context 'error' do
          it 'catches bad param: start' do
            [nil, 1337, {}].⨍{|a|expect{''.ensure_start!(a, true)}.to throw_arg_error}
            [nil, 1337, {}].⨍{|a|expect{''.ensure_start!(a, false)}.to throw_arg_error}
          end
          it 'catches bad param: use_partial_fill_in' do
            expect{''.ensure_start!('nil', nil)}.to throw_arg_error
            expect{''.ensure_start!('1337', 1337)}.to throw_arg_error
            expect{''.ensure_start!('', {})}.to throw_arg_error
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
    it 'func[str?]: runtime <= .00001s' do
      expect{'hi'.str?}.to perform_extremely_quickly
    end
    context 'with partial fill in, performs quickly' do
      it 'func[ensure_ending!]' do
        [%w(hello ?a), ['', big_str], [big_str, '']].⨍{|a|expect{a[0].ensure_ending!(a[1], true)}.to perform_quickly}
      end
      it 'func[ensure_start!]' do
        [%w(hello ?a), ['', big_str], [big_str, '']].⨍{|a|expect{a[0].ensure_start!(a[1], true)}.to perform_quickly}
      end
    end
    context 'without partial fill in, performs quickly' do
      it 'func[ensure_ending!]' do
        [%w(hello ?a), ['', big_str], [big_str, '']].⨍{|a|expect{a[0].ensure_ending!(a[1], false)}.to perform_quickly}
      end
      it 'func[ensure_start!]' do
        [%w(hello ?a), ['', big_str], [big_str, '']].⨍{|a|expect{a[0].ensure_start!(a[1], false)}.to perform_quickly}
      end
    end
  end

end
