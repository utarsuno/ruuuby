# encoding: UTF-8

# add various functions to existing class +Object+
class ::Object

  module ContextSuperscripts
    refine ::Object do
      # @return [Symbol]
      def ⁻⁹ ; :⁻⁹ ; end

      # @return [Symbol]
      def ⁻⁸ ; :⁻⁸ ; end

      # @return [Symbol]
      def ⁻⁷ ; :⁻⁷ ; end

      # @return [Symbol]
      def ⁻⁶ ; :⁻⁶ ; end

      # @return [Symbol]
      def ⁻⁵ ; :⁻⁵ ; end

      # @return [Symbol]
      def ⁻⁴ ; :⁻⁴ ; end

      # @return [Symbol]
      def ⁻³ ; :⁻³ ; end

      # @return [Symbol]
      def ⁻² ; :⁻² ; end

      # @return [Symbol]
      def ⁻¹ ; :⁻¹ ; end

      # @return [Symbol]
      def ⁰ ; :⁰ ; end

      # @return [Symbol]
      def ¹ ; :¹ ; end

      # @return [Symbol]
      def ² ; :² ; end

      # @return [Symbol]
      def ³ ; :³ ; end

      # @return [Symbol]
      def ⁴ ; :⁴ ; end

      # @return [Symbol]
      def ⁵ ; :⁵ ; end

      # @return [Symbol]
      def ⁶ ; :⁶ ; end

      # @return [Symbol]
      def ⁷ ; :⁷ ; end

      # @return [Symbol]
      def ⁸ ; :⁸ ; end

      # @return [Symbol]
      def ⁹ ; :⁹ ; end
    end
  end

  # ---------------------------------------------------------------------------------------------------------- | *f06* |

  # @param [String, Symbol] arg_name
  # @param [*]              arg
  #
  # @raise [ArgumentError]
  def 🛑bool❓(arg_name, arg); 🛑 ::ArgErr.new(self, arg_name.to_s, arg, [TrueClass, FalseClass]) unless arg.bool?; end

  # @param [*] args
  #
  # @raise [ArgumentError]
  def 🛑bools❓(args)
    args.∀ₓᵢ do |x, i|
      🛑 ::ArgErr.new(self, "[#{i.to_s}]{#{x.to_s}}", x, [TrueClass, FalseClass]) unless x.bool?
    end
  end

  # @param [String, Symbol] arg_name
  # @param [*]              arg
  # @param [Symbol]         normalization_checks (default{:none})
  #
  # @raise [ArgumentError]
  def 🛑sym❓(arg_name, arg, normalization_checks=:none)
    if normalization_checks != :none
      🛑 ::ArgErr.new(self, arg_name.to_s, arg, 'Symbol') unless arg.sym?(normalization_checks)
    else
      🛑 ::ArgErr.new(self, arg_name.to_s, arg, 'Symbol') unless arg.sym?
    end
  end

  # @param [*]      args
  # @param [Symbol] normalization_checks (default{:none})
  #
  # @raise [ArgumentError]
  def 🛑syms❓(args, normalization_checks=:none)
    if normalization_checks != :none
      args.∀ₓᵢ do |x, i|
        🛑 ::ArgErr.new(self, "[#{i.to_s}]{#{x.to_s}}", x, 'Symbol') unless x.sym?(normalization_checks)
      end
    else
      args.∀ₓᵢ do |x, i|
        🛑 ::ArgErr.new(self, "[#{i.to_s}]{#{x.to_s}}", x, 'Symbol') unless x.sym?
      end
    end
  end

  # @param [String, Symbol] arg_name
  # @param [*]              arg
  #
  # @raise [ArgumentError]
  def 🛑set❓(arg_name, arg); 🛑 ::ArgErr.new(self.class, arg_name.to_s, arg, 'et') unless arg.set?; end

  # @param [*] args
  #
  # @raise [ArgumentError]
  def 🛑sets❓(args)
    args.∀ₓᵢ do |x, i|
      🛑 ::ArgErr.new(self.class, "[#{i.to_s}]{#{x.to_s}}", x, 'Set') unless x.set?
    end
  end

  # @param [String, Symbol] arg_name
  # @param [*]              arg
  # @param [Symbol]         normalization_checks (default{:none})
  #
  # @raise [ArgumentError]
  def 🛑str❓(arg_name, arg, normalization_checks=:none)
    if normalization_checks != :none
      🛑 ::ArgErr.new(self, arg_name.to_s, arg, 'String') unless arg.str?(normalization_checks)
    else
      🛑 ::ArgErr.new(self, arg_name.to_s, arg, 'String') unless arg.str?
    end
  end

  # @param [*]      args
  # @param [Symbol] normalization_checks (default{:none})
  #
  # @raise [ArgumentError]
  def 🛑strs❓(args, normalization_checks=:none)
    if normalization_checks != :none
      args.∀ₓᵢ do |x, i|
        🛑 ::ArgErr.new(self, "[#{i.to_s}]{#{x.to_s}}", x, 'String') unless x.str?(normalization_checks)
      end
    else
      args.∀ₓᵢ do |x, i|
        🛑 ::ArgErr.new(self, "[#{i.to_s}]{#{x.to_s}}", x, 'String') unless x.str?
      end
    end
  end

  # @param [String, Symbol] arg_name
  # @param [*]              arg
  #
  # @raise [ArgumentError]
  def 🛑hsh❓(arg_name, arg); 🛑 ::ArgErr.new(self, arg_name.to_s, arg, 'Hash') unless arg.hsh?; end

  # @param [*] args
  #
  # @raise [ArgumentError]
  def 🛑hshs❓(args)
    args.∀ₓᵢ do |x, i|
      🛑 ::ArgErr.new(self, "[#{i.to_s}]{#{x.to_s}}", x, 'Hash') unless x.hsh?
    end
  end

  # @param [String, Symbol] arg_name
  # @param [*]              arg
  # @param [Symbol]         normalization_checks
  #
  # @raise [ArgumentError]
  def 🛑int❓(arg_name, arg, normalization_checks=:none)
    if normalization_checks != :none
      🛑 ::ArgErr.new(self, arg_name.to_s, arg, 'Integer', normalization_checks) unless arg.int?(normalization_checks)
    else
      🛑 ::ArgErr.new(self, arg_name.to_s, arg, 'Integer') unless arg.int?
    end
  end

  # @param [*]      args
  # @param [Symbol] normalization_checks
  #
  # @raise [ArgumentError]
  def 🛑ints❓(args, normalization_checks=:none)
    if normalization_checks != :none
      args.∀ₓᵢ do |x, i|
        🛑 ::ArgErr.new(self, "[#{i.to_s}]{#{x.to_s}}", x, 'Integer', normalization_checks) unless x.int?(normalization_checks)
      end
    else
      args.∀ₓᵢ do |x, i|
        🛑 ::ArgErr.new(self, "[#{i.to_s}]{#{x.to_s}}", x, 'Integer') unless x.int?
      end
    end
  end

  # @param [String, Symbol] arg_name
  # @param [*]              arg
  # @param [Symbol]         normalization_checks
  #
  # @raise [ArgumentError]
  def 🛑flt❓(arg_name, arg, normalization_checks=:none)
    if normalization_checks != :none
      🛑 ::ArgErr.new(self, arg_name.to_s, arg, 'Float') unless arg.flt?(normalization_checks)
    else
      🛑 ::ArgErr.new(self, arg_name.to_s, arg, 'Float') unless arg.flt?
    end
  end

  # @param [*]      args
  # @param [Symbol] normalization_checks
  #
  # @raise [ArgumentError]
  def 🛑flts❓(args, normalization_checks=:none)
    if normalization_checks != :none
      args.∀ₓᵢ do |x, i|
        🛑 ::ArgErr.new(self, "[#{i.to_s}]{#{x.to_s}}", x, 'Float') unless x.flt?(normalization_checks)
      end
    else
      args.∀ₓᵢ do |x, i|
        🛑 ::ArgErr.new(self, "[#{i.to_s}]{#{x.to_s}}", x, 'Float') unless x.flt?
      end
    end
  end

  # @param [String, Symbol] arg_name
  # @param [*]              arg
  # @param [Symbol]         normalization_checks
  #
  # @raise [ArgumentError]
  def 🛑num❓(arg_name, arg, normalization_checks=:none)
    if normalization_checks != :none
      🛑 ::ArgErr.new(self, arg_name.to_s, arg, 'Number') unless arg.num?(normalization_checks)
    else
      🛑 ::ArgErr.new(self, arg_name.to_s, arg, 'Number') unless arg.num?
    end
  end

  # @param [Array]  args
  # @param [Symbol] normalization_checks
  #
  # @raise [ArgumentError]
  def 🛑nums❓(args, normalization_checks=:none)
    if normalization_checks != :none
      args.∀ₓᵢ do |x, i|
        🛑 ::ArgErr.new(self, "[#{i.to_s}]{#{x.to_s}}", x, 'Number') unless x.num?(normalization_checks)
      end
    else
      args.∀ₓᵢ do |x, i|
        🛑 ::ArgErr.new(self, "[#{i.to_s}]{#{x.to_s}}", x, 'Number') unless x.num?
      end
    end
  end

  # @param [String, Symbol] arg_name
  # @param [*]              arg
  # @param [Symbol]         normalization_checks
  #
  # @raise [ArgumentError]
  def 🛑ary❓(arg_name, arg, normalization_checks=:none)
    if normalization_checks != :none
      🛑 ::ArgErr.new(self, 'arg', arg, 'Array', :∉∅) unless arg.ary?(normalization_checks)
    else
      🛑 ::ArgErr.new(self, 'arg', arg, 'Array') unless arg.ary?
    end
  end

  # @param [*]      args
  # @param [Symbol] normalization_checks
  #
  # @raise [ArgumentError]
  def 🛑arys❓(args, normalization_checks=:none)
    if normalization_checks != :none
      args.∀ₓᵢ do |x, i|
        🛑 ::ArgErr.new(self, "[#{i.to_s}]{#{x.to_s}}", x, 'Array', normalization_checks) unless x.ary?(normalization_checks)
      end
    else
      args.∀ₓᵢ do |x, i|
        🛑 ::ArgErr.new(self, "[#{i.to_s}]{#{x.to_s}}", x, 'Array') unless x.ary?
      end
    end
  end

  # ---------------------------------------------------------------------------------------------------------- | *f10* |

  alias_method :ⓣ, :class

  # @return [String] this particular object's Class as a String
  def Ⓣ; self.class.to_s; end

  # ---------------------------------------------------------------------------------------------------------- | *f16* |
  alias_method :🆔, :object_id
  alias_method :❄️, :freeze
  alias_method :❄️?, :frozen?
  # | ------------------------------------------------------------------------------------------------------------------

  def attribute_lazy_loadable(library_to_load, debug=false)
    🛑str❓('library_to_load', library_to_load)
    self.instance_variable_set("@lazy_loaded", false)

    self.define_singleton_method(:lazy_loaded?) do ||
      return @lazy_loaded
    end

    self.define_singleton_method(:ensure_lazy_loaded) do ||
      unless @lazy_loaded
        @lazy_loaded = true
        if debug
          💎.engine.debug("just loaded library{#{library_to_load}}") if require library_to_load
        else
          require library_to_load
        end
        return true
      end
      false
    end

    self
  end

end
