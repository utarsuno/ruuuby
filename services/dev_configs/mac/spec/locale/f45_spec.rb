# encoding: UTF-8

RSpec.describe 'ruby' do
  context 'preferences', :preferences do

    context 'recommended settings for {curl}' do
      it 'expected version{7.64.1} matches' do
        expect(💻('curl --version')).to eq(["curl 7.64.1 (x86_64-apple-darwin19.0) libcurl/7.64.1 (SecureTransport) LibreSSL/2.8.3 zlib/1.2.11 nghttp2/1.39.2", "Release-Date: 2019-03-27", "Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtsp smb smbs smtp smtps telnet tftp ", "Features: AsynchDNS GSS-API HTTP2 HTTPS-proxy IPv6 Kerberos Largefile libz MultiSSL NTLM NTLM_WB SPNEGO SSL UnixSockets"])
      end
    end

  end
end
