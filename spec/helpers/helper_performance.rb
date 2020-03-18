
module PerformanceTestHelper

  module Configs
    # -------------------------------------------- ⚠️ --------------------------------------------
    NUM_SAMPLES = 4
    # -------------------------------------------- ⚠️ --------------------------------------------
  end

  # executes the tested code NUM_SAMPLES times, failing the test if any ran over 0.01 seconds
  def perform_adequately
    self.run_performance_test(0.01)
  end

  # executes the tested code NUM_SAMPLES times, failing the test if any ran over 0.001 seconds
  def perform_quickly
    self.run_performance_test(0.001)
  end

  # executes the tested code NUM_SAMPLES times, failing the test if any ran over 0.0001 seconds
  def perform_very_quickly
    self.run_performance_test(0.0001)
  end

  # executes the tested code NUM_SAMPLES times, failing the test if any ran over 0.00002 seconds
  def perform_extremely_quickly
    self.run_performance_test(0.00002)
  end

  # O(1)
  def perform_O1
    # -------------------------------------------- ⚠️ --------------------------------------------
    # TODO: Increase sample-rate / warmup time allowed / etc
    perform_constant
    # -------------------------------------------- ⚠️ --------------------------------------------
  end

  🙈

  def run_performance_test(max_time_allowed)
    perform_under(max_time_allowed).sec.sample(PerformanceTestHelper::Configs::NUM_SAMPLES).times
  end
end

