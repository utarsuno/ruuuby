
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

