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

  end
end
