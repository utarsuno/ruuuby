# encoding: UTF-8

RSpec.describe 'docker_service_nginx' do

  context 'system tests for docker-service{nginx}', :system do
    let(:data_url){'http://localhost:1337/nginx'}
    let(:service_name){'service_nginx'}

    before :each do
      expect(🐋.connected?).to eq(true)
      expect(🐋.∃🌐?('ruuuby_network')).to eq(true)
      expect(🐋.∃🐋?(service_name)).to eq(true)
    end

    it 'can find the container{service_nginx}, matching against expected versions & configs' do
      container_nginx = audit_container(service_name, false, 'alpine', '3.11.6')

      expect(container_nginx.cmd!(%w(nginx -v))).to eq('nginx version: nginx/1.19.1')
      expect(container_nginx.cmd!(%w(zsh --version))).to eq('zsh 5.7.1 (x86_64-alpine-linux-musl)')

      os_release = container_nginx.cmd!(%w(cat /etc/os-release)).convert_to_json
      expect(os_release['PRETTY_NAME']).to eq("\"Alpine Linux v3.11\"")
      expect(os_release["VERSION_ID"]).to eq("3.11.6")
      expect(os_release['NAME']).to eq("\"Alpine Linux\"")
      expect(os_release["ID"]).to eq('alpine')
      expect(os_release["HOME_URL"]).to eq("\"https://alpinelinux.org/\"")
      expect(os_release["BUG_REPORT_URL"]).to eq("\"https://bugs.alpinelinux.org/\"")

      found_env_vars = container_nginx.env_vars
      expect(found_env_vars['NGINX_VERSION']).to eq('1.19.1')
      expect(found_env_vars['NJS_VERSION']).to eq('0.4.2')
      expect(found_env_vars['PKG_RELEASE']).to eq('1')

      expect(container_nginx.mounts.length).to eq(1)
      expect(container_nginx.mounts[0].ⓣ).to eq(::Hash)
      expect(container_nginx.mounts[0]['Destination']).to eq('/v')
    end

    it 'responds correctly to requests to endpoint{`:1337/nginx`}' do
      response = ::Ruuuby::Protocols::RequestHTTP.execute!(data_url)
      data     = response.body
      expect(data.match?(/Active connections: \d+ \nserver accepts handled requests\n \d+ \d+ \d+ \nReading: \d+ Writing: \d+ Waiting: \d+ \n/)).to eq(true)
      requests_served = data.split($/)[2].to_s.♻️⟶(' ', 3).♻️⟵(' ').to_i

      (🎲(20) + 1).∀{::Ruuuby::Protocols::RequestHTTP.execute!(data_url)}

      response2, time_delta = ::Ruuuby::Protocols::RequestHTTP.execute_timed!(data_url)
      data2 = response2.body
      expect(data2.match?(/Active connections: \d+ \nserver accepts handled requests\n \d+ \d+ \d+ \nReading: \d+ Writing: \d+ Waiting: \d+ \n/)).to eq(true)
      requests_served2 = data2.split($/)[2].to_s.♻️⟶(' ', 3).♻️⟵(' ').to_i

      expect(requests_served2 > requests_served).to eq(true)

      headers = response2.∀ᴴ.to_h
      headers.∀🔑{|key| expect(response2.∃ᴴ?(key)).to eq(true)}

      expect(headers['server']).to eq('nginx/1.19.1')
      expect(headers['content-type']).to eq('text/plain')
      expect(headers['connection']).to eq('keep-alive')
      expect(headers['content-length']).to eq(response2.body.length.to_s)
      expect(time_delta < 3.0).to eq(true)
    end

  end

end
