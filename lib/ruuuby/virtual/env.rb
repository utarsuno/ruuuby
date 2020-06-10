# coding: UTF-8

# modify the Ruby-'singleton' `ENV`
class << ENV

  def ∀(*args); self.each(*args); end

  def ∀🔑(*args); self.each_key(*args); end

  # @return [Integer] the number of ENV_VARs (keys) found
  def 𝔠; self.length; end

  # @return [Boolean] true, if there were no ENV_VARs (keys) found
  def ∅?; self.empty?; end

  # @param [String] the_key
  #
  # @raise [ArgumentError] if the provided arg(the_key) is not of type +String+
  #
  # @return [Boolean] true, if there exists an ENV_VAR w/ matching name
  def ∃🔑?(the_key)
    🛑str❓(:the_key, the_key)
    self.has_key?(the_key)
  end

  # @param [*] env_key_then_opts
  #
  # @raise [RuntimeError]   when provided 1 arg and the key DNE
  # @raise [WrongParamType] when a non-string type is provided for the first argument
  # @raise [ArgumentError]  when no arguments, or too many were provided
  #
  # @return [String, *] the value found or (w/ 2 args) the default value provided
  def fetch🔑(*env_key_then_opts)
    case (env_key_then_opts.𝔠)
    when 1
      the_key = env_key_then_opts[0]
      🛑str❓(:the_key, the_key)
      if self.∃🔑?(the_key)
        return self[the_key]
      else
        🛑 RuntimeError.new("c{ENV_VARS}-> m{fetch🔑} did not have the ENV_VAR{#{the_key}}")
      end
    when 2
      the_key = env_key_then_opts[0]
      🛑str❓(:the_key, the_key)
      if self.∃🔑?(the_key)
        return self[the_key]
      else
        return env_key_then_opts[1]
      end
    else
      🛑 ArgumentError.new("c{ENV_VARS}-> m{fetch🔑} got an invalid number of arguments{#{env_key_then_opts.𝔠.to_s}}")
    end
  end

  # @param [String] feature_uid | the name of the ENV_VAR
  # @param [Integer] max_uid
  # @param [Integer] min_allowed
  # @param [Integer] max_allowed
  #
  # @raise [ArgumentError]
  #
  # @return [Array]
  def parse_feature_behaviors(feature_uid, max_uid, min_allowed=-1, max_allowed=-1)
    🛑str❓(:feature_uid, feature_uid)
    if ∃🔑?(feature_uid)
      content = ENV[feature_uid]
      if content.∋?('|')
        raw_nodes = content.split('|')
        nodes     = []
        raw_nodes.each do |n|
          parsed_node = self.validate_feature_behavior_syntax!(n)
          if nodes.∋?(parsed_node)
            🛑 ArgumentError.new("c{ENV}-> m{parse_feature_behaviors} got duplicate val{#{parsed_node.to_s}} for ENV{#{content.to_s}}")
          else
            as_num = parsed_node.to_str
            if as_num.∋?('{')
              as_num = as_num.♻️⟵('{')
            end
            as_num = as_num.♻️⟶('b').to_i
            if as_num > max_uid
              🛑 ArgumentError.new("c{ENV}-> m{parse_feature_behaviors} got out-of-bounds val{#{as_num.to_s}} for ENV{#{content.to_s}}")
            else
              nodes << parsed_node
              if max_allowed != -1 && max_allowed < nodes.length
                🛑 ArgumentError.new("c{ENV}-> m{parse_feature_behaviors} received more than the max{#{max_allowed.to_s}} number of allowed behaviors for feature{#{feature_uid.to_s}} in ENV{#{content.to_s}}")
              end
            end
          end
        end
        if min_allowed != -1 && nodes.length < min_allowed
          🛑 ArgumentError.new("c{ENV}-> m{parse_feature_behaviors} did not receive at least{#{min_allowed.to_s}} behaviors for feature{#{feature_uid.to_s}} in ENV{#{content.to_s}}")
        end
        return nodes
      else
        return [self.validate_feature_behavior_syntax!(content)]
      end
    else
      🛑 ArgumentError.new("c{ENV}-> m{parse_feature_behaviors} did not find ENV{#{feature_uid.to_s}}")
    end
  end

  # @param [String] content
  #
  # @raise [ArgumentError] if the provided param(content) does not have the syntax of a feature behavior
  #
  # @return [String] the same param(content) provided
  def validate_feature_behavior_syntax!(content)
    🛑str❓(:content, content)
    if ::Ruuuby::MetaData::RuuubyEngine.syntax_feature_behavior.match?(content)
      content
    else
      🛑 ArgumentError.new("c{ENV}-> m{validate_feature_behavior_syntax!} got invalid content for ENV{#{content.to_s}}")
    end
  end

end
