# encoding: UTF-8

RSpec.describe 'f10_db_orm' do

  context 'db_orm', :db do
    context 'defines{f10}' do
      it 'passes ORM audit' do
        audit_feature(f10, 'f10', 8, 'offer special character aliases for natural ease of readability')
      end

      context 'defines behaviors' do
        it 'has{b00}' do
          audit_feature_behavior(f10, f10_b00, 'b00', 'for class{`Module`}, alias func{`private`} as `🙈` & func{`protected`} as{`🛡️`}')
        end

        it 'has{b01}' do
          audit_feature_behavior(f10, f10_b01, 'b01', 'provide global variables for certain ruby engine components (ex: `$git` instead of `💎.engine.api_locale.api_git`)')
        end

        it 'has{b02}' do
          audit_feature_behavior(f10, f10_b02, 'b02', 'part I/II  | for class{`Object`}, alias func{`object_id`} as{`🆔`}, func{`frozen`} as{`❄️`}, func{`frozen?`} as{`❄️?`}')
        end

        it 'has{b03}' do
          audit_feature_behavior(f10, f10_b03, 'b03', 'part II/II | for class{`Object`}, alias func{`class`} as{`ⓣ`} & provide utility func{`Ⓣ`} to get self-class as a String')
        end

        it 'has{b05}' do
          audit_feature_behavior(f10, f10_b05, 'b05', 'part I/III   | for class{`Kernel`}, alias func{`rand`} as{`🎲`} & func{`raise`} as{`🛑`}')
        end

        it 'has{b06}' do
          audit_feature_behavior(f10, f10_b06, 'b06', 'part II/III  | for class{`Kernel`}, alias `Math` funcs{`sqrt`, `cbrt`} w/ {`√`, `∛`}')
        end

        it 'has{b07}' do
          audit_feature_behavior(f10, f10_b07, 'b07', 'part III/III | for class{`Kernel`}, alias `Math` funcs{`log_e`, `log2`, `log10`} w/ {`logₑ`, `log₂`, `log₁₀`}')
        end

      end
    end
  end

end
