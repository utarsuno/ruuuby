# coding: utf-8

require 'bundler/setup'
require 'ruuuby'

require 'helpers/helper_testing'
require 'helpers/helper_performance'
require 'helpers/helper_ruuuby'
require 'helpers/static_test_data'

require 'rspec-benchmark'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  #config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include(RSpec::Benchmark::Matchers)
  config.include(PerformanceTestHelper)
  config.include(GeneralTestHelper)
end
