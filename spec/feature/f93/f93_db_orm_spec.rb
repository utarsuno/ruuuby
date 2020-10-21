# encoding: UTF-8

RSpec.describe 'f93_db_orm' do

  context 'db_orm', :db do
    context 'feature{f93}' do
      it 'passes ORM audit' do
        audit_feature(f93, 'f93', 0, 'offer help in managing custom scripts, functionality, and anything else needed for too niche of scenarios to consider adding as a feature or even a conditionally-loadable feature')
      end
    end
  end

end
