# coding: UTF-8

RSpec.describe 'f33_db' do

  context 'db', :db do

    context 'defines{f33}' do
      it 'passes ORM audit' do
        audit_feature(f33, 'f33', 'abstract `Combinatorics`; offering static math functions')
      end

      context 'defines behaviors' do
        it 'has correct number of behaviors{0}' do
          expect(f33.ruuuby_feature_behaviors.length).to eq(0)
        end

      end # end: {defines behaviors}

    end # end: {defines{f33}}

  end

end
