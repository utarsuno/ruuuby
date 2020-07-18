# encoding: UTF-8

using ::ThetaAngle::ContextRuuuby

RSpec.describe 'f27_b00' do

  context 'functionality' do

    context 'additive identity{0}' do

      context 'w/ func{-@}' do
        it '°' do
          expect(-θ°(0) - 0).to eq(θ°(0))
          expect(-θ°(0) + 0).to eq(θ°(0))
          expect(-0.0 + (-θ°(0))).to eq(θ°(0))
          expect(0.0 + (-θ°(0))).to eq(θ°(0))
          expect(-0.0 + (θ°(0))).to eq(θ°(0))
        end
        it '𝞽' do
          expect(-θ𝞽(0) - 0).to eq(θ𝞽(0))
          expect(-θ𝞽(0) + 0).to eq(θ𝞽(0))
          expect(-0.0 + (-θ𝞽(0))).to eq(θ𝞽(0))
          expect(0.0 + (-θ𝞽(0))).to eq(θ𝞽(0))
          expect(-0.0 + (θ𝞽(0))).to eq(θ𝞽(0))
        end
        it 'ᵍ' do
          expect(-θᵍ(0) - 0).to eq(θᵍ(0))
          expect(-θᵍ(0) + 0).to eq(θᵍ(0))
          expect(-0.0 + (-θᵍ(0))).to eq(θᵍ(0))
          expect(0.0 + (-θᵍ(0))).to eq(θᵍ(0))
          expect(-0.0 + (θᵍ(0))).to eq(θᵍ(0))
        end
        it 'ʳ' do
          expect(-θʳ(0) - 0).to eq(θʳ(0))
          expect(-θʳ(0) + 0).to eq(θʳ(0))
          expect(-0.0 + (-θʳ(0))).to eq(θʳ(0))
          expect(0.0 + (-θʳ(0))).to eq(θʳ(0))
          expect(-0.0 + (θʳ(0))).to eq(θʳ(0))
        end
      end

      context 'w/ func{+@}' do
        it '°' do
          expect(+θ°(1337)+θ°(0)).to eq(+θ°(1337))
          expect(+θ°(0)+θ°(1337)).to eq(+θ°(1337))
          expect(+θ°(0)++θ°(0)).to eq(+θ°(0))
          expect(θ°(0)++θ°(0)).to eq(+θ°(0))

          expect(θ°(-0)+θ°(0)).to eq(+θ°(0))
          expect(θ°(0)+θ°(-0)).to eq(+θ°(0))
          expect(θ°(-0)+θ°(-0)).to eq(+θ°(0))
        end
        it '𝞽' do
          expect(+θ𝞽(1)+θ𝞽(0)).to eq(+θ𝞽(1))
          expect(+θ𝞽(0)+θ𝞽(1)).to eq(+θ𝞽(1))
          expect(+θ𝞽(0)++θ𝞽(0)).to eq(+θ𝞽(0))
          expect(θ𝞽(0)++θ𝞽(0)).to eq(+θ𝞽(0))

          expect(θ𝞽(-0)+θ𝞽(0)).to eq(+θ𝞽(0))
          expect(θ𝞽(0)+θ𝞽(-0)).to eq(+θ𝞽(0))
          expect(θ𝞽(-0)+θ𝞽(-0)).to eq(+θ𝞽(0))
        end
        it 'ᵍ' do
          expect(+θᵍ(1)+θᵍ(0)).to eq(+θᵍ(1))
          expect(+θᵍ(0)+θᵍ(1)).to eq(+θᵍ(1))
          expect(+θᵍ(0)++θᵍ(0)).to eq(+θᵍ(0))
          expect(θᵍ(0)++θᵍ(0)).to eq(+θᵍ(0))

          expect(θᵍ(-0)+θᵍ(0)).to eq(+θᵍ(0))
          expect(θᵍ(0)+θᵍ(-0)).to eq(+θᵍ(0))
          expect(θᵍ(-0)+θᵍ(-0)).to eq(+θᵍ(0))
        end
        it 'ʳ' do
          expect(+θʳ(1)+θʳ(0)).to eq(+θʳ(1))
          expect(+θʳ(0)+θʳ(1)).to eq(+θʳ(1))
          expect(+θʳ(0)++θʳ(0)).to eq(+θʳ(0))
          expect(θʳ(0)++θʳ(0)).to eq(+θʳ(0))

          expect(θʳ(-0)+θʳ(0)).to eq(+θʳ(0))
          expect(θʳ(0)+θʳ(-0)).to eq(+θʳ(0))
          expect(θʳ(-0)+θʳ(-0)).to eq(+θʳ(0))
        end
      end

    end # end: {additive identity{0}}

    context 'multiplicative identity{1}' do
      it '°' do
        expect(θ°(1337) * θ°(1)).to eq(θ°(1337))
        expect(θ°(1337) * 1).to eq(θ°(1337))
        expect(θ°(1) * θ°(1337)).to eq(θ°(1337))
        expect(θ°(1) * 1337).to eq(θ°(1337))
        expect(1337 * θ°(1)).to eq(θ°(1337))
        expect(1 * θ°(1337)).to eq(θ°(1337))
      end

      it '𝞽' do
        expect(θ𝞽(1337) * θ𝞽(1)).to eq(θ𝞽(1337))
        expect(θ𝞽(1337) * 1).to eq(θ𝞽(1337))
        expect(θ𝞽(1) * θ𝞽(1337)).to eq(θ𝞽(1337))
        expect(θ𝞽(1) * 1337).to eq(θ𝞽(1337))
        expect(1337 * θ𝞽(1)).to eq(θ𝞽(1337))
        expect(1 * θ𝞽(1337)).to eq(θ𝞽(1337))
      end

      it 'ᵍ' do
        expect(θᵍ(1337) * θᵍ(1)).to eq(θᵍ(1337))
        expect(θᵍ(1337) * 1).to eq(θᵍ(1337))
        expect(θᵍ(1) * θᵍ(1337)).to eq(θᵍ(1337))
        expect(θᵍ(1) * 1337).to eq(θᵍ(1337))
        expect(1337 * θᵍ(1)).to eq(θᵍ(1337))
        expect(1 * θᵍ(1337)).to eq(θᵍ(1337))
      end

      it 'ʳ' do
        expect(θʳ(1337) * θʳ(1)).to eq(θʳ(1337))
        expect(θʳ(1337) * 1).to eq(θʳ(1337))
        expect(θʳ(1) * θʳ(1337)).to eq(θʳ(1337))
        expect(θʳ(1) * 1337).to eq(θʳ(1337))
        expect(1337 * θʳ(1)).to eq(θʳ(1337))
        expect(1 * θʳ(1337)).to eq(θʳ(1337))
      end
    end # end: {multiplicative identity{1}}

    # ==================================================================================================================
    #  __                               __                                       ___            __
    # /\ \                             /\ \__                                   /\_ \          /\ \
    # \ \/      ___ ___     ___     ___\ \ ,_\    __         ___     __     _ __\//\ \     ___ \ \/
    #  \/     /' __` __`\  / __`\ /' _ `\ \ \/  /'__`\      /'___\ /'__`\  /\`'__\\ \ \   / __`\\/
    #         /\ \/\ \/\ \/\ \L\ \/\ \/\ \ \ \_/\  __/     /\ \__//\ \L\.\_\ \ \/  \_\ \_/\ \L\ \
    #         \ \_\ \_\ \_\ \____/\ \_\ \_\ \__\ \____\    \ \____\ \__/.\_\\ \_\  /\____\ \____/
    #          \/_/\/_/\/_/\/___/  \/_/\/_/\/__/\/____/     \/____/\/__/\/_/ \/_/  \/____/\/___/
    # ==================================================================================================================

    context 'both identities in larger equation' do
      it '1 + 0 * 1 + 1 == 2' do
        expect(θ°(1) + 0 * 1 + θ°(1)).to eq(θ°(2))
      end
      it '1 + 1 + 1 * 0 == 2' do
        expect(1 + θ°(1) + 1 * 0).to eq(θ°(2))
      end
    end

  end

end
