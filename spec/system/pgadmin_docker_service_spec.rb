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

      env_vars = container_pgadmin.env_vars
      expect(env_vars['PYTHON_PIP_VERSION']).to eq('19.1.1')
      expect(env_vars['PYTHON_VERSION']).to eq('3.7.3')
      expect(env_vars['LANG']).to eq('C.UTF-8')
    end

  end
end
