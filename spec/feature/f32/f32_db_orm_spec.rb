# encoding: UTF-8

RSpec.describe 'f32_db_orm' do

  context 'db_orm', :db do

    context 'defines{f32}' do
      it 'passes ORM audit' do
        audit_feature(f32, 'f32', 11, 'abstract `NumberTheory`; offering static math functions')
      end

      context 'defines behaviors' do
        it 'defines{b00}' do
          audit_feature_behavior(f32, f32_b00, 'b00', 'offers static funcs through module{ℕ¹}')
        end

        it 'defines{b01}' do
          audit_feature_behavior(f32, f32_b01, 'b01', 'offers static funcs through module{𝕎¹}')
        end

        it 'defines{b02}' do
          audit_feature_behavior(f32, f32_b02, 'b02', 'offers static funcs through module{ℕ²}')
        end

        it 'defines{b03}' do
          audit_feature_behavior(f32, f32_b03, 'b03', 'create Sequence{`Pronic`}')
        end

        it 'defines{b04}' do
          audit_feature_behavior(f32, f32_b04, 'b04', 'create Sequence{`Square`}')
        end

        it 'defines{b05}' do
          audit_feature_behavior(f32, f32_b05, 'b05', 'create Sequence{`Fibonacci`}')
        end

        it 'defines{b06}' do
          audit_feature_behavior(f32, f32_b06, 'b06', 'create Sequence{`Lucas`}')
        end

        it 'defines{b07}' do
          audit_feature_behavior(f32, f32_b07, 'b07', 'create Sequence{`Triangle`}')
        end

        it 'defines{b08}' do
          audit_feature_behavior(f32, f32_b08, 'b08', 'create Sequence{`Hexagonal`}')
        end

        it 'defines{b09}' do
          audit_feature_behavior(f32, f32_b09, 'b09', 'offers static funcs through module{ℤ³}')
        end

        it 'defines{b10}' do
          audit_feature_behavior(f32, f32_b10, 'b10', 'offers static funcs through module{ℤ²}')
        end

      end # end: {defines behaviors}

    end # end: {defines{f32}}

  end

end
