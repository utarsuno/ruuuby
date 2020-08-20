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

      os_release = container_postgres.cmd!(%w(cat /etc/os-release)).convert_to_json
      expect(os_release['PRETTY_NAME']).to eq("\"Alpine Linux v3.12\"")
      expect(os_release['NAME']).to eq("\"Alpine Linux\"")
      expect(os_release['VERSION_ID']).to eq("3.12.0")
      expect(os_release['ID']).to eq("alpine")
      expect(os_release['HOME_URL']).to eq("\"https://alpinelinux.org/\"")
      expect(os_release['BUG_REPORT_URL']).to eq("\"https://bugs.alpinelinux.org/\"")

      found_env_vars = container_postgres.env_vars
      expect(found_env_vars['PGDATA']).to eq('/var/lib/postgresql/data')
      expect(found_env_vars['LANG']).to eq('en_US.utf8')
      expect(found_env_vars['PG_MAJOR']).to eq('13')
      expect(found_env_vars['PG_VERSION']).to eq('13beta3')
      expect(found_env_vars['PG_SHA256']).to eq('863e33ee9d1099e2a0f1cab6dbd015789b2c2af75cfbad814a3acdf7c8eeaf9d')
    end

  end
end
