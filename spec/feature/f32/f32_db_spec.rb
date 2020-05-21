# coding: UTF-8

RSpec.describe 'f32_db' do

  context 'db', :db do

    context 'defines{f32}' do
      it 'passes ORM audit' do
        audit_feature(f32, 'f32', 'abstract `NumberTheory`; offering static math functions')
      end

      context 'defines behaviors' do
        it 'has correct number of behaviors{0}' do
          expect(f32.ruuuby_feature_behaviors.length).to eq(0)
        end

      end # end: {defines behaviors}

    end # end: {defines{f30}}

  end

end
