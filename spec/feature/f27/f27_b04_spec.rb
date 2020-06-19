# coding: UTF-8

RSpec.describe 'f27_b04' do

  context 'functionality for {f27_b04}' do

    context 'func{zero_angle?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(θ°(0).∅?).to eq(true)
          expect(θʳ(0).∅?).to eq(true)
          expect(θᵍ(0).∅?).to eq(true)
          expect(θ𝞽(0).∅?).to eq(true)
        end
        it 'cases: negative' do
          [-10, 89, 91, 182, 360, 361].∀ {|scenario| expect(θ°(scenario).∅?).to eq(false)}
          [-π * ¼, 1, π * ½ + 1, π, 2.0 * π, 2.0 * π + ¼].∀ {|scenario| expect(θʳ(scenario).∅?).to eq(false)}
          [-10, 99, 101, 182, 361, 400].∀ {|scenario| expect(θᵍ(scenario).∅?).to eq(false)}
          [-0.1, 0.24, 0.26, 0.49, 0.51, 1].∀ {|scenario| expect(θ𝞽(scenario).∅?).to eq(false)}
        end
      end # end: {handles needed scenarios}
    end # end: {func{zero_angle?}}

    context 'func{right_angle?}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it '°' do
            expect(θ°(-90).⦜?).to eq(true)
            expect(θ°(-90).⦜?).to eq(true)
            expect(θ°(90).⦜?).to eq(true)
            expect(θ°(450).⦜?).to eq(true)
          end
          it 'ʳ' do
            expect(θʳ(π * 0.5).⦜?).to eq(true)
            expect(θʳ(π * 2.5).⦜?).to eq(true)
          end
          it 'ᵍ' do
            expect(θᵍ(100).⦜?).to eq(true)
            expect(θᵍ(500).⦜?).to eq(true)
          end
          it '𝞽' do
            expect(θ𝞽(0.25).⦜?).to eq(true)
            expect(θ𝞽(1.25).⦜?).to eq(true)
          end
        end
        it 'cases: negative' do
          [-10, 0, 89, 91, 182, 361].∀ {|scenario| expect(θ°(scenario).⦜?).to eq(false)}
          [-π * ¼, 0, 1, π * 0.5 + 1, π, 2.0 * π, 2.0 * π + ¼].∀ {|scenario| expect(θʳ(scenario).⦜?).to eq(false)}
          [-10, 0, 99, 101, 182, 361].∀ {|scenario| expect(θᵍ(scenario).⦜?).to eq(false)}
          [-0.1, 0, 0.24, 0.26, 0.49, 0.51, 1].∀ {|scenario| expect(θ𝞽(scenario).⦜?).to eq(false)}
        end
      end # end: {handles needed scenarios}
    end # end: {func{right_angle?}}

    context 'func{obtuse_angle?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          [91, 100, 145, 179, 539].∀ {|scenario| expect((θ°(scenario).⦦?)).to eq(true)}
          [π - ¼, (π * 0.5) * 1.25].∀ {|scenario| expect((θʳ(scenario).⦦?)).to eq(true)}
          [101, 150, 199].∀ {|scenario| expect(θᵍ(scenario).⦦?).to eq(true)}
          [0.26, 0.35, 0.49].∀ {|scenario| expect(θ𝞽(scenario).⦦?).to eq(true)}
        end
        it 'cases: negative' do
          [-10, 0, 89, 90, 180, 181, 361].∀ {|scenario| expect(θ°(scenario).⦦?).to eq(false)}
          [-π * ¼, π * 0.5, π, 2.0 * π, 2.0 * π + ¼].∀ {|scenario| expect(θʳ(scenario).⦦?).to eq(false)}
          [-10, 0, 99, 100, 200, 201].∀ {|scenario| expect(θᵍ(scenario).⦦?).to eq(false)}
          [-0.1, 0, 0.5, 0.51].∀ {|scenario| expect(θ𝞽(scenario).⦦?).to eq(false)}
        end
      end # end: {handles needed scenarios}
    end # end: {func{obtuse_angle?}}

    context 'func{∠?(:acute)}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it '°' do
            [45, 89, 405, 449].∀ {|scenario| expect((θ°(scenario).⦟?)).to eq(true)}
          end
          it 'ʳ' do
            [π * ¼, (π * 0.5) * 0.95, 2.0 * π + π * ¼, 2.0 * π + (π * 0.5) * 0.95].∀ {|scenario| expect((θʳ(scenario).⦟?)).to eq(true)}
          end
          it 'ᵍ' do
            [50, 99, 450, 499].∀ {|scenario| expect(θᵍ(scenario).⦟?).to eq(true)}
          end
          it '𝞽' do
            [0.1, 0.24, 0.2499, 1.1, 1.24, 1.2499].∀ {|scenario| expect(θ𝞽(scenario).⦟?).to eq(true)}
          end
        end
        it 'cases: negative' do
          [90, 182, 450, 451].∀ {|scenario| expect(θ°(scenario).⦟?).to eq(false)}
          [π * 0.5, π, 2.0 * π, 3.0 * π + ¼].∀ {|scenario| expect(θʳ(scenario).⦟?).to eq(false)}
          [100, 101, 182, 361].∀ {|scenario| expect(θᵍ(scenario).⦟?).to eq(false)}
          [¼, 0.26].∀ {|scenario| expect(θ𝞽(scenario).⦟?).to eq(false)}
        end
      end # end: {handles needed scenarios}
    end # end: {func{∠?(:acute)}}

    context 'func{straight_angle?}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it '°' do
            expect(θ°(180)._?).to eq(true)
            expect(θ°(540)._?).to eq(true)
          end
          it 'ʳ' do
            expect(θʳ(π)._?).to eq(true)
            expect(θʳ(π * 3.0)._?).to eq(true)
          end
          it 'ᵍ' do
            expect(θᵍ(200)._?).to eq(true)
            expect(θᵍ(600)._?).to eq(true)
          end
          it '𝞽' do
            expect(θ𝞽(0.5)._?).to eq(true)
            expect(θ𝞽(1.5)._?).to eq(true)
          end
        end
        it 'cases: negative' do
          [-10, 0, 89, 91, 182, 259, 299, 361, 360.1337, 1337].∀ {|scenario| expect(θ°(scenario)._?).to eq(false)}
          [-π * ¼, 0, 1, π * ½ + 1, 2.0 * π + ¼].∀ {|scenario| expect(θʳ(scenario)._?).to eq(false)}
          [-10, 0, 99, 101, 182, 361, 399, 359, 401, 1337].∀ {|scenario| expect(θᵍ(scenario)._?).to eq(false)}
          [-0.1, 0, 0.24, ¼, 0.26, 0.49, 0.51, 1].∀ {|scenario| expect(θ𝞽(scenario)._?).to eq(false)}
        end
      end # end: {handles needed scenarios}
    end # end: {func{straight_angle?}}

    context 'func{perigon_angle?}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it '°' do
            expect(θ°(360).○?).to eq(true)
            expect(θ°(720).○?).to eq(true)
          end
          it 'ʳ' do
            expect(θʳ(π * 2.0).○?).to eq(true)
            expect(θʳ(π * 4.0).○?).to eq(true)
          end
          it 'ᵍ' do
            expect(θᵍ(400).○?).to eq(true)
            expect(θᵍ(800).○?).to eq(true)
          end
          it '𝞽' do
            expect(θ𝞽(1).○?).to eq(true)
            expect(θ𝞽(2).○?).to eq(true)
          end
        end
        it 'cases: negative' do
          [-10, 0, 89, 91, 182, 259, 299, 361, 360.1337, 1337].∀ {|scenario| expect(θ°(scenario).○?).to eq(false)}
          [-π * ¼, 0, 1, π * ½ + 1, π, 2.0 * π + ¼].∀ {|scenario| expect(θʳ(scenario).○?).to eq(false)}
          [-10, 0, 99, 101, 182, 361, 399, 359, 401, 1337].∀ {|scenario| expect(θᵍ(scenario).○?).to eq(false)}
          [-0.1, 0, ½, 1.5, 1337, 0.99, 1.01].∀ {|scenario| expect(θᵍ(scenario).○?).to eq(false)}
        end
      end # end: {handles needed scenarios}
    end # end: {func{perigon_angle?}}

    context 'func{sextant_angle?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          expect(θ°(60).𝟞𝟘°?).to eq(true)
          expect(θʳ((60.0 / 360) * 2.0 * π).𝟞𝟘°?).to eq(true)
          expect(θᵍ((60.0 / 360) * 400.0).𝟞𝟘°?).to eq(true)
          expect(θ𝞽(60.0 / 360).𝟞𝟘°?).to eq(true)
        end
        it 'cases: negative' do
          [-10, 0, 89, 90, 179, 180, 360, 361].∀ {|scenario| expect(θ°(scenario).𝟞𝟘°?).to eq(false)}
          [π - ¼, 2.0 * π + ¼, π, 2.0 * π].∀ {|scenario| expect(θʳ(scenario).𝟞𝟘°?).to eq(false)}
          [-10, 0, 199, 200, 400, 401].∀ {|scenario| expect(θᵍ(scenario).𝟞𝟘°?).to eq(false)}
          [-0.1, 0, 0.49, ½, 1].∀ {|scenario| expect(θ𝞽(scenario).𝟞𝟘°?).to eq(false)}
        end
      end # end: {handles needed scenarios}
    end # end: {func{sextant_angle?}}

    context 'func{oblique_angle?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          [181, 200, 300, 359, 361].∀ {|scenario| expect(θ°(scenario).oblique?).to eq(true)}
          [π + ¼, 2.0 * π - 0.25, 2.0 * π + 0.25].∀ {|scenario| expect(θʳ(scenario).oblique?).to eq(true)}
          [201, 299, 399, 401, 1337].∀ {|scenario| expect(θᵍ(scenario).oblique?).to eq(true)}
          [0.51, 0.76, 0.99, 1.01].∀ {|scenario| expect(θ𝞽(scenario).oblique?).to eq(true)}
        end
        context 'cases: negative' do
          it '°' do
            expect(θ°(90).oblique?).to eq(false)
            expect(θ°(180).oblique?).to eq(false)
            expect(θ°(270).oblique?).to eq(false)
            expect(θ°(360).oblique?).to eq(false)
            expect(θ°(90 + (360 * 5)).oblique?).to eq(false)
          end
          it 'ʳ' do
            expect(θʳ(π * 0.5).oblique?).to eq(false)
            expect(θʳ(π).oblique?).to eq(false)
            expect(θʳ(π * 1.5).oblique?).to eq(false)
            expect(θʳ(π * 2.0).oblique?).to eq(false)
            expect(θʳ(π * 2.5).oblique?).to eq(false)
          end
          it 'ᵍ' do
            expect(θᵍ(100).oblique?).to eq(false)
            expect(θᵍ(200).oblique?).to eq(false)
            expect(θᵍ(300).oblique?).to eq(false)
            expect(θᵍ(400).oblique?).to eq(false)
            expect(θᵍ(500).oblique?).to eq(false)
          end
          it '𝞽' do
            expect(θ𝞽(0.25).oblique?).to eq(false)
            expect(θ𝞽(0.50).oblique?).to eq(false)
            expect(θ𝞽(0.75).oblique?).to eq(false)
            expect(θ𝞽(1.00).oblique?).to eq(false)
            expect(θ𝞽(1.25).oblique?).to eq(false)
          end
        end
      end # end: {handles needed scenarios}
    end # end: {func{oblique_angle?}}

    context 'func{reflex_angle?}' do
      context 'handles needed scenarios' do
        it 'cases: positive' do
          [181, 200, 300, 359, 719].∀ {|scenario| expect(θ°(scenario).reflex?).to eq(true)}
          [π + ¼, 2.0 * π - ¼].∀ {|scenario| expect(θʳ(scenario).reflex?).to eq(true)}
          [201, 300, 399].∀ {|scenario| expect(θᵍ(scenario).reflex?).to eq(true)}
          [0.51, 0.75, 0.99, 1.99, 1.51, 1.99].∀ {|scenario| expect(θ𝞽(scenario).reflex?).to eq(true)}
        end
        it 'cases: negative' do
          [-10, 0, 89, 90, 179, 180, 360, 361, 720, 721, 800].∀ {|scenario| expect(θ°(scenario).reflex?).to eq(false)}
          [π - ¼, 2.0 * π + ¼, π, 2.0 * π, 3.0 * π].∀ {|scenario| expect(θʳ(scenario).reflex?).to eq(false)}
          [-10, 0, 199, 200, 400, 401].∀ {|scenario| expect(θᵍ(scenario).reflex?).to eq(false)}
          [-0.1, 0, 0.49, ½, 1, 1.1, 1.49, 2, 2.01].∀ {|scenario| expect(θ𝞽(scenario).reflex?).to eq(false)}
        end
      end # end: {handles needed scenarios}
    end # end: {func{reflex_angle?}}

  end

end
