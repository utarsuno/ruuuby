# encoding: UTF-8

RSpec.describe 'docker_service_js' do
  let(:dev){💎.engine.api_locale.api_docker_dev}
  let(:service_name){'service_js'}
  let(:container_js){🐋[service_name]}
  let(:url_minify){'http://localhost:8080/minify'}
  let(:url_md5){'http://localhost:8080/md5'}
  let(:path_input){'/root/ruuuby_js/assets/ruuuby.css'}
  let(:path_output){'/root/ruuuby_js/intermediate/ruuuby.min.css'}

  let(:path_input_css){'/root/ruuuby_js/assets/ruuuby.css'}
  let(:path_output_css){'/root/ruuuby_js/intermediate/ruuuby.min.css'}

  context 'system tests for docker-service{js}', :system do

    before :each do
      expect(🐋.connected?).to eq(true)
      expect(🐋.∃🌐?('ruuuby_network')).to eq(true)
      expect(🐋.∃🐋?(service_name)).to eq(true)
    end

    it 'can find the container{service_js}, matching against expected versions & configs' do
      js       = audit_container(service_name, false, 'alpine', '3.12.0')
      versions = js.cmd!(%w(npm run print_version_libs --silent), 10)
      # npm -v
      expect(versions[0]).to eq('6.14.6')
      # node -v
      expect(versions[1]).to eq('v12.18.3')
      # webpack -v
      expect(versions[2]).to eq('4.44.2')
      # mocha --version
      expect(versions[3]).to eq('8.2.1')
      # gulp -v
      expect(versions[4]).to eq('CLI version: 2.3.0')
      expect(versions[5]).to eq('Local version: 4.0.2')

      env_vars = js.env_vars
      expect(env_vars['BUILD_NPM_LIBS']).to eq('chai csso esm exports-loader express fs gulp gulp-cli gulp-mocha html-minifier imports-loader jsonminify mocha three webpack webpack-cli')
      expect(env_vars['SERVICE_PORT']).to eq('8080')
      expect(env_vars['SERVICE_HOST']).to eq('http://localhost')

      if js.dev?
        expect(js.dev?).to eq(true)
        expect(js.prod?).to eq(false)
        expect(env_vars['NODE_ENV']).to eq('development')
        expect(env_vars['BUID_LIBS_DEV_ONLY']).to eq('zsh vim dpkg mandoc man-pages')
      else
        expect(js.dev?).to eq(false)
        expect(js.prod?).to eq(true)
        expect(env_vars['NODE_ENV']).to eq('production')
      end
    end

=begin
    context 'responds correctly to requests to endpoint{`:8080/md5`}' do
      it 'w/ files' do
        params = {debug: true, path: 'src/engine/engine.js', base_name: 'engine.js'}
        expect_json_response(🌐.get!(url_md5, params))

        params[:debug] = false
        response       = 🌐.get!(url_md5, params)
        expect(response.body).to eq('838d9345ed54149e50c3e81be1c7019b')
        expect_request_response(🌐.get!(url_md5, params), '200', response.body,  response.body.length)
      end
      it 'w/ dirs' do
        dir_js        = ::Dir.new("#{💎.engine.path_base}services/web_assets/src/")
        dir_js_engine = ::Dir.new("#{💎.engine.path_base}services/web_assets/src/engine/")
        dir_js_hud    = ::Dir.new("#{💎.engine.path_base}services/web_assets/src/engine/hud/")

        expect(dev.js.md5('src/engine/')).to eq(dir_js_engine.md5)
        expect(dev.js.md5('src/')).to eq(dir_js.md5)
        expect(dev.js.md5('src/engine/hud/')).to eq(dir_js_hud.md5)
      end
    end

    # WIP! copy-paste code is temporary
    context 'responds correctly to requests to endpoint{`:8080/minify`}' do
      context 'handles needed scenarios' do
        context 'cases: positive' do
          it 'w/ css' do
            expected_content        = dev.js.minify_css(path_input_css, path_output_css)
            expected_content        = expected_content.body
            expected_content_length = expected_content.length

            #puts expected_content
            expect(expected_content_length).to eq(157)

            params = {debug: true, path_output: path_output_css, path_input: path_input_css, minify_type: 'css'}
            expect_request_response(🌐.get!(url_minify, params), '200', expected_content,  expected_content_length)

            params[:debug] = false
            response       = 🌐.get!(url_minify, params)
            expect_json_response(response)
            response_data = JSON.parse(response.body)
            expect(response_data['path_base']).to eq(path_input_css)
            expect(response_data['path_minified']).to eq(path_output_css)
            expect(response_data['size_base'] > response_data['size_minified']).to eq(true)
            expect(response_data['size_diff'] > 0.25).to eq(true)
            expect(response_data.∃🔑?('timestamp')).to eq(true)
          end
          it 'w/ html' do

          end
          it 'w/ webmanifest/json' do

          end
        end
        # TODO: MISSING LOTS OF SCENARIOS
        it 'cases: negative' do
          expected_response     = 'param{minify_type} was not provided'
          expected_response_alt = 'param{path_input} was not provided'

          expected_len     = expected_response.length
          expected_len_alt = expected_response_alt.length

          response = 🌐.get(url_minify)
          expect_request_response(response, '400', expected_response, expected_len)

          response = 🌐.get(url_minify, {debug: true, minify_type: 'css'})
          expect_request_response(response, '400', expected_response_alt, expected_len_alt)

          response = 🌐.get(url_minify, {debug: true, minify_type: 'css', extra_param: 'extra_data'})
          expect_request_response(response, '400', expected_response_alt, expected_len_alt)

          response = 🌐.get(url_minify, {debug: false, minify_type: 'css'})
          expect_request_response(response, '400', expected_response_alt, expected_len_alt)

          response = 🌐.get(url_minify, {debug: true, path_output: path_output, minify_type: 'css'})
          expect_request_response(response, '400', expected_response_alt, expected_len_alt)

          response = 🌐.get(url_minify, {debug: false, path_output: path_output, minify_type: 'css'})
          expect_request_response(response, '400', expected_response_alt, expected_len_alt)

          response = 🌐.get(url_minify, {debug: true, path_output: path_output, minify_type: 'css'})
          expect_request_response(response, '400', expected_response_alt, expected_len_alt)

          response = 🌐.get(url_minify, {debug: false, path_output: path_output, minify_type: 'css'})
          expect_request_response(response, '400', expected_response_alt, expected_len_alt)
        end
        it 'minifies web manifest correctly' do
          path_local       = "#{💎.engine.path_base}services/web_assets/assets/ruuuby.webmanifest"
          path_parsed      = 'intermediate/ruuuby.parsed.webmanifest'
          result           = dev.js.minify_webmanifest('assets/ruuuby.webmanifest', path_parsed)
          result           = result.body
          result_verified   = dev.js.container.read_file(path_parsed)

          result_local     = ::File::JSON.read!(path_local, false)
          result_local_str = ::File::JSON.read!(path_local, true)

          expect(result).to eq(result_verified)
          expect(result_local_str).to eq(result_verified)

          expect(result_local['lang']).to eq('en-US')
          expect(result_local['name']).to eq('ruuuby')
          expect(result_local['short_name']).to eq('ruuuby')
          expect(result_local['description']).to eq('ruuuby')
          expect(result_local['display']).to eq('fullscreen')
          expect(result_local['orientation']).to eq('landscape')
          expect(result_local['start_url']).to eq('http://localhost:1337/v/ruuuby.html')
          expect(result_local['background_color']).to eq('DimGray')
        end
      end
    end
=end

  end
end
