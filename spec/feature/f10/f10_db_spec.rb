# coding: UTF-8

RSpec.describe 'f10_db' do

  context 'db', :db do
    context 'defines{f10}' do
      it 'passes ORM audit' do
        audit_feature(f10, 'f10', 'offer special character aliases for natural ease of readability')
      end

      context 'defines behaviors' do
        it 'has correct number of behaviors{6}' do
          expect(f10.ruuuby_feature_behaviors.length).to eq(6)
        end

        it 'has{b00}' do
          audit_feature_behavior(f10, f10_b00, 'b00', '`🙈` to alias `private`')
        end

        it 'has{b01}' do
          audit_feature_behavior(f10, f10_b01, 'b01', '`🛡️` to alias `protected`')
        end

        it 'has{b02}' do
          audit_feature_behavior(f10, f10_b02, 'b02', '`🆕` to alias `new`')
        end

        it 'has{b03}' do
          audit_feature_behavior(f10, f10_b03, 'b03', '`🌽` to alias `::Kernel`')
        end

        it 'has{b04}' do
          audit_feature_behavior(f10, f10_b04, 'b04', 'alias `Math` funcs{`sqrt`, `cbrt`} w/ {`√`, `∛`}')
        end

        it 'has{b05}' do
          audit_feature_behavior(f10, f10_b05, 'b05', 'alias `Math` funcs{`log_e`, `log2`, `log10`} w/ {`logₑ`, `log₂`, `log₁₀`}')
        end

      end
    end
  end

end
