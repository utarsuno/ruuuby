# coding: utf-8

require 'bundler/setup'
require 'ruuuby'

require 'rspec-benchmark'

class TestDataGlobalClass
  class TestDataInternalClass
    class TestDataInternalNestedClass
    end
  end
  module TestDataInternalModule
  end
end

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

    def expect_response_to(responder, response_to)
      expect(responder.respond_to?(response_to)).to eq(true)
    end

    def throw_wrong_param_type(the_class, the_method, arg_name, received_type, expected_types)
      raise_error(ArgumentError, Ruuuby::Err::WrongParamType::generate_error_text(the_class, the_method, arg_name, received_type, expected_types))
    end
  end

  module PerformanceTestHelper

    module Configs
      NUM_SAMPLES = 10
    end

    # executes the tested code NUM_SAMPLES times, failing the test if any ran over 0.01 seconds
    def perform_adequately
      perform_under(0.01).sec.sample(PerformanceTestHelper::Configs::NUM_SAMPLES).times
    end

    # executes the tested code NUM_SAMPLES times, failing the test if any ran over 0.001 seconds
    def perform_quickly
      perform_under(0.001).sec.sample(PerformanceTestHelper::Configs::NUM_SAMPLES).times
    end

    # executes the tested code NUM_SAMPLES times, failing the test if any ran over 0.0001 seconds
    def perform_very_quickly
      perform_under(0.0001).sec.sample(PerformanceTestHelper::Configs::NUM_SAMPLES).times
    end

    # executes the tested code NUM_SAMPLES times, failing the test if any ran over 0.00001 seconds
    def perform_extremely_quickly
      perform_under(0.00001).sec.sample(PerformanceTestHelper::Configs::NUM_SAMPLES).times
    end
  end

  config.include(PerformanceTestHelper) #, :type => :'performance'
  config.include(GeneralTestHelper)

end
