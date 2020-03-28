# coding: utf-8

# `Ruuuby` modifications to c(`Object`)
module ::Ruuuby

  # (not-final-design): attributes that are to be included/extended an absolute maximum of once per Class & Runtime
  module Feature

    # defines the operations needed to support Feature(`f06`) that are applied to Class(`Object`)
    module F06Object

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
          🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, arg_name.to_s, ::Ruuuby::VirtualTypes::🅱️, arg) unless arg.bool?
        else
          arg.∀ₓᵢ do |x, i|
            🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Ruuuby::VirtualTypes::🅱️, x) unless x.bool?
          end
        end
      end

      # @param [Symbol] arg_name
      # @param [*]      arg
      #
      # @raise [WrongParamType]
      def 🛑int❓(arg_name, arg)
        unless arg_name == $PRM_MANY
          🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, arg_name.to_s, ::Integer, arg) unless arg.int?
        else
          arg.∀ₓᵢ do |x, i|
            🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Integer, x) unless x.int?
          end
        end
      end

      # @param [Symbol] arg_name
      # @param [*]      arg
      #
      # @raise [WrongParamType]
      def 🛑ℤ❓(arg_name, arg)
        unless arg_name == $PRM_MANY
          🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, arg_name.to_s, ::Integer, arg) unless (arg.int? && arg.ℤ?)
        else
          arg.∀ₓᵢ do |x, i|
            if x.str?
              if x.to_num?
                as_num = x.to_num
                🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Integer, x) unless (as_num.int? && as_num.ℤ?)
              else
                🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Integer, x)
              end
            elsif x.int?
              🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Integer, x) unless (x.int? && x.ℤ?)
            else
              🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Integer, x)
            end
          end
        end
      end

      # @param [Symbol] arg_name
      # @param [*]      arg
      #
      # @raise [WrongParamType]
      def 🛑𝕌❓(arg_name, arg)
        unless arg_name == $PRM_MANY
          🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, arg_name.to_s, :𝕌, arg) unless (arg.num? && arg.𝕌?)
        else
          arg.∀ₓᵢ do |x, i|
            if x.str?
              if x.to_num?
                as_num = x.to_num
                🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", :𝕌, x) unless (as_num.num? && as_num.𝕌?)
              else
                🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", :𝕌, x)
              end
            elsif x.num?
              🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", :𝕌, x) unless x.𝕌?
            else
              🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", :𝕌, x)
            end
          end
        end
      end

      # @param [Symbol] arg_name
      # @param [*]      arg
      #
      # @raise [WrongParamType]
      def 🛑flt❓(arg_name, arg)
        unless arg_name == $PRM_MANY
          🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, arg_name.to_s, ::Float, arg) unless arg.flt?
        else
          arg.∀ₓᵢ do |x, i|
            🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Float, x) unless x.flt?
          end
        end

      end

      # @param [Symbol] arg_name
      # @param [*]      arg
      #
      # @raise [WrongParamType]
      def 🛑num❓(arg_name, arg)
        unless arg_name == $PRM_MANY
          🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, arg_name.to_s, ::Ruuuby::VirtualTypes::NUMS, arg) unless arg.num?
        else
          arg.∀ₓᵢ do |x, i|
            🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Ruuuby::VirtualTypes::NUMS, x) unless x.num?
          end
        end

      end

      # @param [Symbol] arg_name
      # @param [*]      arg
      #
      # @raise [WrongParamType]
      def 🛑ary❓(arg_name, arg)
        #caller_locations.first.label.to_s
        #caller_locations_prev_func
        unless arg_name == $PRM_MANY
          🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, arg_name.to_s, ::Array, arg) unless arg.ary?
        else
          arg.∀ₓᵢ do |x, i|
            🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Array, x) unless x.ary?
          end
        end
      end

      # @param [Symbol] arg_name
      # @param [*]      arg
      #
      # @raise [WrongParamType]
      def 🛑str❓(arg_name, arg)
        unless arg_name == $PRM_MANY
          🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, arg_name.to_s, ::String, arg) unless arg.str?
        else
          arg.∀ₓᵢ do |x, i|
            🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::String, x) unless x.str?
          end
        end
      end

      # @param [Symbol] arg_name
      # @param [*]      arg
      #
      # @raise [WrongParamType]
      def 🛑stry❓(arg_name, arg)
        unless arg_name == $PRM_MANY
          🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, arg_name.to_s, ::Ruuuby::VirtualTypes::STRY, arg) unless arg.stry?
        else
          arg.∀ₓᵢ do |x, i|
            🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Ruuuby::VirtualTypes::STRY, x) unless x.stry?
          end
        end
      end

      # @param [Symbol] arg_name
      # @param [*]      arg
      #
      # @raise [WrongParamType]
      def 🛑countable❓(arg_name, arg)
        unless arg_name == $PRM_MANY
          🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, arg_name.to_s, ::Ruuuby::VirtualTypes::COUNTABLES, arg) unless (arg.str? || arg.ary? || arg.is_a?(Set))
        else
          arg.∀ₓᵢ do |x, i|
            🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Ruuuby::VirtualTypes::COUNTABLES, x) unless (x.str? || x.ary? || x.is_a?(Set))
          end
        end
      end
    end

    # defines the operations needed to support Feature(`f16`) that are applied to Class(`Object`)
    module F16Object

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
end

# add various functions to existing class +Object+
class ::Object
  # ---------------------------------------------------------------------------------------------------------- | *f06* |
  include Ruuuby::Feature::F06Object
  # ---------------------------------------------------------------------------------------------------------- | *f16* |
  include Ruuuby::Feature::F16Object
  # ---------------------------------------------------------------------------------------------------------- | *f01* |
  alias_method :🙈funcs, :private_methods
  # ---------------------------------------------------------------------------------------------------------- | *f02* |
  alias_method :🛡️funcs, :protected_methods
  # ---------------------------------------------------------------------------------------------------------- | *f06* |
  alias_method :🅱️?, :bool?
  alias_method :🛑🅱️❓, :🛑bool❓
  # ---------------------------------------------------------------------------------------------------------- | *f10* |
  alias_method :🆔, :object_id
  alias_method :❄️, :freeze
  alias_method :❄️?, :frozen?
  alias_method :define_singleton_⨍, :define_singleton_method
  # | ------------------------------------------------------------------------------------------------------------------

end
