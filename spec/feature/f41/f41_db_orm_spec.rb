# encoding: UTF-8

RSpec.describe 'f41_db_orm' do
  context 'db_orm', :db do

    context 'defines{f41}' do
      it 'passes ORM audit' do
        audit_feature(f41, 'f41', 2, 'provide an `API` for `Brew` operations')
      end

      context 'defines behaviors' do

        it 'defines{b00}' do
          audit_feature_behavior(f41, f41_b00, 'b00', 'offers functionality wrappers for provided brew commands')
        end

        it 'defines{b01}' do
          audit_feature_behavior(f41, f41_b01, 'b01', 'offers health checks for current local dev state')
        end

      end # end: {defines behaviors}

    end # end: {defines{f41}}
  end
end
