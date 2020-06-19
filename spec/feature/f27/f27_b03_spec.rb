# coding: UTF-8

RSpec.describe 'f27_b03' do

  context 'functionality for {f27_b03}' do

    context 'module{ThetaAngle::Pair}' do
      let(:funcs){::ThetaAngle::Pair}

      context 'offers func{explementary?}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(funcs.explementary?(θ°(180), θ𝞽(0.5))).to eq(true)
            expect(funcs.explementary?(θᵍ(200), θ𝞽(½))).to eq(true)
            expect(funcs.explementary?(θᵍ(200), θ°(180))).to eq(true)
            expect(funcs.explementary?(θ𝞽(½), θᵍ(200))).to eq(true)
            expect(funcs.explementary?(θ𝞽(½), θ𝞽(½))).to eq(true)
            expect(funcs.explementary?(θʳ(θ°(180).ʳ), θ°(180))).to eq(true)
          end
          it 'cases: negative' do
            expect(funcs.explementary?(θ°(46), θ𝞽(1.0 / 8.0))).to eq(false)
            expect(funcs.explementary?(θᵍ(51), θ𝞽(1.0 / 8.0))).to eq(false)
          end
        end
      end # end: {offers func{explementary?}}

      context 'offers func{complementary?}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(funcs.complementary?(θ°(45), θ𝞽(1.0 / 8.0))).to eq(true)
            expect(funcs.complementary?(θᵍ(50), θ𝞽(1.0 / 8.0))).to eq(true)
            expect(funcs.complementary?(θᵍ(50), θ°(45))).to eq(true)
            expect(funcs.complementary?(θ𝞽(1.0 / 8.0), θᵍ(50))).to eq(true)
            expect(funcs.complementary?(θ𝞽(1.0 / 8.0), θ°(45))).to eq(true)
            expect(funcs.complementary?(θʳ(θ°(45).ʳ), θ°(45))).to eq(true)
          end
          it 'cases: negative' do
            expect(funcs.complementary?(θ°(46), θ𝞽(1.0 / 8.0))).to eq(false)
            expect(funcs.complementary?(θᵍ(51), θ𝞽(1.0 / 8.0))).to eq(false)
          end
        end
      end # end: {offers func{complementary?}}

      context 'offers func{supplementary?}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(funcs.supplementary?(θ°(90), θ𝞽(¼))).to eq(true)
            expect(funcs.supplementary?(θᵍ(100), θ𝞽(¼))).to eq(true)
            expect(funcs.supplementary?(θᵍ(100), θ°(90))).to eq(true)
            expect(funcs.supplementary?(θ𝞽(¼), θᵍ(100))).to eq(true)
            expect(funcs.supplementary?(θ𝞽(¼), θ𝞽(¼))).to eq(true)
            expect(funcs.supplementary?(θʳ(θ°(90).ʳ), θ°(90))).to eq(true)
          end
          it 'cases: negative' do
            expect(funcs.supplementary?(θ°(46), θ𝞽(1.0 / 8.0))).to eq(false)
            expect(funcs.supplementary?(θᵍ(51), θ𝞽(1.0 / 8.0))).to eq(false)
          end
        end
      end # end: {offers func{supplementary?}}

      context 'offers func{supplementary?}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            a = 𝞽.ʳ - Ⴔ
            b = Ⴔ
            expect(funcs.golden?(a, b)).to eq(true)
            expect(funcs.golden?(b, a)).to eq(true)
          end
          it 'cases: negative' do
            a = 𝞽.ʳ - Ⴔ
            b = Ⴔ
            expect(funcs.golden?(a + 1, b)).to eq(false)
            expect(funcs.golden?(b + 1, a)).to eq(false)
          end
        end
      end # end: {offers func{golden?}}

    end

  end

end
