# encoding: UTF-8

RSpec.describe 'f31_db_orm' do
  context 'db_orm', :db do

    context 'defines{f31}' do
      it 'passes ORM audit' do
        audit_feature(f31, 'f31', 2, 'provide an `API` for `GIT` operations w/ a light layer over gem{`rugged`}')
      end

      context 'defines behaviors' do
        context '{b00}' do
          it 'w/ passing audits' do
            audit_feature_behavior(f31, f31_b00, 'b00', 'offers an abstraction over the `Rugged` gem')
          end
        end

        it 'defines{b01}' do
          audit_feature_behavior(f31, f31_b01, 'b01', 'offers health checks for current local dev state')
        end

      end # end: {defines behaviors}

    end # end: {defines{f31}}
  end
end
