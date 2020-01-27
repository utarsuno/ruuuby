# -*- encoding : utf-8 -*-

require 'bundler/setup'
require 'ruuuby'

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

  module GeneralTestHelper

    def expect_func_in_class(the_class, the_func)
      expect(the_class.method_defined?(the_func)).to eq(true)
    end

    def expect_func_alias(the_class, the_func, the_alias)
      expect(the_class.instance_method(the_func) == the_class.instance_method(the_alias)).to eq(true)
    end

    def expect_response_to(responder, response_to)
      expect(responder.respond_to?(response_to)).to eq(true)
    end

    def throw_arg_error
      raise_exception(ArgumentError)
    end

    # expect the test condition to raise a +FrozenError+
    def be_frozen
      raise_error(FrozenError)
    end
  end

  module PerformanceTestHelper

    # executes the tested code 10 times, failing the test if any ran over 0.01 seconds
    def perform_quickly
      perform_under(0.01).sec.sample(10).times
    end

    # executes the tested code 10 times, failing the test if any ran over 0.001 seconds
    def perform_very_quickly
      perform_under(0.001).sec.sample(10).times
    end

    # executes the tested code 10 times, failing the test if any ran over 0.00001 seconds
    def perform_extremely_quickly
      perform_under(0.00001).sec.sample(10).times
    end
  end

  config.include(PerformanceTestHelper) #, :type => :'performance'
  config.include(GeneralTestHelper)

end
