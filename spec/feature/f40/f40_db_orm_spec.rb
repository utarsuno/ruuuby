# encoding: UTF-8

RSpec.describe 'f40_db_orm' do
  context 'db_orm', :db do

    context 'defines{f40}' do
      it 'passes ORM audit' do
        audit_feature(f40, 'f40', 2, 'provide an `API` for `Docker` operations w/ a light layer over gem{`docker-api`}')
      end

      context 'defines behaviors' do
        context '{b00}' do
          it 'w/ passing audits' do
            audit_feature_behavior(f40, f40_b00, 'b00', 'offers an abstraction over the `docker-api` gem')
          end
        end

        it 'defines{b01}' do
          audit_feature_behavior(f40, f40_b01, 'b01', 'offers health checks for current local dev state')
        end

      end # end: {defines behaviors}

    end # end: {defines{f40}}
  end
end
