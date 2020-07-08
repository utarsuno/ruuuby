# coding: UTF-8

RSpec.describe 'Object' do
  let(:data_default){Object.🆕}

  before :all do
    class MockString < String; end
    class MockTrue < TrueClass; end
    class MockFalse < FalseClass; end
  end

  context 'creates Ruuuby aliases' do
    it '🆔 --> object_id' do
      expect(::Object.respond_to?(:🆔)).to eq(true)
      leet = 1337
      expect(leet.object_id == leet.🆔).to eq(true)
    end
    it '❄️ --> freeze' do
      leet = [999999, 'a']
      expect(leet.frozen?).to eq(false)
      leet.❄️
      expect(leet.frozen?).to eq(true)
    end
    it '❄️? --> frozen?' do
      leet = [999999, 'a']
      expect(leet.❄️?).to eq(false)
      leet.freeze
      expect(leet.❄️?).to eq(true)
    end
  end

  context 'extends class[Object]' do

    context 'by adding function{🛑θ❓}' do
      context 'handles needed input scenarios' do
        context 'cases: positive' do
          it 'w/ single param' do
            expect{🛑θ❓(:θ, θ°(360.0))}.to_not raise_error
            expect{🛑θ❓(:θ, θ°(360.0))}.to_not raise_error
          end
        end
        context 'cases: negative' do
          it 'w/ single param' do
            expect{🛑θ❓(:θ, nil)}.to raise_error(ArgumentError)
            expect{🛑θ❓(:θ, 360.0)}.to raise_error(ArgumentError)
          end
        end
      end
    end

    context 'function{θ?}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'w/ single param' do
            expect(θ°(0).θ?).to eq(true)
            expect(θᵍ(0).θ?).to eq(true)
            expect(θʳ(0).θ?).to eq(true)
            expect(θ𝞽(0).θ?).to eq(true)
          end
        end
        context 'cases: negative' do
          it 'w/ single param' do
            expect(0.θ?).to eq(false)
            expect(360.0.θ?).to eq(false)
            expect(Rational(::Math::PI, 2).θ?).to eq(false)
            expect(nil.θ?).to eq(false)
            expect(''.θ?).to eq(false)
          end
        end
      end
    end

  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :performance do

    context 'function{🛑θ❓}: performs extremely quickly' do
      context 'for needed scenarios' do
        context 'cases: positive' do
          it 'w/ single param' do
            the_angle = θ°(360.0)
            expect{🛑θ❓(:θ, the_angle)}.to perform_extremely_quickly
          end
        end
      end
    end

  end

end
