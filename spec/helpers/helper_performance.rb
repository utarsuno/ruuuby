
RSpec.shared_context 'shared_context_performance' do

  let(:tΔ_within){PerformanceTestHelper::Configs::DEFAULT_WITHIN * 2}
  let(:tΔ_warmup){PerformanceTestHelper::Configs::DEFAULT_WARMUP * 2}
  let(:pΔ_05){1.05}
  let(:pΔ_10){1.1}
  let(:pΔ_50){1.5}
  let(:pΔ_70){1.70}
  let(:pΔ_75){1.75}
  let(:pΔ_80){1.80}
  let(:pΔ_85){1.85}
  let(:pΔ_90){1.90}
  let(:pΔ_95){1.95}
  let(:pΔ_105){2.05}
  let(:pΔ_115){2.15}
  let(:pΔ_400){5.00}
  let(:pΔ_475){5.75}
  let(:pΔ_500){6.00}
  let(:pΔ_600){7.00}
  let(:pΔ_700){8.00}
end

module PerformanceTestHelper

  TIERS = {
      adequately: 0.01,
      quickly: 0.001,
      very_quickly: 0.0001,
      extremely_quickly: 0.00002
  }

  module Configs
    # -------------------------------------------- ⚠️ --------------------------------------------
    #NUM_SAMPLES    = 4
    NUM_SAMPLES    = 2
    # -------------------------------------------- ⚠️ --------------------------------------------
    DEFAULT_WITHIN = 0.2
    DEFAULT_WARMUP = 0.1
  end

  # executes the tested code NUM_SAMPLES times, failing the test if any ran over 0.01 seconds (10ms)
  def perform_adequately
    self.run_performance_test(TIERS[:adequately])
  end

  # executes the tested code NUM_SAMPLES times, failing the test if any ran over 0.001 seconds (1ms)
  def perform_quickly
    self.run_performance_test(TIERS[:quickly])
  end

  # executes the tested code NUM_SAMPLES times, failing the test if any ran over 0.0001 seconds (.1ms)
  def perform_very_quickly
    self.run_performance_test(TIERS[:very_quickly])
  end

  # executes the tested code NUM_SAMPLES times, failing the test if any ran over 0.00002 seconds (.01ms)
  def perform_extremely_quickly
    self.run_performance_test(TIERS[:extremely_quickly])
  end

  # O(1)
  def perform_O1
    perform_constant
  end

  🙈

  def run_performance_test(max_time_allowed)
    #perform_under(max_time_allowed).sec.sample(PerformanceTestHelper::Configs::NUM_SAMPLES).times
    perform_under(max_time_allowed).sample(PerformanceTestHelper::Configs::NUM_SAMPLES)
  end
end
