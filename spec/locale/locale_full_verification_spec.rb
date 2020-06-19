# coding: UTF-8

RSpec.describe 'ruby' do

  context 'locale', :locale do
    let(:build_configs){::RbConfig::CONFIG}

    context 'OpenSSL is built as needed' do
      it 'w/ needed ENV_VARs' do
        expect(ENV["RUBY_CONFIGURE_OPTS=\"--with-openssl-dir=#{💎.engine.api.path_openssl}\""])
      end
      it 'w/ needed globals' do
        version_openssl = 💎.engine.api.run_cmd!("#{💎.engine.api.path_openssl}/bin/openssl version")
        expect(::OpenSSL::OPENSSL_VERSION).to eq(version_openssl)
      end
    end # end: {OpenSSL is built as needed}

    context 'recommended configs' do

      # during 2.7.0->2.7.1 migration; 3.1.2->3.1.4
      context 'for gem{rubygems-update}' do
        it 'has correct version{3.1.4}' do
          expect(::Gem.rubygems_version.to_s).to eq('3.1.4')
        end
        it 'matching output of cmd{gem -v}' do
          expect(::Gem.rubygems_version.to_s).to eq(💎.engine.api.run_cmd!('gem -v'))
        end
      end # end: {for gem{rubygems-update}}

    end # end: {recommended configs}

  end
end

# TODO: checks against the following (once formally built, not against any system defaults)
#  * brew --version
#  * git --version
#  * ruby-build --version
#  * docker --version
