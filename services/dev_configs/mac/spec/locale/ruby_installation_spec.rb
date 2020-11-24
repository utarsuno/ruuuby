# encoding: UTF-8

RSpec.describe 'ruby' do
  context 'preferences', :preferences do
    it 'helpful ENV_VARs are set' do
      path_to_ruby    = "/Users/#{💎.engine.os.current_user}/.rbenv/versions/3.0.0-preview1/bin/ruby"
      alt_calculation = ::File.join(::RbConfig::CONFIG['bindir'], ::RbConfig::CONFIG['ruby_install_name'] + ::RbConfig::CONFIG['EXEEXT'])
      expect(ENV['RUBY']).to eq(path_to_ruby)
      expect(::RbConfig.ruby).to eq(path_to_ruby)
      expect(alt_calculation).to eq(path_to_ruby)
    end
  end
end
