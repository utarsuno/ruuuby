# coding: UTF-8

# modify the Ruby-'singleton' `ENV`
class << ENV

  def ∀(*args); self.each(*args); end

  def 𝔠; self.length; end

  def ∅?; self.empty?; end

  def ∀🔑(*args); self.each_key(*args); end
  alias_method :∀🗝, :∀🔑

  def ∃🔑?(name); self.has_key?(name); end

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
      if self.∃🔑?(env_key_then_opts[0])
        return self[env_key_then_opts[0]]
      else
        🛑 RuntimeError.new("c{ENV_VARS}-> m{fetch🔑} did not have the ENV_VAR{#{the_key}}")
      end
    when 2
      the_key = env_key_then_opts[0]
      🛑str❓(:the_key, the_key)
      if self.∃🔑?(env_key_then_opts[0])
        return self[env_key_then_opts[0]]
      else
        return env_key_then_opts[1]
      end
    else
      🛑 ArgumentError.new("c{ENV_VARS}-> m{fetch🔑} got an invalid number of arguments{#{env_key_then_opts.𝔠.to_s}}")
    end
  end

end
