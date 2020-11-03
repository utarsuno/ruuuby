# encoding: UTF-8

RSpec.describe 'docker_service_postgres' do
  let(:service_name){'service_postgres'}

  context 'system tests for docker-service{postgres}', :system do

    before :each do
      expect(🐋.connected?).to eq(true)
      expect(🐋.∃🌐?('ruuuby_network')).to eq(true)
      expect(🐋.∃🐋?(service_name)).to eq(true)
    end

    it 'can find the container{service_postgres}, matching against expected versions & configs' do
      container_postgres = audit_container(service_name, false, 'alpine', '3.12.0')

      expect(container_postgres.cmd!(%w(postgres --version))).to eq("postgres (PostgreSQL) 13beta3")

      env_vars = container_postgres.env_vars
      expect(env_vars['PGDATA']).to eq('/var/lib/postgresql/data')
      expect(env_vars['LANG']).to eq('en_US.utf8')
      expect(env_vars['PG_MAJOR']).to eq('13')
      expect(env_vars['PG_VERSION']).to eq('13beta3')
      expect(env_vars['PG_SHA256']).to eq('863e33ee9d1099e2a0f1cab6dbd015789b2c2af75cfbad814a3acdf7c8eeaf9d')
    end

    context 'expected configs' do
      it 'for db engine' do
        expect(ENV.∃?('RUUUBY_F92')).to eq(true)
        expect(ENV['RUUUBY_F92'].include?('b01')).to eq(true)
        expect(ENV['RUUUBY_F92'].include?('b02')).to eq(true)
        db = 💎.engine.orm.db_orm.connection

        expect(db.supports_advisory_locks?).to eq(true)
        expect(db.supports_bulk_alter?).to eq(true)
        expect(db.supports_comments?).to eq(true)
        expect(db.supports_comments_in_create?).to eq(false)
        expect(db.supports_common_table_expressions?).to eq(true)
        expect(db.supports_datetime_with_precision?).to eq(true)

        expect(db.supports_ddl_transactions?).to eq(true)
        expect(db.supports_explain?).to eq(true)
        expect(db.supports_expression_index?).to eq(true)
        expect(db.supports_extensions?).to eq(true)
        expect(db.supports_foreign_keys?).to eq(true)
        expect(db.supports_foreign_tables?).to eq(true)
        expect(db.supports_index_sort_order?).to eq(true)
        expect(db.supports_indexes_in_create?).to eq(false)
        expect(db.supports_insert_conflict_target?).to eq(true)
        expect(db.supports_insert_on_conflict?).to eq(true)
        expect(db.supports_insert_on_duplicate_skip?).to eq(true)
        expect(db.supports_insert_on_duplicate_update?).to eq(true)
        expect(db.supports_insert_returning?).to eq(true)
        expect(db.supports_json?).to eq(true)
        expect(db.supports_lazy_transactions?).to eq(true)
        expect(db.supports_materialized_views?).to eq(true)
        expect(db.supports_partial_index?).to eq(true)
        expect(db.supports_partitioned_indexes?).to eq(true)
        expect(db.supports_pgcrypto_uuid?).to eq(true)
        expect(db.supports_validate_constraints?).to eq(true)
        expect(db.supports_views?).to eq(true)
        expect(db.supports_virtual_columns?).to eq(false)
      end
    end
  end
end
