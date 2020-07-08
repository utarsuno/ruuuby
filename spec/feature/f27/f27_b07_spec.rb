# coding: UTF-8

RSpec.describe 'f27_b07' do

  context 'functionality for {f27_b07}' do

    context 'normalization' do
      context 'func{normal?}' do
        context 'handles needed scenarios' do
          it 'cases: positive' do
            [-360, -359, -100, -1, 0, 1, 100, 359, 360.0].∀{|scenario| expect(θ°(scenario).normal?).to eq(true)}
            [-1, -0.99, -0.01, 0, 0.01, 0.5, 0.99, 1].∀{|scenario| expect(θ𝞽(scenario).normal?).to eq(true)}
            [-400, -399.0, -100, -1, 0, 1, 1.5, 399, 400].∀{|scenario| expect(θᵍ(scenario).normal?).to eq(true)}
            [-2.0 * π, (2.0 * π) * 0.99, -0.1, 0, 0.1, (2.0 * π) * 0.99, 2.0 * π].∀{|scenario| expect(θʳ(scenario).normal?).to eq(true)}
          end
          it 'cases: negative' do
            [-10000, -361, 361, 10000].∀{|scenario| expect(θ°(scenario).normal?).to eq(false)}
            [-10000, -1.01, 1.01, 10000].∀{|scenario| expect(θ𝞽(scenario).normal?).to eq(false)}
            [-10000, -401, 401, 10000].∀{|scenario| expect(θᵍ(scenario).normal?).to eq(false)}
            [-10000, (-2.0 * π) - 0.1, (2.0 * π) + 0.1, 10000].∀{|scenario| expect(θʳ(scenario).normal?).to eq(false)}
          end
        end
      end # end: {normal?}
      context 'func{normalize}' do
        context 'handles needed scenarios' do
          it 'generates new object (with new object_id)' do
            angle    = θ°(370)
            angle_id = angle.🆔
            angle2   = angle.normalize
            expect(angle.real).to eq(370.0)
            expect(angle2.real).to eq(10)
            expect(angle.repr).to eq(4)
            expect(angle_id).to eq(angle.🆔)
            expect(angle_id).to_not eq(angle2.🆔)
            expect(angle.ⓣ).to eq(::ThetaAngle)
            expect(angle2.ⓣ).to eq(::ThetaAngle)
          end
        end
      end # end: {func{normalize!}}
      context 'func{normalize!}' do
        context 'cases: positive' do
          it 'keeps object_id' do
            angle    = θ°(370)
            angle_id = angle.🆔
            angle2   = angle.normalize!
            expect(angle.real).to eq(10.0)
            expect(angle.repr).to eq(4)
            expect(angle_id).to eq(angle.🆔)
            expect(angle_id).to eq(angle2.🆔)
            expect(angle.ⓣ).to eq(::ThetaAngle)
            expect(angle2.ⓣ).to eq(::ThetaAngle)
          end
          it 'θ°' do
            [0, -1.1, 1.1, -359, 359, -360, 360].∀{|scenario| expect(θ°(scenario).normalize!).to eq(scenario)}
            expect(θ°(390).normalize!).to eq(30)
            expect(θ°(2560).normalize!).to eq(40)
            expect(θ°(-30).normalize!).to eq(-30)
            expect(θ°(-400).normalize!).to eq(-40)
          end
          it 'θᵍ' do
            [0, -1.1, 1.1, -399, 399, -400, 400].∀{|scenario| expect(θᵍ(scenario).normalize!).to eq(scenario)}
            expect(θᵍ(444).normalize!).to eq(44)
            expect(θᵍ(15337).normalize!).to eq(137)
            expect(θᵍ(-401).normalize!).to eq(-1)
            expect(θᵍ(-900).normalize!).to eq(-100)
          end
          it 'θ𝞽' do
            [0, -0.1, 0.1, -1.0, 0.1].∀{|scenario| expect(θ𝞽(scenario).normalize!).to eq(scenario)}
            expect(θ𝞽(-2.0).normalize!.to_f).to eq(-0.0)
            expect(θ𝞽(-9.5).normalize!.to_f).to eq(-0.5)
            expect(θ𝞽(3.0).normalize!.to_f).to eq(0.0)
            expect(θ𝞽(9.5).normalize!.to_f).to eq(0.5)
          end
          it 'θʳ' do
            [0, -0.1, 0.1, -2.0 * π, 2.0 * π].∀{|scenario| expect(θʳ(scenario).normalize!).to eq(scenario)}
            expect(θʳ(-2.0 * π).normalize!).to eq(-2.0 * π)
            expect(θʳ(2.0 * π).normalize!).to eq(2.0 * π)
            expect(θʳ(-3.0 * π).normalize!).to eq(-1.0 * π)
            expect(θʳ(5.0 * π).normalize!).to eq(1.0 * π)
          end
        end
      end # end: {func{normalize!}}
    end # end: {normalization}

  end

  context 'audits', :audit do
    context '{f27_b07}' do
      context 'class{ThetaAngle} is defined as needed' do
        it 'w/ needed funcs' do
          expect_∃⨍_with_alias(:normalize!, :η̂!, ::ThetaAngle)
          expect_∃⨍_with_alias(:normalize, :η̂, ::ThetaAngle)
          expect_∃⨍_with_alias(:normal?, :η̂?, ::ThetaAngle)
        end
      end
    end
  end # end: {audits}

end
