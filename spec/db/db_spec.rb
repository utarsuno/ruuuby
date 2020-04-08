# coding: utf-8

RSpec.describe 'db/db.rb' do

  context 'db', :'db' do

    context 'defines expected schemas' do

      it 'has needed tables' do
        expect(ruuuby_orm.get_connection_schema.tables).to eq(ruuuby_orm.get_connection_base.tables)

        db_tables = ruuuby_orm.get_connection_base.tables

        ruuuby_orm.get_table_names.∀ do |needed_table|
          expect(db_tables.∋?(needed_table)).to eq(true)
        end
      end

    end

  end

  #                   __          ___     __
  #   /\     |  |    |  \    |     |     /__`
  #  /~~\    \__/    |__/    |     |     .__/
  context 'audits', :'audits' do

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
