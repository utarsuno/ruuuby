
RSpec.describe 'str' do
  context 'extends class[Object]' do
    context 'by adding function[str?]' do
      it 'as expected' do
        expect(::Object.method_defined?(:str?)).to eq(true)
      end
      it 'a newly created generic object has it as well' do
        expect(String.new('strstr').respond_to?(:str?)).to eq(true)
      end
      context 'with correct return values of' do
        it 'true' do
          expect(''.str?).to eq(true)
          expect(' '.str?).to eq(true)
          expect('hello world'.str?).to eq(true)
          expect('2'.str?).to eq(true)
          expect('nil'.str?).to eq(true)
          expect(2.to_s.str?).to eq(true)
        end
        it 'false' do
          expect(String.str?).to eq(false)
          expect(nil.str?).to eq(false)
          expect(0.str?).to eq(false)
          expect(1.str?).to eq(false)
          expect({}.str?).to eq(false)
          expect(['str'].str?).to eq(false)
          expect(:str.str?).to eq(false)
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
        expect(''.respond_to?(:ensure_ending!)).to eq(true)
        expect_func_in_class(String, :ensure_ending!)
      end
      context 'handles cases' do
        context 'positive' do
          context 'with partial fill in' do
            it 'passes simple scenarios' do
              expect(''.ensure_ending!('', true)).to eq('')
              expect(''.ensure_ending!('aaa', true)).to eq('aaa')
              expect('aaa'.ensure_ending!('', true)).to eq('aaa')
              expect('hello?'.ensure_ending!('?', true)).to eq('hello?')
              expect('hello'.ensure_ending!('?a', true)).to eq('hello?a')
              expect('hellb'.ensure_ending!('??', true)).to eq('hellb??')
            end
            it 'passes complex scenarios' do
              expect('baa'.ensure_ending!('aaa', true)).to eq('baaa')
              expect('bba'.ensure_ending!('aaa', true)).to eq('bbaaa')
              expect('baa'.ensure_ending!('aaaaaaaaa', true)).to eq('baaaaaaaaa')
              expect('baaaaa'.ensure_ending!('aaaaaa', true)).to eq('baaaaaa')
              expect('ba'.ensure_ending!('aaaaaaaa', true)).to eq('baaaaaaaa')
              expect('abc'.ensure_ending!('bca', true)).to eq('abca')
              expect('hi '.ensure_ending!(' ', true)).to eq('hi ')
              expect(' hi'.ensure_ending!(' ', true)).to eq(' hi ')
              expect('abc'.ensure_ending!('bcd', true)).to eq('abcd')
            end
          end # end context 'positive' -> 'with partial fill in'
          context 'without partial fill in' do
            it 'passes simple scenarios' do
              expect(''.ensure_ending!('', false)).to eq('')
              expect(''.ensure_ending!('aaa', false)).to eq('aaa')
              expect('aaa'.ensure_ending!('', false)).to eq('aaa')
              expect('hello?'.ensure_ending!('?', false)).to eq('hello?')
              expect('hello'.ensure_ending!('?a', false)).to eq('hello?a')
              expect('hellb'.ensure_ending!('??', false)).to eq('hellb??')
            end
            it 'passes complex scenarios' do
              expect('baa'.ensure_ending!('aaa', false)).to eq('baaaaa')
              expect('bba'.ensure_ending!('aaa', false)).to eq('bbaaaa')
              expect('baa'.ensure_ending!('aaaaaaaaa', false)).to eq('baaaaaaaaaaa')
              expect('baaaaa'.ensure_ending!('aaaaaa', false)).to eq('baaaaaaaaaaa')
              expect('ba'.ensure_ending!('aaaaaaaa', false)).to eq('baaaaaaaaa')
              expect('abc'.ensure_ending!('bca', false)).to eq('abcbca')
              expect('hi '.ensure_ending!(' ', false)).to eq('hi ')
              expect(' hi'.ensure_ending!(' ', false)).to eq(' hi ')
              expect('abc'.ensure_ending!('bcd', false)).to eq('abcbcd')
            end
          end # end context 'positive' -> 'without partial fill in'
        end # end context 'positive'
        context 'error' do
          it 'catches bad param: start' do
            expect{''.ensure_ending!(nil, true)}.to raise_exception(ArgumentError)
            expect{''.ensure_ending!(1337, true)}.to raise_exception(ArgumentError)
            expect{''.ensure_ending!({}, true)}.to raise_exception(ArgumentError)
            expect{''.ensure_ending!(nil, false)}.to raise_exception(ArgumentError)
            expect{''.ensure_ending!(1337, false)}.to raise_exception(ArgumentError)
            expect{''.ensure_ending!({}, false)}.to raise_exception(ArgumentError)
          end
          it 'catches bad param: use_partial_fill_in' do
            expect{''.ensure_ending!('nil', nil)}.to raise_exception(ArgumentError)
            expect{''.ensure_ending!('1337', 1337)}.to raise_exception(ArgumentError)
            expect{''.ensure_ending!('', {})}.to raise_exception(ArgumentError)
          end
        end # end context 'error'
      end
    end

    context 'func{>>} (prepend operation)' do
      it 'was added' do
        expect(''.respond_to?(:>>)).to eq(true)
        expect_func_in_class(String, :>>)
      end
      context 'handles cases' do
        context 'positive' do
          it 'simple data' do
            expect('' >> '').to eq('')
            expect('' >> 'a').to eq('a')
            expect('' >> 'ab').to eq('ab')
            expect('' >> " abcde 101 \n").to eq(" abcde 101 \n")
          end
          it 'complex data' do
            expect('b' >> 'a').to eq('ab')
            expect('baa' >> 'ba').to eq('babaa')
            expect('baaDd' >> 'baaDdd').to eq('baaDddbaaDd')
          end
        end
        context 'error' do
          it 'catches wrong parameter type provided' do
            expect{'' >> nil}.to raise_exception(ArgumentError)
            expect{'' >> 1337}.to raise_exception(ArgumentError)
            expect{'' >> {}}.to raise_exception(ArgumentError)
          end
        end
      end
    end

    context 'func{ensure_start!}' do
      it 'was added' do
        expect(''.respond_to?(:ensure_start!)).to eq(true)
        expect_func_in_class(String, :ensure_start!)
      end
      context 'handles cases' do
        context 'positive' do
          context 'with partial fill in' do
            it 'simple data' do
              expect(''.ensure_start!('', true)).to eq('')
              expect(''.ensure_start!(' ', true)).to eq(' ')
              expect(' '.ensure_start!(' ', true)).to eq(' ')
              expect(''.ensure_start!('a', true)).to eq('a')
              expect('b'.ensure_start!('a', true)).to eq('ab')
              expect('c'.ensure_start!('aaac', true)).to eq('aaac')
            end
            it 'complex data' do
              expect('baa'.ensure_start!('b', true)).to eq('baa')
              expect('baa'.ensure_start!('ba', true)).to eq('baa')
              expect('baa'.ensure_start!('baa', true)).to eq('baa')
              expect('baa'.ensure_start!('bb', true)).to eq('bbaa')
              expect('baa'.ensure_start!('bba', true)).to eq('bbaa')
              expect('baa'.ensure_start!('bbaa', true)).to eq('bbaa')
              expect('baa'.ensure_start!('bbaaa', true)).to eq('bbaaabaa')
              expect('abc123xyz'.ensure_start!('123', true)).to eq('123abc123xyz')
            end
          end
          context 'without partial fill in' do
            it 'simple data' do
              expect(''.ensure_start!('', false)).to eq('')
              expect(''.ensure_start!(' ', false)).to eq(' ')
              expect(' '.ensure_start!(' ', false)).to eq(' ')
              expect(''.ensure_start!('a', false)).to eq('a')
              expect('b'.ensure_start!('a', false)).to eq('ab')
              expect('b'.ensure_start!('aaab', false)).to eq('aaabb')
            end
            it 'complex data' do
              expect('baa'.ensure_start!('b', false)).to eq('baa')
              expect('baa'.ensure_start!('ba', false)).to eq('baa')
              expect('baa'.ensure_start!('baa', false)).to eq('baa')
              expect('baa'.ensure_start!('bb', false)).to eq('bbbaa')
              expect('baa'.ensure_start!('bba', false)).to eq('bbabaa')
              expect('baa'.ensure_start!('bbaa', false)).to eq('bbaabaa')
              expect('baa'.ensure_start!('bbaaa', false)).to eq('bbaaabaa')
              expect('abc123xyz'.ensure_start!('123', false)).to eq('123abc123xyz')
            end
          end
        end # end context 'positive'

        context 'error' do
          it 'catches bad param: start' do
            expect{''.ensure_start!(nil, true)}.to raise_exception(ArgumentError)
            expect{''.ensure_start!(1337, true)}.to raise_exception(ArgumentError)
            expect{''.ensure_start!({}, true)}.to raise_exception(ArgumentError)
            expect{''.ensure_start!(nil, false)}.to raise_exception(ArgumentError)
            expect{''.ensure_start!(1337, false)}.to raise_exception(ArgumentError)
            expect{''.ensure_start!({}, false)}.to raise_exception(ArgumentError)
          end
          it 'catches bad param: use_partial_fill_in' do
            expect{''.ensure_start!('nil', nil)}.to raise_exception(ArgumentError)
            expect{''.ensure_start!('1337', 1337)}.to raise_exception(ArgumentError)
            expect{''.ensure_start!('', {})}.to raise_exception(ArgumentError)
          end
        end
      end
    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do
    it 'func[str?]: runtime <= .00001s' do
      expect{'hi'.str?}.to perform_extremely_quickly
    end
    context 'with partial fill in, performs quickly' do
      it 'func[ensure_ending!]' do
        big = 'ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^'
        expect{'hello'.ensure_ending!('?a', true)}.to perform_quickly
        expect{''.ensure_ending!(big, true)}.to perform_quickly
        expect{big.ensure_ending!('', true)}.to perform_quickly
      end
      it 'func[ensure_start!]' do
        big = 'ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^'
        expect{'hello'.ensure_start!('?a', true)}.to perform_quickly
        expect{''.ensure_start!(big, true)}.to perform_quickly
        expect{big.ensure_start!('', true)}.to perform_quickly
      end
    end
    context 'without partial fill in, performs quickly' do
      it 'func[ensure_ending!]' do
        big = 'ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^'
        expect{'hello'.ensure_ending!('?a', false)}.to perform_quickly
        expect{''.ensure_ending!(big, false)}.to perform_quickly
        expect{big.ensure_ending!('', false)}.to perform_quickly
      end
      it 'func[ensure_start!]' do
        big = 'ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^ABT$JM^#$^'
        expect{'hello'.ensure_start!('?a', false)}.to perform_quickly
        expect{''.ensure_start!(big, false)}.to perform_quickly
        expect{big.ensure_start!('', false)}.to perform_quickly
      end
    end
  end

end
