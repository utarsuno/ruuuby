# coding: UTF-8

RSpec.describe 'f28' do

  context 'db', :db do

    context 'defines f28' do

      it 'passes ORM audit' do
        audit_feature(f28, 'f28', 'formally support various math constants & equations (ex: aliasing the golden-ratio w/ (`𝚽`)')
      end

      context 'defines behaviors' do
        it 'has correct number of behaviors{13}' do
          expect(f28.ruuuby_feature_behaviors.length).to eq(13)
        end

        context 'float aliases' do
          it 'has b02' do
            audit_feature_behavior(f28, f28_b02, 'b02', 'alias float constant{℮}')
          end
          it 'has b03' do
            audit_feature_behavior(f28, f28_b03, 'b03', 'alias float constant{π}, pie')
          end
          it 'has b04' do
            audit_feature_behavior(f28, f28_b04, 'b04', 'alias float constant{∞}, infinity')
          end
        end
        context 'created floats' do
          it 'has b00' do
            audit_feature_behavior(f28, f28_b00, 'b00', 'create float constant{𝚽}, golden-angle')
          end
          it 'has b01' do
            audit_feature_behavior(f28, f28_b01, 'b01', 'create float constant{Ψ}, super-golden-ratio')
          end
          it 'has b05' do
            audit_feature_behavior(f28, f28_b05, 'b05', 'create float constant{δ}, silver-ratio')
          end
          it 'has b06' do
            audit_feature_behavior(f28, f28_b06, 'b06', 'create float constant{ρ}, plastic-ratio')
          end
          it 'has b007' do
            audit_feature_behavior(f28, f28_b07, 'b07', 'create float constant{Ω}, omega-constant')
          end
          it 'has b08' do
            audit_feature_behavior(f28, f28_b08, 'b08', 'create float constant{γ}, euler mascheroni constant')
          end
          it 'has b09' do
            audit_feature_behavior(f28, f28_b09, 'b09', 'create float constants for unicode characters representing rationals')
          end
        end
        context 'created theta angles' do
          it 'has b10' do
            audit_feature_behavior(f28, f28_b10, 'b10', 'create ThetaAngle constant{𝞽}, tau')
          end
          it 'has b11' do
            audit_feature_behavior(f28, f28_b11, 'b11', 'create ThetaAngle constant{Ⴔ}, golden angle')
          end
        end
        context 'misc constants' do
          it 'has b12' do
            audit_feature_behavior(f28, f28_b12, 'b12', 'create or extend a `numeric` in order to properly support `Complex Infinity`')
          end
        end
      end # end: {defines behaviors}

    end

  end

end
