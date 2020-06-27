# coding: UTF-8

RSpec.describe 'f35_db_orm' do

  context 'db_orm', :db do

    context 'defines{f35}' do
      it 'passes ORM audit' do
        audit_feature(f35, 'f35', 4, 'abstract `Statistics`; offering static math functions')
      end

      context 'defines behaviors' do
        it 'defines{b00}' do
          audit_feature_behavior(f35, f35_b00, 'b00', 'offer categorical abstractions w/ module{`Descriptive`}')
        end

        it 'defines{b01}' do
          audit_feature_behavior(f35, f35_b01, 'b01', 'offer categorical abstractions w/ module{`Probability`}')
        end

        it 'defines{b02}' do
          audit_feature_behavior(f35, f35_b02, 'b02', 'offer categorical abstractions w/ module{`StatisticalLearning`}')
        end

        it 'defines{b03}' do
          audit_feature_behavior(f35, f35_b03, 'b03', 'offer categorical abstractions w/ module{`TimeSeries`}')
        end

      end # end: {defines behaviors}

    end # end: {defines{f35}}

  end

end
