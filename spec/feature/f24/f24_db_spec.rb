# coding: UTF-8

RSpec.describe 'f24_db' do

  context 'db', :db do

    context 'defines{f24}' do

      it 'passes ORM audit' do
        audit_feature(f24, 'f24', "Class(String): add syntax parsing for snake-case and camel-case")
      end

      context 'defines behaviors' do
        it 'has correct number of behaviors{4}' do
          expect(f24.ruuuby_feature_behaviors.length).to eq(4)
        end

        it 'has{b00}' do
          audit_feature_behavior(f24, f24_b00, 'b00', 'syntax category{snake_case} aliased w/ {🐍}')
        end

        it 'has{b01}' do
          audit_feature_behavior(f24, f24_b01, 'b01', 'syntax category{snake_case_capital} aliased w/ {🐍⬆}')
        end

        it 'has{b02}' do
          audit_feature_behavior(f24, f24_b02, 'b02', 'syntax category{camel_case} aliased w/ {🐫}')
        end

        it 'has{b03}' do
          audit_feature_behavior(f24, f24_b03, 'b03', 'syntax category{camel_case_lower} aliased w/ {🐫⬇}')
        end

      end # end: {defines behaviors}

    end

  end

end
