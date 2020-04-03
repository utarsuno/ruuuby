# coding: utf-8

RSpec.describe 'db/db.rb' do

  context 'db', :'db' do

    context 'defines expected schemas' do

      it 'has needed tables' do
        expect(RuuubyDBSchema.get_connection_schema.tables).to eq(RuuubyDBSchema.get_connection_base.tables)
        db_tables = RuuubyDBSchema.get_connection_base.tables
        RuuubyDBSchema::Tables::ALL.∀ do |needed_table|
          expect(db_tables.∋?(needed_table)).to eq(true)
        end
      end

    end

  end

end
