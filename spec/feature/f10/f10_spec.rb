# coding: UTF-8

RSpec.describe 'f10' do

  context 'functionality' do
    context '{b02}' do
      it 'adds alias{🆔} to func{object_id}' do
        expect(::Object.respond_to?(:🆔)).to eq(true)
        leet = 1337
        expect(leet.object_id == leet.🆔).to eq(true)
        expect(leet.🆔.ⓣ).to eq(::Integer)
      end
      it 'adds alias{❄️} to func{freeze}' do
        leet = [999999, 'a']
        expect(leet.frozen?).to eq(false)
        leet.❄️
        expect(leet.frozen?).to eq(true)
      end
      it 'adds alias{❄️?} to func{frozen?}' do
        leet = [999999, 'a']
        expect(leet.❄️?).to eq(false)
        leet.freeze
        expect(leet.❄️?).to eq(true)
      end
    end
    context '{b07}' do
      context 'adds func{√}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'equals (Math.sqrt)' do
              expect(√(25)).to eq(Math.sqrt(25))
            end
            it 'w/ regular numerics' do
              expect(√(1)).to eq(1.0)
              expect(√(1.0)).to eq(1.0)
              expect(√(25)).to eq(5.0)
              expect(√(Rational(25, 1))).to eq(5.0)
              expect(√(Complex(25))).to eq(5.0)
            end
            it 'w/ with numerics represented by strings' do
              expect(√('2.0')).to eq(√(2.0))
              expect(√('𝚽')).to eq(√(𝚽))
              expect(√('1337')).to eq(√(1337))
            end
          end
          it 'cases: error' do
            expect{√(nil)}.to raise_error(ArgumentError)
          end
        end
      end # end: {adds func{√}}

      context 'adds func{∛}' do
        it 'equals (Math.cbrt)' do
          expect(∛(25)).to eq(Math.cbrt(25))
        end
      end # end: {adds func{∛}}
    end
  end

  context 'audit', :audit do
    context 'feature(f10) passes audits' do
      context 'funcs provided are defined in correct location' do
        it 'for{b00}' do
          #expect_∃⨍_with_alias(:private, :🙈, ::Module)
          #expect_∃⨍_with_alias(:protected, :🛡️, ::Module)
        end
        it 'for{b01}' do
          expect_∃⨍(:🆕, ::Class)
        end
        it 'for{b02}' do
          #expect_∃⨍_with_alias(:object_id, :🆔, ::Object)
          #expect_∃⨍_with_alias(:freeze, :❄️, ::Object)
          #expect_∃⨍_with_alias(:frozen?, :❄️?, ::Object)
        end
        it 'for{b03}' do
          #expect_∃⨍_with_alias(:class, :ⓣ, ::Object)
          #expect_∃⨍(:Ⓣ, ::Object)
        end
        it 'for{b04}' do
          expect_∃⨍_with_alias(:source_location, :🏠, ::Method)
        end
        it 'for{b05}' do
          #expect_∃⨍_with_alias(:rand, :🎲, ::Kernel)
          #expect_∃⨍_with_alias(:raise, :🛑, ::Kernel)
        end
        it 'for{b06}' do
          expect_∃⨍(:√, ::Kernel)
          expect_∃⨍(:∛, ::Kernel)
        end
        it 'for{b07}' do
          expect_∃⨍(:logₑ, ::Kernel)
          expect_∃⨍(:log₂, ::Kernel)
          expect_∃⨍(:log₁₀, ::Kernel)
        end
      end
    end
  end

end
