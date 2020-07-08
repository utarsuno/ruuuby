# encoding: UTF-8

RSpec.describe 'f06_b06' do

  context 'functionality{f06_b06}' do
    context 'adding needed functions' do

      context 'func{sym?}' do
        context 'w/ normalizer(:∈^)' do
          context 'handles needed scenarios' do
            context 'cases: positive' do
              it 'regular exponents' do
                expect(:⁴.sym?(:'∈^')).to eq(4)
                expect(:².sym?(:'∈^')).to eq(2)
                expect(:⁰.sym?(:'∈^')).to eq(0)
                expect(:⁻².sym?(:'∈^')).to eq(-2)
                expect(:⁻⁴.sym?(:'∈^')).to eq(-4)
              end
              it '± inf' do
                expect(:∞.sym?(:'∈^')).to eq(::Float::INFINITY)
                expect(:'-∞'.sym?(:'∈^')).to eq(::Float::INFINITY_NEGATIVE)
              end
              it 'complex inf' do
                expect(:∞ℂ.sym?(:'∈^')).to eq(::Float::INFINITY_COMPLEX)
              end
            end
            context 'cases: negative' do
              it 'invalid inf' do
                expect(:∞∞.sym?(:'∈^')).to eq(false)
                expect(:'--∞'.sym?(:'∈^')).to eq(false)
              end
              it 'complex inf' do
                expect(:ℂ∞ℂ.sym?(:'∈^')).to eq(false)
              end
              it 'invalid exponent' do
                expect(:²²².sym?(:'∈^')).to eq(false)
                expect(:₂.sym?(:'∈^')).to eq(false)
                expect(:a.sym?(:'∈^')).to eq(false)
              end
            end
          end
        end # end: {w/ normalizer(:'∈^')}

        context 'w/o any normalizer' do
          context 'handles needed scenarios' do
            it 'cases: positive' do
              [:test, :hello, :²²², :₂].∀{|n|expect(n.sym?).to eq(true)}
            end
            it 'cases: negative' do
              [Symbol, nil, 1337, 'test', ':test', :test.to_s].∀{|n|expect(n.sym?).to eq(false)}
            end
          end
        end # end: {w/o any normalizer}
      end # end: {func{sym?}}

      context 'func{🛑sym❓}' do
        context 'handles needed input scenarios' do
          context 'cases: positive' do
            context 'w/ normalization{:∈^}' do
              it 'w/ single param' do
                expect{🛑sym❓('0', :⁸, :'∈^')}.to_not raise_error
              end
              it 'w/ many params' do
                expect{🛑syms❓([:⁸, :⁻⁴], :'∈^')}.to_not raise_error
              end
            end
            context 'w/o normalization' do
              it 'w/ single param' do
                expect{🛑sym❓('0', :symbol_fake)}.to_not raise_error
              end
              it 'w/ many params' do
                expect{🛑syms❓([:symbol_fake_other, :symbol_fake])}.to_not raise_error
              end
            end
          end
          context 'cases: negative' do
            context 'w/ bad normalization' do
              it 'w/ single param' do
                expect{🛑sym❓('0', :a, :'∈^')}.to raise_error(ArgumentError)
              end
              it 'w/ many params' do
                expect{🛑syms❓(['5', :a], :'∈^')}.to raise_error(ArgumentError)
                expect{🛑syms❓([:a, 1337], :'∈^')}.to raise_error(ArgumentError)
                expect{🛑syms❓([nil, :a], :'∈^')}.to raise_error(ArgumentError)
              end
            end
            context 'w/o normalization' do
              it 'w/ single param' do
                expect{🛑sym❓('0', nil)}.to raise_error(ArgumentError)
              end
              it 'w/ many params' do
                expect{🛑syms❓(['5', nil])}.to raise_error(ArgumentError)
                expect{🛑syms❓([5, 1337])}.to raise_error(ArgumentError)
                expect{🛑syms❓([nil, nil])}.to raise_error(ArgumentError)
              end
            end
          end
        end
      end # end: {func{🛑sym❓}}

    end # end: {adding needed functions}
  end # end: {functionality}

  context 'audit', :audit do
    context 'feature{f06}:behavior{b06} passes audits' do
      context 'funcs provided are defined in correct location' do
        it 'for c{Object}' do
          expect_∃⨍(:sym?, ::Object)
        end
        it 'for m{ObjectF06}' do
          expect_∃⨍(:🛑sym❓, ::Ruuuby::Feature::Includable::ObjectF06)
          expect_∃⨍(:🛑syms❓, ::Ruuuby::Feature::Includable::ObjectF06)
        end
      end
    end
  end # end: {audit}

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'func{sym?}: performs extremely quickly' do
      it 'for cases: true' do
        expect{:sym.sym?}.to perform_extremely_quickly
      end
      it 'for cases: false' do
        expect{'sym'.sym?}.to perform_extremely_quickly
      end
    end

    context 'funcs{🛑sym❓}: performs extremely quickly' do
      context 'cases: positive' do
        it 'w/ single param' do
          expect{🛑sym❓('0', :symbol_fake)}.to perform_extremely_quickly
        end
        it 'w/ many params' do
          expect{🛑syms❓([:symbol_fake_other, :symbol_fake])}.to perform_extremely_quickly
        end
      end
    end
  end # end: {performance}

end
