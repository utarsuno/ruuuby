# coding: UTF-8

RSpec.describe 'f26_db_orm' do

  context 'db_orm', :db do
    context 'defines{f26}' do
      it 'passes ORM audit' do
        audit_feature(f26, 'f26', 1, 'enable more simple syntax parsing for `ISO8601` and other time operations')
      end

      context 'defines behaviors' do
        it 'has{b00}' do
          audit_feature_behavior(f26, f26_b00, 'b00', 'offer Class aliases: {`📅` -> `Date`}, {`🕒` -> `Time`}, {`📅🕒` -> `DateTime`}')
        end
      end
    end
  end

end
