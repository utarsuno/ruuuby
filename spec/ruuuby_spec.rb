# coding: utf-8

RSpec.describe Ruuuby do

  context 'Ruuuby added as module' do
    it 'exists' do
      expect(defined?(::Ruuuby)).to eq('constant')
      expect(::Ruuuby.is_a?(Module)).to eq(true)
    end

    context 'adding needed functionality' do
      context 'adds function: ∃module?' do
        context 'handling needed scenarios' do
          it 'for cases: global, true-positive' do
            expect(::Ruuuby.∃module?(:Ruuuby)).to eq(true)
            expect(::Ruuuby.∃module?('Ruuuby')).to eq(true)
            expect(::Ruuuby.∃module?(:VERSION, Ruuuby)).to eq(true)
          end
          it 'for cases: sub_module, true-positive' do
            expect(::Ruuuby.∃module?(:VERSION, Ruuuby)).to eq(true)
          end
          it 'for cases: global, false-positive' do
            expect(::Ruuuby.∃module?(:BigDecimal)).to eq(false)
            expect(::Ruuuby.∃module?('BigDecimal')).to eq(false)
          end
          it 'for cases: sub_module, false-positive' do
            expect(::Ruuuby.∃module?(:VERSIONFAKE, Ruuuby)).to eq(false)
          end
          it 'for cases: global, true-negative' do
            expect(::Ruuuby.∃module?(:RuuubyFake)).to eq(false)
            expect(::Ruuuby.∃module?('RuuubyFake')).to eq(false)
          end
        end
      end

      context 'adds function: ∃class?' do
        context 'handling needed scenarios' do
          it 'for cases: true-positive' do
            expect(::Ruuuby.∃class?(:BigDecimal)).to eq(true)
            expect(::Ruuuby.∃class?('BigDecimal')).to eq(true)
          end
          it 'for cases: false-positive' do
            expect(::Ruuuby.∃class?(:Ruuuby)).to eq(false)
            expect(::Ruuuby.∃class?('Ruuuby')).to eq(false)
          end
          it 'for cases: true-negative' do
            expect(::Ruuuby.∃class?(:BigDecimalFake)).to eq(false)
            expect(::Ruuuby.∃class?('BigDecimalFake')).to eq(false)
          end
        end
      end

    end
  end

  #  __   ___  __   ___  __   __                   __   ___
  # |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
  # |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
  context 'performance', :'performance' do

    context 'func[∃class?] runs fast enough' do
      it 'for cases: true-positive' do
        expect{::Ruuuby.∃class?(:BigDecimal)}.to perform_very_quickly
      end
      it 'for cases: true-negative' do
        expect{::Ruuuby.∃class?(:BigDecimalFake)}.to perform_very_quickly
      end
    end

    context 'func[∃module?] runs fast enough' do
      it 'for cases: true-positive' do
        expect{::Ruuuby.∃module?(:Ruuuby)}.to perform_very_quickly
      end
      it 'for cases: true-negative' do
        expect{::Ruuuby.∃module?(:RuuubyFake)}.to perform_very_quickly
      end
    end

  end

end
