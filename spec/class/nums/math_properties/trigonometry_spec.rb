# coding: UTF-8

RSpec.describe 'trigonometry' do

  context 'f17' do

    context 'trigonometry global funcs get added to main' do

      context 'math functions' do

        context 'func{sin}' do
          it 'aliases{Math.sin}' do
            expect(sin(θ°(90.0))).to eq(1)
            expect(sin(θ°(180.0))).to eq(Math.sin(θ°(180.0).ʳ))
            expect(sin(θ°(270.0))).to eq(-1)
            expect(sin(θ°(360.0))).to eq(Math.sin(θ°(360.0).ʳ))
          end
          it 'provides utility-alternative{sin°}' do
            #expect(sin°(30.0)).to eq(0.5)
            expect(sin°(90.0)).to eq(1)
            expect(sin°(180.0)).to eq(Math.sin(θ°(180.0).ʳ))
            expect(sin°(270.0)).to eq(-1)
            expect(sin°(360.0)).to eq(Math.sin(θ°(360.0).ʳ))
          end
        end

        context 'func{cos}' do
          it 'aliases{Math.cos}' do
            expect(cos(θ°(90.0))).to eq(Math.cos(θ°(90.0).ʳ))
            expect(cos(θ°(180.0))).to eq(-1)
            expect(cos(θ°(270.0))).to eq(Math.cos(θ°(270.0).ʳ))
            expect(cos(θ°(360.0))).to eq(1)
          end
          it 'provides utility-alternative{cos°}' do
            expect(cos°(90.0)).to eq(Math.cos(θ°(90.0).ʳ))
            expect(cos°(180.0)).to eq(-1)
            expect(cos°(270.0)).to eq(Math.cos(θ°(270.0).ʳ))
            expect(cos°(360.0)).to eq(1)
          end
        end

        context 'func{tan}' do
          it 'aliases{Math.tan}' do
            data_unit_circle_points.∀ {|degrees, as_radians, as_flt| expect(tan(θ°(degrees))).to eq(sin°(degrees)/cos°(degrees))}
          end
          it 'provides utility-alternative{tan°}' do
            data_unit_circle_points.∀ {|degrees, as_radians, as_flt| expect(tan°(degrees)).to eq(sin°(degrees)/cos°(degrees))}
          end
        end

      end

    end

  end

end
