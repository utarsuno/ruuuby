# coding: UTF-8

RSpec.describe 'f32_b01' do

  context 'feature{f32} behavior{b01} functionality' do
    let(:f𝕎¹){::Math::NumberTheory::𝕎¹}

    context '𝕎¹' do

      context 'func{additive_persistence}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it '== {0}' do
              (0..9).each{|n| expect(f𝕎¹.additive_persistence(n)).to eq(0)}
            end
            it '== {1}' do
              [10, 11, 12, 13, 14, 15, 16, 17, 18, 20, 200, 201, 202].∀{|n| expect(f𝕎¹.additive_persistence(n)).to eq(1)}
            end
            it '== {2}' do
              [19, 198, 208, 687].∀{|n| expect(f𝕎¹.additive_persistence(n)).to eq(2)}
            end
            it '== {3}' do
              expect(f𝕎¹.additive_persistence(199)).to eq(3)
            end
          end
          # ___  ___  __           __   ___  __  ___      /  /  /
          #  |  |__  /  ` |__|    |  \ |__  |__)  |      /  /  /
          #  |  |___ \__, |  |    |__/ |___ |__)  |     .  .  .
          context 'tech_debt', :tech_debt do
            it 'support int values beyond FIXNUM' do
              expect{f𝕎¹.additive_persistence(99999999999999)}.to raise_error(RangeError)
            end
          end
          it 'cases: error' do
            f𝕎¹_error_scenarios.∀{|scenario| expect{f𝕎¹.additive_persistence(scenario)}.to raise_error(ArgumentError)}
          end
        end
      end # end: {func{additive_persistence}}

      context 'func{digital_root}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'values < 10' do
              (0..9).each{|scenario| expect(f𝕎¹.digital_root(scenario)).to eq(scenario)}
            end
            it 'values <= 38' do
              expect(f𝕎¹.digital_root(10)).to eq(1)
              expect(f𝕎¹.digital_root(11)).to eq(2)
              expect(f𝕎¹.digital_root(12)).to eq(3)
              expect(f𝕎¹.digital_root(13)).to eq(4)
              expect(f𝕎¹.digital_root(14)).to eq(5)
              expect(f𝕎¹.digital_root(15)).to eq(6)
              expect(f𝕎¹.digital_root(17)).to eq(8)
              expect(f𝕎¹.digital_root(18)).to eq(9)
              expect(f𝕎¹.digital_root(19)).to eq(1)
              expect(f𝕎¹.digital_root(20)).to eq(2)
              expect(f𝕎¹.digital_root(21)).to eq(3)
              expect(f𝕎¹.digital_root(22)).to eq(4)
              expect(f𝕎¹.digital_root(23)).to eq(5)
              expect(f𝕎¹.digital_root(24)).to eq(6)
              expect(f𝕎¹.digital_root(25)).to eq(7)
              expect(f𝕎¹.digital_root(26)).to eq(8)
              expect(f𝕎¹.digital_root(27)).to eq(9)
              expect(f𝕎¹.digital_root(28)).to eq(1)
              expect(f𝕎¹.digital_root(29)).to eq(2)
              expect(f𝕎¹.digital_root(30)).to eq(3)
              expect(f𝕎¹.digital_root(31)).to eq(4)
              expect(f𝕎¹.digital_root(32)).to eq(5)
              expect(f𝕎¹.digital_root(33)).to eq(6)
              expect(f𝕎¹.digital_root(34)).to eq(7)
              expect(f𝕎¹.digital_root(35)).to eq(8)
              expect(f𝕎¹.digital_root(36)).to eq(9)
              expect(f𝕎¹.digital_root(37)).to eq(1)
              expect(f𝕎¹.digital_root(38)).to eq(2)
            end
            it 'values >= 80 and < 90' do
              expect(f𝕎¹.digital_root(80)).to eq(8)
              expect(f𝕎¹.digital_root(81)).to eq(9)
              expect(f𝕎¹.digital_root(83)).to eq(2)
              expect(f𝕎¹.digital_root(84)).to eq(3)
              expect(f𝕎¹.digital_root(85)).to eq(4)
              expect(f𝕎¹.digital_root(86)).to eq(5)
              expect(f𝕎¹.digital_root(87)).to eq(6)
              expect(f𝕎¹.digital_root(88)).to eq(7)
              expect(f𝕎¹.digital_root(89)).to eq(8)
              expect(f𝕎¹.digital_root(90)).to eq(9)
            end
            it 'misc values' do
              expect(f𝕎¹.digital_root(1337)).to eq(5)
              expect(f𝕎¹.digital_root(1001)).to eq(2)
              expect(f𝕎¹.digital_root(230)).to eq(5)
              expect(f𝕎¹.digital_root(9999999)).to eq(9)
              expect(f𝕎¹.digital_root(24566)).to eq(5)
              expect(f𝕎¹.digital_root(65536)).to eq(7)
            end
          end
          # ___  ___  __           __   ___  __  ___      /  /  /
          #  |  |__  /  ` |__|    |  \ |__  |__)  |      /  /  /
          #  |  |___ \__, |  |    |__/ |___ |__)  |     .  .  .
          context 'tech_debt', :tech_debt do
            it 'support int values beyond FIXNUM' do
              expect{f𝕎¹.digital_root(99999999999999)}.to raise_error(RangeError)
            end
          end
          it 'cases: error' do
            f𝕎¹_error_scenarios.∀{|scenario| expect{f𝕎¹.digital_root(scenario)}.to raise_error(ArgumentError)}
          end
        end
      end

      context 'func{digit_sum}' do
        context 'handles needed scenarios' do
          context 'cases: positive' do
            it 'values < 10' do
              (0..9).∀ do |n|
                expect(f𝕎¹.digit_sum(n)).to eq(n)
              end
            end
            it 'values < 20' do
              (10..19).∀ do |n|
                expect(f𝕎¹.digit_sum(n)).to eq(n - 9)
              end
              expect(f𝕎¹.digit_sum(10)).to eq(1)
              expect(f𝕎¹.digit_sum(11)).to eq(2)
              expect(f𝕎¹.digit_sum(12)).to eq(3)
            end
            it 'values >= 80 and < 90' do
              (80..89).∀ do |n|
                expect(f𝕎¹.digit_sum(n)).to eq(n - 72)
              end
            end
            it 'misc values' do
              expect(f𝕎¹.digit_sum(1337)).to eq(14)
              expect(f𝕎¹.digit_sum(1001)).to eq(2)
              expect(f𝕎¹.digit_sum(230)).to eq(5)
              expect(f𝕎¹.digit_sum(9999999)).to eq(63)
            end
          end
          it 'cases: error' do
            f𝕎¹_error_scenarios.∀{|scenario| expect{f𝕎¹.digit_sum(scenario)}.to raise_error(ArgumentError)}
          end
        end
      end

      context 'func{nᵗʰ_euler_totient}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_euler_totient(0)).to eq(0)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_euler_totient(1)).to eq(1)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_euler_totient(2)).to eq(1)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_euler_totient(3)).to eq(2)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_euler_totient(4)).to eq(2)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_euler_totient(5)).to eq(4)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_euler_totient(6)).to eq(2)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_euler_totient(7)).to eq(6)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_euler_totient(8)).to eq(4)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_euler_totient(9)).to eq(6)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_euler_totient(10)).to eq(4)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_euler_totient(11)).to eq(10)
          end
        end
      end # end: {func{nᵗʰ_euler_totient}}

      context 'func{nᵗʰ_cototient}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_cototient(0)).to eq(0)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_cototient(1)).to eq(0)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_cototient(2)).to eq(1)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_cototient(3)).to eq(1)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_cototient(4)).to eq(2)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_cototient(5)).to eq(1)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_cototient(6)).to eq(4)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_cototient(7)).to eq(1)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_cototient(8)).to eq(4)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_cototient(9)).to eq(3)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_cototient(10)).to eq(6)
          end
        end
      end  # end: {func{nᵗʰ_cototient}}

      context 'hybrid tests', :integration do
        context 'for funcs{nᵗʰ_euler_totient, nᵗʰ_cototient}' do
          it 'manual formula calculation works w/ selected input-value{10}' do
            euler_totient = 0
            [1, 2, 3, 4, 5, 6, 7, 8, 9].each do |n|
              if ::Math::NumberTheory::ℕ².coprime?(n, 10)
                euler_totient += 1
              end
            end
            expect(euler_totient).to eq(4)
            expect(::Math::NumberTheory::𝕎¹.nᵗʰ_cototient(10)).to eq(10 - euler_totient)
          end
        end
      end

    end # end: {𝕎¹}

  end

end
