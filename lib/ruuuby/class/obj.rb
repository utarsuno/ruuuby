# coding: utf-8

# add various functions to existing class +Object+
class ::Object

  # ---------------------------------------------------------------------------------------------------------- | *f01* |
  alias_method :🙈funcs, :private_methods
  # ---------------------------------------------------------------------------------------------------------- | *f02* |
  alias_method :🛡️funcs, :protected_methods
  # ---------------------------------------------------------------------------------------------------------- | *f06* |
  alias_method :🅱️?, :bool?

  # @return [Boolean] true, if this object is an instance of `Class` (ex: `String` but not `'String'`)
  def class? ; self.is_a?(::Class) ; end

  # @return [Boolean] true, if this object is an instance of `Module` (ex: `Ruuuby` but not `String`)
  def module? ; self.class == ::Module && self.is_a?(::Module) ; end

  # @return [Boolean] true, if this object is an instance of `Module` or `Class`
  def nucleotide? ; self.class? || self.module? ; end

  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑bool❓(arg_name, arg)
    unless arg_name == $PRM_MANY
      🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, ::Ruuuby::VirtualTypes::🅱️, arg) unless arg.bool?
    else
      arg.each_with_index do |a, i|
        🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Ruuuby::VirtualTypes::🅱️, a) unless a.bool?
      end
    end
  end

  alias_method :🛑🅱️❓, :🛑bool❓

  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑int❓(arg_name, arg)
    unless arg_name == $PRM_MANY
      🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, ::Integer, arg) unless arg.int?
    else
      arg.each_with_index do |a, i|
        🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Integer, arg) unless a.int?
      end
    end
  end

  # TODO: temporary design
  #
  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑ℤ❓(arg_name, arg)
    the_arg_name = arg_name.to_s
    if the_arg_name == '*args' || the_arg_name == '*all_args'
      arg.each_with_index do |a, i|
        if a.str?
          if (!(a.to_i.int?)) || (!(a.to_i.ℤ?))
            the_arg_name += "[#{i.to_s}]"
            break
          end
        else
          if (!(a.int?)) || (!(a.ℤ?))
            the_arg_name += "[#{i.to_s}]"
            break
          end
        end
      end
      🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, the_arg_name, ::Integer, arg) unless (the_arg_name == '*args' || the_arg_name == '*all_args')
    else
      🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, the_arg_name, ::Integer, arg) unless (arg.int? && arg.ℤ?)
    end
  end

  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑flt❓(arg_name, arg)
    unless arg_name == $PRM_MANY
      🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, ::Float, arg) unless arg.flt?
    else
      arg.each_with_index do |a, i|
        🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Float, a) unless a.flt?
      end
    end

  end

  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑num❓(arg_name, arg)
    unless arg_name == $PRM_MANY
      🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, ::Ruuuby::VirtualTypes::NUMS, arg) unless arg.num?
    else
      arg.each_with_index do |a, i|
        🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Ruuuby::VirtualTypes::NUMS, a) unless a.num?
      end
    end

  end

  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑ary❓(arg_name, arg)
    unless arg_name == $PRM_MANY
      🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, ::Array, arg) unless arg.ary?
    else
      arg.each_with_index do |a, i|
        🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Array, a) unless a.ary?
      end
    end
  end

  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑str❓(arg_name, arg)
    unless arg_name == $PRM_MANY
      🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, ::String, arg) unless arg.str?
    else
      arg.each_with_index do |a, i|
        🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::String, a) unless a.str?
      end
    end
  end

  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑stry❓(arg_name, arg)
    unless arg_name == $PRM_MANY
      🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, ::Ruuuby::VirtualTypes::STRY, arg) unless arg.stry?
    else
      arg.each_with_index do |a, i|
        🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Ruuuby::VirtualTypes::STRY, a) unless a.stry?
      end
    end

  end

  # @param [Symbol] arg_name
  # @param [*]      arg
  #
  # @raise [WrongParamType]
  def 🛑countable❓(arg_name, arg)
    unless arg_name == $PRM_MANY
      🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, arg_name.to_s, ::Ruuuby::VirtualTypes::COUNTABLES, arg) unless (arg.str? || arg.ary? || arg.is_a?(Set))
    else
      arg.each_with_index do |a, i|
        🛑 Ruuuby::ParamErr::throw(self.class, caller_locations.first.label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Ruuuby::VirtualTypes::COUNTABLES, a) unless (a.str? || a.ary? || a.is_a?(Set))
      end
    end

  end

  # ---------------------------------------------------------------------------------------------------------- | *f10* |
  alias_method :🆔, :object_id
  alias_method :❄️, :freeze
  alias_method :❄️?, :frozen?
  # ---------------------------------------------------------------------------------------------------------- | *f16* |

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

  # | ------------------------------------------------------------------------------------------------------------------

end
