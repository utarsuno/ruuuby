# encoding: UTF-8

using ::ThetaAngle::ContextRuuuby

RSpec.describe 'f27_b06' do

  context 'functionality for {f27_b06}' do

    context 'comparison funcs' do
      context 'func{<}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(θ°(0) < θ°(1)).to eq(true)
            expect(θ°(1) < θ°(10)).to eq(true)
            expect(θ°(0) < θ°(359)).to eq(true)
            expect(θ°(359) < θᵍ(400)).to eq(true)
            expect(θ°(359) < θʳ(2.0 * π)).to eq(true)
            expect(θ°(359) < θ𝞽(1)).to eq(true)
          end
          it 'cases: negative' do
            expect(θ°(0) < θ°(0)).to eq(false)
            expect(θ°(1) < θ°(0)).to eq(false)
            expect(θ°(10) < θ°(1)).to eq(false)
            expect(θ°(359) < θ°(0)).to eq(false)
            expect(θᵍ(400) < θ°(359)).to eq(false)
            expect(θʳ(2.0 * π) < θ°(359)).to eq(false)
            expect(θ𝞽(1) < θ°(359)).to eq(false)
          end
          it 'cases: error' do
            expect{θ°(1) < 10}.to raise_error(ArgumentError)
            expect{θ°(1) < nil}.to raise_error(ArgumentError)
          end
        end
      end # end: {func{<}}
      context 'func{<=}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(θ°(0) <= θ°(1)).to eq(true)
            expect(θ°(1) <= θ°(1)).to eq(true)
            expect(θ°(0) <= θ°(0)).to eq(true)
            expect(θ°(1) <= θ°(10)).to eq(true)
            expect(θ°(0) <= θ°(359)).to eq(true)
            expect(θ°(123) <= θ°(450)).to eq(true)
            expect(θ°(359) <= θ°(359)).to eq(true)
            expect(θ°(359) <= θᵍ(400)).to eq(true)
            expect(θ°(359) <= θʳ(2.0 * π)).to eq(true)
            expect(θ°(359) <= θ𝞽(1)).to eq(true)
            expect(θ°(360) <= θᵍ(400)).to eq(true)
            expect(θ°(360) <= θʳ(2.0 * π)).to eq(true)
            expect(θ°(360) <= θ𝞽(1)).to eq(true)
          end
          it 'cases: negative' do
            expect(θ°(1) <= θ°(0)).to eq(false)
            expect(θ°(10) <= θ°(1)).to eq(false)
            expect(θ°(359) <= θ°(0)).to eq(false)
            expect(θᵍ(400) <= θ°(359)).to eq(false)
            expect(θʳ(2.0 * π) <= θ°(359)).to eq(false)
            expect(θ𝞽(1) <= θ°(359)).to eq(false)
            expect(θ°(361) <= θᵍ(400)).to eq(false)
            expect(θ°(361) <= θʳ(2.0 * π)).to eq(false)
            expect(θ°(361) <= θ𝞽(1)).to eq(false)
          end
          it 'cases: error' do
            expect{θ°(1) <= nil}.to raise_error(ArgumentError)
          end
        end
      end # end: {func{<=}}
      context 'func{>}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(θ°(1) > θ°(0)).to eq(true)
            expect(θ°(10) > θ°(1)).to eq(true)
            expect(θ°(359) > θ°(0)).to eq(true)
            expect(θ°(360) > θᵍ(399)).to eq(true)
            expect(θ°(360) > θʳ(1.9 * π)).to eq(true)
            expect(θ°(360) > θ𝞽(0.99)).to eq(true)
          end
          it 'cases: negative' do
            expect(θ°(0) > θ°(1)).to eq(false)
            expect(θ°(1) > θ°(10)).to eq(false)
            expect(θ°(0) > θ°(359)).to eq(false)
            expect(θᵍ(399) > θ°(360)).to eq(false)
            expect(θʳ(1.9 * π) > θ°(360)).to eq(false)
            expect(θ𝞽(0.99) > θ°(360)).to eq(false)
          end
          it 'cases: error' do
            expect{θ°(1) > nil}.to raise_error(ArgumentError)
          end
        end
      end # end: {func{>}}
      context 'func{>=}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(θ°(1) >= θ°(0)).to eq(true)
            expect(θ°(0) >= θ°(0)).to eq(true)
            expect(θ°(1) >= θ°(1)).to eq(true)
            expect(θ°(10) >= θ°(1)).to eq(true)
            expect(θ°(10) >= θ°(10)).to eq(true)
            expect(θ°(359) >= θ°(0)).to eq(true)
            expect(θ°(359) >= θ°(123)).to eq(true)
            expect(θ°(359) >= θ°(359)).to eq(true)
            expect(θ°(360) >= θᵍ(399)).to eq(true)
            expect(θ°(360) >= θʳ(1.9 * π)).to eq(true)
            expect(θ°(360) >= θ𝞽(0.99)).to eq(true)
            expect(θ°(360) >= θᵍ(400)).to eq(true)
            expect(θ°(360) >= θʳ(2.0 * π)).to eq(true)
            expect(θ°(360) >= θ𝞽(1.0)).to eq(true)
            expect(θ°(361) >= θᵍ(400)).to eq(true)
            expect(θ°(361) >= θʳ(2.0 * π)).to eq(true)
            expect(θ°(361) >= θ𝞽(1.0)).to eq(true)
          end
          it 'cases: negative' do
            expect(θ°(0) >= θ°(1)).to eq(false)
            expect(θ°(1) >= θ°(10)).to eq(false)
            expect(θ°(0) >= θ°(359)).to eq(false)
            expect(θ°(359) >= θᵍ(400)).to eq(false)
            expect(θ°(359) >= θʳ(2.0 * π)).to eq(false)
            expect(θ°(359) >= θ𝞽(1.0)).to eq(false)
          end
          it 'cases: error' do
            expect{θ°(1) >= nil}.to raise_error(ArgumentError)
          end
        end
      end # end: {func{>=}}
      context 'func{<=>}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(θ°(1) <=> θ°(0)).to eq(1)
            expect(θ°(10) <=> θ°(1)).to eq(1)
            expect(θ°(359) <=> θ°(0)).to eq(1)
            expect(θ°(359) <=> θ°(123)).to eq(1)
            expect(θ°(360) <=> θᵍ(399)).to eq(1)
            expect(θ°(360) <=> θʳ(1.9 * π)).to eq(1)
            expect(θ°(360) <=> θ𝞽(0.99)).to eq(1)
            expect(θ°(361) <=> θᵍ(400)).to eq(1)
            expect(θ°(361) <=> θʳ(2.0 * π)).to eq(1)
            expect(θ°(361) <=> θ𝞽(1.0)).to eq(1)
          end
          it 'cases: equal' do
            expect(θ°(0) <=> θ°(0)).to eq(0)
            expect(θ°(1) <=> θ°(1)).to eq(0)
            expect(θ°(359) <=> θ°(359)).to eq(0)
            expect(θ°(10) <=> θ°(10)).to eq(0)
            expect(θ°(360) <=> θᵍ(400)).to eq(0)
            expect(θ°(360) <=> θʳ(2.0 * π)).to eq(0)
            expect(θ°(360) <=> θ𝞽(1.0)).to eq(0)
          end
          it 'cases: negative' do
            expect(θᵍ(399) <=> θᵍ(400)).to eq(-1)
            expect(θ°(0) <=> θ°(1)).to eq(-1)
            expect(θ°(1) <=> θ°(10)).to eq(-1)
            expect(θ°(0) <=> θ°(359)).to eq(-1)
            expect(θ°(359) <=> θᵍ(400)).to eq(-1)
            expect(θ°(359) <=> θʳ(2.0 * π)).to eq(-1)
            expect(θ°(359) <=> θ𝞽(1.0)).to eq(-1)
          end
          it 'cases: nil' do
            expect(θ°(359) <=> nil).to eq(nil)
            expect(θ°(359) <=> 'asd').to eq(nil)
            expect(θ°(359) <=> :asd).to eq(nil)
          end
        end
      end # end: {func{<=>}}
    end # end: {comparison funcs}

  end

  context 'audits', :audit do
    context '{f27_b06}' do
      context 'class{ThetaAngle} is defined as needed' do
        it 'w/ needed funcs' do
          expect_∃⨍(:<=, ::ThetaAngle)
          expect_∃⨍(:>=, ::ThetaAngle)
          expect_∃⨍(:<, ::ThetaAngle)
          expect_∃⨍(:>, ::ThetaAngle)
          expect_∃⨍(:<=>, ::ThetaAngle)
          expect_∃⨍(:==, ::ThetaAngle)
        end
      end
    end
  end # end: {audits}

end
