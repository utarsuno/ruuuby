# encoding: UTF-8

RSpec.describe 'docker_service_js' do
  let(:service_name){'service_js'}
  let(:data_url){'http://localhost:8080/js/minify'}
  let(:path_input){'/root/ruuuby_js/assets/ruuuby.css'}
  let(:path_output){'/root/ruuuby_js/intermediate/ruuuby.css'}

  context 'system tests for docker-service{js}', :system do

    before :each do
      expect(🐋.connected?).to eq(true)
      expect(🐋.∃🌐?('ruuuby_network')).to eq(true)
      expect(🐋.∃🐋?(service_name)).to eq(true)
    end

    it 'can find the container{service_js}, matching against expected versions & configs' do
      container_js = audit_container(service_name, false, 'alpine', '3.12.0')

      expect(container_js.cmd!(%w(npm -v), 15)).to eq('6.14.6')
      expect(container_js.cmd!(%w(node -v), 15)).to eq('v12.18.3')
      expect(container_js.cmd!(%w(webpack -v), 15)).to eq('4.44.1')
      expect(container_js.cmd!(%w(mocha --version), 15)).to eq('8.1.1')
      expect(container_js.cmd!(%w(gulp -v), 15)).to eq(['CLI version: 2.3.0', 'Local version: 4.0.2'])

      os_release = container_js.cmd!(%w(cat /etc/os-release)).convert_to_json
      expect(os_release['PRETTY_NAME']).to eq("\"Alpine Linux v3.12\"")
      expect(os_release['NAME']).to eq("\"Alpine Linux\"")
      expect(os_release["VERSION_ID"]).to eq("3.12.0")
      expect(os_release["ID"]).to eq('alpine')
      expect(os_release["HOME_URL"]).to eq("\"https://alpinelinux.org/\"")
      expect(os_release["BUG_REPORT_URL"]).to eq("\"https://bugs.alpinelinux.org/\"")

      found_env_vars = container_js.env_vars
      expect(found_env_vars['BUILD_NPM_LIBS']).to eq('chai csso exports-loader express fs gulp gulp-cli gulp-mocha html-minifier imports-loader mocha three webpack webpack-cli')
      expect(found_env_vars['SERVICE_PORT']).to eq('8080')
      if container_js.dev?
        expect(container_js.prod?).to eq(false)
        expect(found_env_vars['NODE_ENV']).to eq('development')
      else
        expect(container_js.dev?).to eq(false)
        expect(container_js.prod?).to eq(true)
        expect(found_env_vars['NODE_ENV']).to eq('production')
      end
    end

    # WIP! copy-paste code is temporary
    context 'responds correctly to requests to endpoint{`:8080/js`}' do
      context 'handles needed scenarios' do
        # TODO: MISSING LOTS OF SCENARIOS
        it 'cases: positive' do
          params   = {debug: true, path_output: path_output, path_input: path_input, minify_type: 'css'}
          response = ::Ruuuby::Protocols::RequestHTTP.execute(data_url, params)
          expect(response.code).to eq('200')
          expect(response.content_length).to eq(112)

          params   = {debug: false, path_output: path_output, path_input: path_input, minify_type: 'css'}
          response = ::Ruuuby::Protocols::RequestHTTP.execute(data_url, params)
          expect(response.code).to eq('200')
          expect(response.content_length).to eq(112)
        end
        # TODO: MISSING LOTS OF SCENARIOS
        it 'cases: negative' do
          response = ::Ruuuby::Protocols::RequestHTTP.execute(data_url)
          expect(response.body).to eq('param{path_input} was not provided')
          expect(response.code).to eq('400')
          expect(response.content_length).to eq(34)

          response = ::Ruuuby::Protocols::RequestHTTP.execute(data_url, {debug: true, minify_type: 'css'})
          expect(response.body).to eq('param{path_input} was not provided')
          expect(response.code).to eq('400')
          expect(response.content_length).to eq(34)

          response = ::Ruuuby::Protocols::RequestHTTP.execute(data_url, {debug: false, minify_type: 'css'})
          expect(response.body).to eq('param{path_input} was not provided')
          expect(response.code).to eq('400')
          expect(response.content_length).to eq(34)

          response = ::Ruuuby::Protocols::RequestHTTP.execute(data_url, {debug: true, path_output: path_output, minify_type: 'css'})
          expect(response.body).to eq('param{path_input} was not provided')
          expect(response.code).to eq('400')
          expect(response.content_length).to eq(34)

          response = ::Ruuuby::Protocols::RequestHTTP.execute(data_url, {debug: false, path_output: path_output, minify_type: 'css'})
          expect(response.body).to eq('param{path_input} was not provided')
          expect(response.code).to eq('400')
          expect(response.content_length).to eq(34)

          response = ::Ruuuby::Protocols::RequestHTTP.execute(data_url, {debug: true, path_output: path_output, minify_type: 'css'})
          expect(response.body).to eq('param{path_input} was not provided')
          expect(response.code).to eq('400')
          expect(response.content_length).to eq(34)

          response = ::Ruuuby::Protocols::RequestHTTP.execute(data_url, {debug: false, path_output: path_output, minify_type: 'css'})
          expect(response.body).to eq('param{path_input} was not provided')
          expect(response.code).to eq('400')
          expect(response.content_length).to eq(34)
        end
      end
    end

  end
end
