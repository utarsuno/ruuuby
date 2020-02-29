
module ::RuuubyConfigs
  module GemDependencies
    FOR_PROD = {
        'tty-command': '0.9.0'
    }
    FOR_DEV = {
        'bundler': '2.1.4',
        'rake': '13.0.1',
        'rspec': '3.9.0',
        'rdoc': '6.2.1',
        'rake-compiler': '1.1.0',
        'rspec-benchmark': '0.5.1'
    }.merge!(FOR_PROD)
  end
end
