# encoding: UTF-8

RSpec.describe 'f40_b00' do

  context 'feature{f40_b00} functionality for' do
  end # end: {functionality}

  context 'docker_locale', :locale do

    context 'local system' do
      context 'w/ {docker}' do
        it 'has needed version' do
          expect(🐋.version).to eq('Docker version 19.03.13, build 4484c46d9d')
        end
        it 'matching what gem{docker-api} reports as well' do
          expect(🐋.version.♻️⟵(', ').♻️⟶('version ')).to eq(::Docker.version['Version'])
        end
      end
      context 'w/ {docker-compose}' do
        it 'has needed version' do
          expect(🐋.version_compose).to eq('docker-compose version 1.27.4, build 40524192')
        end
      end
    end

    context 'gem versions' do
      context 'w/ gem{docker-api}' do
        it 'has correct version{2.0.0}' do
          expect(::Docker::VERSION).to eq('2.0.0')
        end
      end
    end

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
          expect(::Docker.version['GoVersion']).to eq('go1.13.15')
          expect(::Docker.version['GitCommit']).to eq('4484c46d9d')
          expect(::Docker.version['MinAPIVersion']).to eq('1.12')
          expect(::Docker.version['Version']).to eq('19.03.13')
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
      context 'relating to windows os' do
        it 'w/ {COMPOSE_CONVERT_WINDOWS_PATHS}' do
          expect(ENV['COMPOSE_CONVERT_WINDOWS_PATHS']).to eq('1')
        end
        it 'w/ {COMPOSE_FORCE_WINDOWS_HOST}' do
          expect(ENV['COMPOSE_FORCE_WINDOWS_HOST']).to eq('0')
        end
      end
      it 'w/ {COMPOSE_PATH_SEPARATOR}' do
        expect(ENV['COMPOSE_PATH_SEPARATOR']).to eq(':')
      end
      it 'w/ {COMPOSE_PROJECT_NAME}' do
        expect(ENV['COMPOSE_PROJECT_NAME']).to eq('ruuuby')
      end
    end

  end # end: {locale}

end
