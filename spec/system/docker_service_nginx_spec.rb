# encoding: UTF-8

RSpec.describe 'docker_service_nginx' do

  context 'system tests for docker-service{nginx}', :system do
    let(:api_docker){💎.engine.api_locale.api_docker}
    let(:data_url){'http://localhost:1337/nginx'}

    before :each do
      # `Docker Engine` is connected
      expect(api_docker.connected?).to eq(true)

      # `docker network{ruuuby_network}` is running
      expect(api_docker.∃🌐?('ruuuby_network')).to eq(true)

      # `service_nginx` is running
      #expect(api_docker.∃🌐?('nginx')).to eq(true)

      expect(::Docker.ping).to eq('OK')
    end

    it 'can find the container{service_nginx}' do
      result_0 = api_docker.find_🐋_by_name('nginx')
      expect(result_0.ⓣ).to eq(::Docker::Container)
      expect(result_0.id.ⓣ).to eq(::String)

      result_1 = api_docker.find_🐋_by_id(result_0.id)
      expect(result_1.ⓣ).to eq(::Docker::Container)
      expect(result_1.id.ⓣ).to eq(::String)

      # different Ruby objects that are representing the same `Docker Container`
      expect(result_0.id).to     eq(result_1.id)
      expect(result_0.🆔).to_not eq(result_1.🆔)
    end

    it 'responds correctly to requests to endpoint{`:1337/nginx`}' do
      response = ::Ruuuby::Protocols::RequestHTTP.execute!(data_url)
      data     = response.body
      expect(response.code).to eq('200')
      expect(data.match?(/Active connections: \d+ \nserver accepts handled requests\n \d+ \d+ \d+ \nReading: \d+ Writing: \d+ Waiting: \d+ \n/)).to eq(true)
      requests_served = data.split("\n")[2].to_s.♻️⟶(' ', 3).♻️⟵(' ').to_i

      num_requests = 🎲(20).to_i
      (0..num_requests).∀{|scenario| ::Ruuuby::Protocols::RequestHTTP.execute!(data_url)}

      response2 = ::Ruuuby::Protocols::RequestHTTP.execute!(data_url)
      data2     = response2.body
      expect(response2.code).to eq('200')
      expect(data2.match?(/Active connections: \d+ \nserver accepts handled requests\n \d+ \d+ \d+ \nReading: \d+ Writing: \d+ Waiting: \d+ \n/)).to eq(true)
      requests_served2 = data2.split("\n")[2].to_s.♻️⟶(' ', 3).♻️⟵(' ').to_i

      expect(requests_served2 > requests_served).to eq(true)

      # returning the necessary header values
      # TODO: configure time-zone settings for NGINX, it's returning values in GMT

      headers = response2.∀ᴴ.to_h
      headers.∀🔑{|key| expect(response2.∃ᴴ?(key)).to eq(true)}

      expect(headers['server']).to eq('nginx/1.19.1')
      expect(headers['content-type']).to eq('text/plain')
      expect(headers['connection']).to eq('keep-alive')
      expect(headers['content-length']).to eq(response2.body.length.to_s)

      # TODO: add scenarios tests on the date-time value returned
    end

  end

end
