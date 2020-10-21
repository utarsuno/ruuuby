# encoding: UTF-8

RSpec.describe 'f27_db_orm' do

  context 'db_orm', :db do
    context 'defines f27' do
      it 'passes ORM audit' do
        audit_feature(f27, 'f27', 11, 'add new class (`ThetaAngle`) for easier operations involving angles')
      end
      context 'defines behaviors' do
        it 'has{b00}' do
          audit_feature_behavior(f27, f27_b00, 'b00', 'has additive identity{0} and multiplicative identity{1}')
        end

        it 'has{b01}' do
          audit_feature_behavior(f27, f27_b01, 'b01', 'preserves precision across math operations as best as possible')
        end

        it 'has{b02}' do
          audit_feature_behavior(f27, f27_b02, 'b02', 'each ThetaAngle representation has a corresponding static function which calls the needed constructor')
        end

        it 'has{b03}' do
          audit_feature_behavior(f27, f27_b03, 'b03', 'vocabulary functions involving 2 ThetaAngle are provided in module {ThetaAngle::Pair}')
        end

        it 'has{b04}' do
          audit_feature_behavior(f27, f27_b04, 'b04', 'vocabulary functions involving 1 ThetaAngle are provided as funcs')
        end

        it 'has{b05}' do
          audit_feature_behavior(f27, f27_b05, 'b05', 'offer `Refinement` w/ module{ThetaAngle::ContextStr} for parsing `String` objs into `ThetaAngleAngle` objs')
        end

        it 'has{b06}' do
          audit_feature_behavior(f27, f27_b06, 'b06', 'implements `Comparable`')
        end

        it 'has{b07}' do
          audit_feature_behavior(f27, f27_b07, 'b07', 'offers functionality for `normalization`')
        end

        it 'has{b08}' do
          audit_feature_behavior(f27, f27_b08, 'b08', 'offers unary operators')
        end

        it 'has{b09}' do
          audit_feature_behavior(f27, f27_b09, 'b09', 'offers math operators')
        end

        it 'has{b10}' do
          audit_feature_behavior(f27, f27_b10, 'b10', 'offer `Refinement` w/ module{`ThetaAngle::ContextParamCheck`} for providing `f06` but for context of this feature')
        end
      end
    end
  end

end
