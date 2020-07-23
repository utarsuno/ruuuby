# encoding: UTF-8

RSpec.describe 'f40_b00' do

  context 'feature{f40} functionality for' do

  end # end: {functionality}

  context 'docker_locale', :locale do

    context 'gem versions' do
      context 'w/ gem{docker-api}' do
        it 'has correct version{1.34.2}' do
          expect(::Docker::VERSION).to eq('1.34.2')
        end
      end # end: {for gem{docker-api}}
    end

    # @see https://docs.docker.com/compose/reference/envvars/
    context 'local Docker Engine has expected settings' do
      it 'w/ platform' do
        expect(::Docker.version['Platform']['Name']).to eq('Docker Engine - Community')
      end
      it 'w/ OS relating key/vals' do
        expect(::Docker.version['KernelVersion']).to eq('4.19.76-linuxkit')
        expect(::Docker.version['Os']).to eq('linux')
      end
      context 'w/ version related information' do
        it 'w/ Docker' do
          expect(::Docker.version['GoVersion']).to eq('go1.12.17')
          expect(::Docker.version['GitCommit']).to eq('afacb8b')
          expect(::Docker.version['MinAPIVersion']).to eq('1.12')
          expect(::Docker.version['Version']).to eq('19.03.8')
          expect(::Docker.version['ApiVersion']).to eq('1.40')
        end
        it 'experimental mode is currently disabled' do
          expect(::Docker.version['Components'][0]['Details']['Experimental']).to eq('false')
        end
      end
    end

    context 'needed values are set for the following ENV VARs' do
      it 'w/ {DOCKER_API_VERSION}' do
        expect(ENV['DOCKER_API_VERSION']).to eq('1.40')
      end
      it 'w/ {COMPOSE_API_VERSION}' do
        expect(ENV['COMPOSE_API_VERSION']).to eq('1.40')
      end
      it 'w/ {COMPOSE_CONVERT_WINDOWS_PATHS}' do
        expect(ENV['COMPOSE_CONVERT_WINDOWS_PATHS']).to eq('1')
      end
      it 'w/ {COMPOSE_PATH_SEPARATOR}' do
        expect(ENV['COMPOSE_PATH_SEPARATOR']).to eq(':')
      end
    end

  end # end: {locale}

end
