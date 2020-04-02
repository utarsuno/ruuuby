
RSpec.describe 'trigonometry' do

  context 'f17' do

    context 'trigonometry global funcs get added to main' do

      context 'helper functions' do
        context 'adds function{∠ᶜ}' do
          it 'works' do
            data_unit_circle_points.∀ {|degrees, as_radians, as_flt| expect(∠ᶜ(degrees)).to eq(as_flt)}
          end
        end
        context 'adds function{∠ᶜ}' do
          it 'works' do
            data_unit_circle_points.∀ {|degrees, as_radians, as_flt| expect(∠°(as_radians)).to eq(degrees)}
          end
        end
      end

      context 'math functions' do

        context 'func{sin}' do
          it 'aliases{Math.sin}' do
            expect(sin(∠ᶜ(90.0))).to eq(1)
            expect(sin(∠ᶜ(180.0))).to eq(Math.sin(∠ᶜ(180.0)))
            expect(sin(∠ᶜ(270.0))).to eq(-1)
            expect(sin(∠ᶜ(360.0))).to eq(Math.sin(∠ᶜ(360.0)))
          end
          it 'provides utility-alternative{sin°}' do
            #expect(sin°(30.0)).to eq(0.5)
            expect(sin°(90.0)).to eq(1)
            expect(sin°(180.0)).to eq(Math.sin(∠ᶜ(180.0)))
            expect(sin°(270.0)).to eq(-1)
            expect(sin°(360.0)).to eq(Math.sin(∠ᶜ(360.0)))
          end
        end

        context 'func{cos}' do
          it 'aliases{Math.cos}' do
            expect(cos(∠ᶜ(90.0))).to eq(Math.cos(∠ᶜ(90.0)))
            expect(cos(∠ᶜ(180.0))).to eq(-1)
            expect(cos(∠ᶜ(270.0))).to eq(Math.cos(∠ᶜ(270.0)))
            expect(cos(∠ᶜ(360.0))).to eq(1)
          end
          it 'provides utility-alternative{cos°}' do
            expect(cos°(90.0)).to eq(Math.cos(∠ᶜ(90.0)))
            expect(cos°(180.0)).to eq(-1)
            expect(cos°(270.0)).to eq(Math.cos(∠ᶜ(270.0)))
            expect(cos°(360.0)).to eq(1)
          end
        end

        context 'func{tan}' do
          it 'aliases{Math.tan}' do
            data_unit_circle_points.∀ {|degrees, as_radians, as_flt| expect(tan(∠ᶜ(degrees))).to eq(sin°(degrees)/cos°(degrees))}
          end
          it 'provides utility-alternative{tan°}' do
            data_unit_circle_points.∀ {|degrees, as_radians, as_flt| expect(tan°(degrees)).to eq(sin°(degrees)/cos°(degrees))}
          end
        end

      end

    end

  end

end
