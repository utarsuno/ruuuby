# encoding: UTF-8

require 'bundler/setup'
require 'ruuuby'

require_relative 'helpers/helper_performance'
require_relative 'helpers/helper_ruuuby'
require_relative 'helpers/static_test_data'
require_relative 'helpers/helper_db'
require_relative 'helpers/helper_math'

require 'rdoc'
require 'rake'
require 'rspec'
require 'rspec-benchmark'

module HelpersSyntaxCache

  def expect_syntax(the_class, syntax_id, syntax_before_processing)
    expect(the_class.respond_to?(syntax_id)).to eq(true)
    result = the_class.send(syntax_id)
    expect(result.ⓣ).to eq(Regexp)
    expect(result.source).to eq(syntax_before_processing)
    expect(the_class.send(syntax_id).🆔).to eq(result.🆔)
    expect{the_class.send("#{syntax_id}=".to_sym, 5).to raise_error(FrozenError)}
  end

  def expect_syntax_wo_cache(the_class, syntax_id, syntax_before_processing)
    expect(the_class.respond_to?(syntax_id)).to eq(false)
    expect(the_class::Syntax.constants.∋?(syntax_id)).to eq(true)
    expect(the_class::Syntax.const_get(syntax_id)).to eq(syntax_before_processing)
    expect{the_class.send("#{syntax_id}=".to_sym, 5).to raise_error(FrozenError)}
  end

  def do_not_expect_syntax(the_class, syntax_id)
    expect(the_class.respond_to?(syntax_id)).to eq(false)
  end

end

module HelpersFeature16

  def expect_scenarios_power_operations(scenarios, superscripts, power_operation, to_pass=true)
    if power_operation == 0
      scenarios.∀ do |n|
        expect((n^(superscripts)) == 1).to eq(to_pass)
      end
    elsif power_operation == 1
      scenarios.∀ do |n|
        expect((n^(superscripts)) == n).to eq(to_pass)
      end
    else
      scenarios.∀ do |n|
        expect((n^(superscripts)) == (n ** power_operation)).to eq(to_pass)
      end
    end
  end

end

module HelpersGeneral

  # @param [*] response
  def expect_json_response(response)
    expect(response.content_type_json?).to eq(true)
    expect(response.content_type).to eq('application/json; charset=utf-8')
  end

  # @param [*]                 response
  # @param [String, NilClass]  expected_code
  # @param [String, NilClass]  expected_content
  # @param [Integer, NilClass] expected_content_length
  #
  # @return [*] response
  def expect_request_response(response, expected_code=nil, expected_content=nil, expected_content_length=nil)
    expect(response.is_a?(::Net::HTTPResponse)).to eq(true)
    unless expected_code.nil?
      expect(response.code).to eq(expected_code)
    end
    unless expected_content.nil?
      expect(response.body).to eq(expected_content)
    end
    unless expected_content_length.nil?
      expect(response.body.length).to eq(expected_content_length)
    end
    response
  end

  def expect_needed_version(subject, version_expected, validate_matching_value=nil)
    expect(subject.∃version?).to eq(true)
    expect(subject.version_expected).to eq(version_expected)
    expect(subject.version_current).to eq(version_expected)
    unless validate_matching_value.nil?
      expect(subject.version_current).to eq(validate_matching_value)
    end
  end

  def expect≈≈(scenario, expected_value)
    result = scenario.≈≈(expected_value)
    if !result
      puts "scenarios{#{scenario.to_s}} did not match {#{expected_value.to_s}}"
    end
    expect(result).to eq(true)
  end

  def expect_regular_int(val_scenario, val_expected)
    expect(val_scenario).to eq(val_expected)
    expect(val_scenario.ⓣ).to eq(Integer)
  end

  def expect_regular_flt(val_scenario, val_expected)
    expect(val_scenario).to eq(val_expected)
    expect(val_scenario.ⓣ).to eq(Float)
  end

  def expect_∃⨍(the_func, owner, expected_result=true)
    expect(owner.∃⨍?(the_func)).to eq(expected_result)
  end

  def expect_∃⨍_with_alias(the_func, aliases, owner, expected_result=true)
    expect(owner.∃⨍?(the_func)).to eq(expected_result)
    if aliases.ary?
      aliases.each do |a|
        expect(owner.∃⨍_alias?(the_func, a)).to eq(expected_result)
      end
    else
      expect(owner.∃⨍_alias?(the_func, aliases)).to eq(expected_result)
    end
  end

  def expect_∃const_w_type(the_const, const_type, owner, expected_result=true)
    expect(owner.const_defined?(the_const)).to eq(expected_result)
    expect(owner.const_get(the_const).ⓣ).to eq(const_type)
  end

  def expect_∃const(the_const, owner, expected_result=true)
    expect(owner.const_defined?(the_const)).to eq(expected_result)
  end

  def expect_∃⨍_static(the_func, owner, expected_result=true)
    if owner == ::Kernel
      expect(owner.instance_methods(false).∋?(the_func)).to eq(expected_result)
    else
      expect(owner.singleton_class.instance_methods(false).∋?(the_func)).to eq(expected_result)
    end
  end

  # @param [Symbol] kmodule
  # @param [Class]  owner
  def expect_∃ᶜ(kmodule, owner=::Kernel)
    expect(🧬.∃ᶜ?(kmodule, owner)).to eq(true)
  end

  # @param [Symbol] kmodule
  # @param [Class]  owner
  def expect_∄ᶜ(kmodule, owner)
    expect(🧬.∃ᶜ?(kmodule, owner)).to eq(false)
  end

  # @param [Symbol] kmodule
  # @param [Class]  owner
  def expect_∃ᵐ(kmodule, owner)
    expect(🧬.∃ᵐ?(kmodule, owner)).to eq(true)
  end

  # @param [Symbol] kmodule
  # @param [Class]  owner
  def expect_∄ᵐ(kmodule, owner)
    expect(🧬.∃ᵐ?(kmodule, owner)).to eq(false)
  end

  # @param [Symbol] kmodule
  def expect_∃ᴹ(kmodule)
    expect(🧬.∃ᴹ?(kmodule)).to eq(true)
  end

  # @param [Symbol] kmodule
  def expect_∄ᴹ(kmodule)
    expect(🧬.∃ᴹ?(kmodule)).to eq(false)
  end

end

RSpec.configure do |config|

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  #config.add_setting(:start_time)

  # Disable RSpec exposing methods globally on `Module` and `main`
  #config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.profile_examples = 4

  config.include ::Math::Trig

  config.include_context 'shared_context_general'
  config.include_context 'shared_context_f24'
  config.include_context 'shared_context_f27'
  config.include_context 'shared_context_f30'
  config.include_context 'shared_context_f32'
  config.include_context 'shared_context_f34'
  config.include_context 'shared_context_f38'
  config.include_context 'shared_context_f40'

  config.include HelpersGeneral
  config.include HelpersFeature16
  config.include HelpersSyntaxCache
  config.include HelpersMath

  config.include HelpersDB, :db
  config.include_context 'shared_context_db', :db

  config.include PerformanceTestHelper, :performance

  config.include RSpec::Benchmark::Matchers, :performance
  config.include_context 'shared_context_performance', :performance

  #config.filter_run_excluding :performance => lambda {|v| v == 'slow'}

  #config.filter_run_excluding :performance => 'slow'
  # https://github.com/rspec/rspec-core/issues/2567

end
