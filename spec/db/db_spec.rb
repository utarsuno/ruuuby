# encoding: utf-8

RSpec.describe 'db/db.rb' do

  context 'db', :db do
    context 'defines expected schemas' do

      context 'tables found are as defined' do
        let(:db_tables){💎.engine.orm.db_orm.connection.tables}

        it 'for needed tables' do
          💎.engine.orm.expected_tables[:orm].∀{|table_name| expect(db_tables.∋?(table_name)).to eq(true)}
        end

        it 'for the additional table created by libraries (not SQLite3)' do
          expect(db_tables.∋?('ar_internal_metadata')).to eq(true)
        end

        it 'w/o any additional (un-expected) tables' do
          num_tables_generated_by_external_libs = 💎.engine.orm.expected_tables[:application_record].length
          num_tables_generated_by_orm           = 💎.engine.orm.expected_tables[:orm].length
          expect(num_tables_generated_by_external_libs).to eq(1)
          expect(db_tables.length - num_tables_generated_by_external_libs).to eq(num_tables_generated_by_orm)
        end
      end

    end
  end
end
