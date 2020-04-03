# coding: utf-8

# `Ruuuby` modifications to c(`Object`)
module ::Ruuuby

  # (not-final-design): attributes that are to be included/extended an absolute maximum of once per Class & Runtime
  module Feature

    # attributes that are to be included, not extended
    module Includable

      # defines the operations needed to support Feature(`f06`) that are applied to Class(`Object`)
      module ObjectF06
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
        # @param [Symbol] normalization_checks
        #
        # @raise [WrongParamType]
        def 🛑str❓(arg_name, arg, normalization_checks=(:none))
          unless arg_name == $PRM_MANY
            if normalization_checks == :none
              🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, arg_name.to_s, ::String, arg) unless arg.str?
            else
              case(normalization_checks)
              when :'!∅'
                if (arg.str? && arg.∅?) || (!(arg.str?))
                  🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, arg_name.to_s, [::String, :'!∅'], arg)
                end
              else
                raise "f(🛑str❓) received invalid normalization_check(#{normalization_checks.to_s}) of type(#{normalization_checks.class.to_s})" unless normalization_checks == :none
              end
            end
          else
            if normalization_checks == :none
              arg.∀ₓᵢ do |x, i|
                🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::String, x) unless x.str?
              end
            else
              case(normalization_checks)
              when :'!∅'
                arg.∀ₓᵢ do |x, i|
                  if (x.str? && x.∅?) || (!(x.str?))
                    🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", [::String, :'!∅'], x)
                  end
                end
              else
                raise "f(🛑str❓) received invalid normalization_check(#{normalization_checks.to_s}) of type(#{normalization_checks.class.to_s})" unless normalization_checks == :none
              end
            end
          end
        end

        # @param [Symbol] arg_name
        # @param [*]      arg
        # @param [Symbol] normalization_checks
        #
        # @raise [WrongParamType]
        def 🛑int❓(arg_name, arg, normalization_checks=:none)
          unless arg_name == $PRM_MANY
            if normalization_checks == :none
              🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, arg_name.to_s, ::Integer, arg) unless arg.int?
            else
              case(normalization_checks)
              when :ℕ
                unless arg.int? && arg.ℕ?
                  🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, arg_name.to_s, [::Integer, :ℕ], arg)
                end
              else
                raise "f(🛑int❓) received invalid normalization_check(#{normalization_checks.to_s}) of type(#{normalization_checks.class.to_s})" unless normalization_checks == :none
              end
            end
          else
            if normalization_checks == :none
              arg.∀ₓᵢ do |x, i|
                🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Integer, x) unless x.int?
              end
            else
              case(normalization_checks)
              when :ℕ
                arg.∀ₓᵢ do |x, i|
                  if (x.int? && !(x.ℕ?)) || (!(x.int?))
                    🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", [::Integer, :ℕ], x)
                  end
                end
              else
                raise "f(🛑int❓) received invalid normalization_check(#{normalization_checks.to_s}) of type(#{normalization_checks.class.to_s})" unless normalization_checks == :none
              end
            end
          end
        end

        # @param [Symbol] arg_name
        # @param [*]      arg
        #
        # @raise [WrongParamType]
        def 🛑ℤ❓(arg_name, arg)
          unless arg_name == $PRM_MANY
            if arg.str? && arg.to_num?
              as_num = arg.to_num
              🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, arg_name.to_s, ::Integer, arg) unless (as_num.num? && as_num.ℤ?)
            else
              🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, arg_name.to_s, ::Integer, arg) unless (arg.num? && arg.ℤ?)
            end
          else
            arg.∀ₓᵢ do |x, i|
              if x.str?
                if x.to_num?
                  as_num = x.to_num
                  🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Integer, x) unless (as_num.num? && as_num.ℤ?)
                else
                  🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Integer, x)
                end
              elsif x.num?
                🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Integer, x) unless (x.num? && x.ℤ?)
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
            if arg.str? && arg.to_num?
              as_num = arg.to_num
              🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, "#{$PRM_MANY.to_s}[#{i.to_s}]", :𝕌, x) unless (as_num.num? && as_num.𝕌?)
            else
              🛑 Ruuuby::ParamErr::throw(self.class, 🌽_previous_⨍, arg_name.to_s, :𝕌, arg) unless (arg.num? && arg.𝕌?)
            end
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
      end # end: f06

      # defines the operations needed to support Feature(`f16`) that are applied to Class(`Object`)
      module ObjectF16
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
      end # end: f16

    end

  end
end

# add various functions to existing class +Object+
class ::Object
  # ---------------------------------------------------------------------------------------------------------- | *f06* |
  include Ruuuby::Feature::Includable::ObjectF06
  # ---------------------------------------------------------------------------------------------------------- | *f16* |
  include Ruuuby::Feature::Includable::ObjectF16
  # ---------------------------------------------------------------------------------------------------------- | *f01* |
  alias_method :🙈funcs, :private_methods
  # ---------------------------------------------------------------------------------------------------------- | *f02* |
  alias_method :🛡️funcs, :protected_methods
  # ---------------------------------------------------------------------------------------------------------- | *f06* |
  alias_method :🅱️?, :bool?
  alias_method :🛑🅱️❓, :🛑bool❓
  # ---------------------------------------------------------------------------------------------------------- | *f10* |
  alias_method :🆔, :object_id
  ⨍_add_aliases(:freeze, [:❄️, :❄])
  ⨍_add_aliases(:frozen?, [:❄️?, :❄?])
  alias_method :define_singleton_⨍, :define_singleton_method
  # | ------------------------------------------------------------------------------------------------------------------

end
