# encoding: UTF-8

RSpec.describe 'f34_db_orm' do

  context 'db_orm', :db do

    context 'defines{f34}' do
      it 'passes ORM audit' do
        audit_feature(f34, 'f34', 5, 'abstract `Geometry`; offering static math functions; esp. those for `Shapes`')
      end

      context 'defines behaviors' do
        it 'defines{b00}' do
          audit_feature_behavior(f34, f34_b00, 'b00', 'offer basic abstractions to `Shape`')
        end

        it 'defines{b01}' do
          audit_feature_behavior(f34, f34_b01, 'b01', 'offer basic abstractions to `Shape::PlaneFigure`')
        end

        it 'defines{b02}' do
          audit_feature_behavior(f34, f34_b02, 'b02', 'offer basic abstractions to `Shape::Triangle`')
        end

        it 'defines{b03}' do
          audit_feature_behavior(f34, f34_b03, 'b03', 'offer basic abstractions to `Shape::Quadrilateral`')
        end

        it 'defines{b04}' do
          audit_feature_behavior(f34, f34_b04, 'b04', 'offer basic abstractions to `Shape::Circle`')
        end

      end # end: {defines behaviors}

    end # end: {defines{f34}}

  end

end
