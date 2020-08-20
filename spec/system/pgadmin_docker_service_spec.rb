# encoding: UTF-8

RSpec.describe 'docker_service_pgadmin' do
  let(:service_name){'service_pgadmin'}

  context 'system tests for docker-service{pgadmin}', :system do

    before :each do
      expect(🐋.connected?).to eq(true)
      expect(🐋.∃🌐?('ruuuby_network')).to eq(true)
      expect(🐋.∃🐋?(service_name)).to eq(true)
    end

    it 'can find the container{service_pgadmin}, matching against expected versions & configs' do
      container_pgadmin = audit_container(service_name, false, 'alpine', '3.9.4')

      os_release = container_pgadmin.cmd!(%w(cat /etc/os-release)).convert_to_json
      expect(os_release['PRETTY_NAME']).to eq("\"Alpine Linux v3.9\"")
      expect(os_release['VERSION_ID']).to eq("3.9.4")
      expect(os_release['NAME']).to eq("\"Alpine Linux\"")
      expect(os_release['ID']).to eq("alpine")
      expect(os_release['HOME_URL']).to eq("\"https://alpinelinux.org/\"")
      expect(os_release['BUG_REPORT_URL']).to eq("\"https://bugs.alpinelinux.org/\"")

      found_env_vars = container_pgadmin.env_vars
      expect(found_env_vars['PYTHON_PIP_VERSION']).to eq('19.1.1')
      expect(found_env_vars['PYTHON_VERSION']).to eq('3.7.3')
      #expect(found_env_vars['LANG']).to eq('en_US.utf8')
      expect(found_env_vars['LANG']).to eq('C.UTF-8')
    end

  end
end
