# coding: utf-8

RSpec.describe 'db/db.rb' do

  context 'db', :db do

    context 'defines expected schemas' do

      context 'tables found are as defined' do
        let(:db_tables){💎.orm.get_connection_base.tables}
        let(:needed_tables){💎.orm.get_table_names}

        it 'for needed tables' do
          expect(💎.orm.get_connection_schema.tables).to eq(💎.orm.get_connection_base.tables)
          expect(💎.orm.get_connection_schema.tables).to eq(💎.orm.get_connection_base.tables)

          needed_tables.∀ do |needed_table|
            expect(db_tables.∋?(needed_table)).to eq(true)
          end
        end

        it 'for the additional table created by libraries (not SQLite3)' do
          expect(db_tables.∋?('ar_internal_metadata')).to eq(true)
        end

        it 'w/o any additional (un-expected) tables' do
          expect(db_tables.length - 1).to eq(💎.orm_meta::ALL_ORM_SCHEMAS.length)
        end

      end

    end

  end

  #                   __          ___     __
  #   /\     |  |    |  \    |     |     /__`
  #  /~~\    \__/    |__/    |     |     .__/
  context 'audits', :audits do

    context 'has correct db configs' do
      context 'has correct directory structure' do
        context 'directory{db}' do
          it 'exists' do
            expect(🗄️.∃?('./db')).to eq(true)
          end
          context 'directory{db/seeds}' do
            it 'exists' do
              expect(🗄️.∃?('./db/seeds')).to eq(true)
            end
          end
        end
        it 'directory{db/migrate} exists' do
          expect(🗄️.∃?('./db/migrate')).to eq(true)
          expect(📁.∃?('./db/migrate.rb')).to eq(false)
        end
      end
    end

  end

end
