# coding: UTF-8

RSpec.describe 'f26_db' do

  context 'db', :db do
    context 'defines f26' do
      it 'passes ORM audit' do
        audit_feature(f26, 'f26', 'enable more simple syntax parsing for `ISO8601` and other time operations')
      end

      context 'defines behaviors' do
        it 'has correct number of behaviors{1}' do
          expect(f26.ruuuby_feature_behaviors.length).to eq(1)
        end

        it 'has{b00}' do
          audit_feature_behavior(f26, f26_b00, 'b00', 'offer Class aliases: {`📅` -> `Date`}, {`🕒` -> `Time`}, {`📅🕒` -> `DateTime`}')
        end

      end

    end
  end

end
