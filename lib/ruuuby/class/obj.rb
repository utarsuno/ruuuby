# coding: UTF-8

# `Ruuuby` modifications to c(`Object`)
module ::Ruuuby

  # (not-final-design): attributes that are to be included/extended an absolute maximum of once per Class & Runtime
  module Feature

    # attributes that are to be included, not extended
    module Includable

      # defines the operations needed to support Feature(`f06`) that are applied to Class(`Object`)
      module ObjectF06

        # @return [Class]
        def ⓣ; self.class; end

        # @return [String]
        def Ⓣ; self.class.to_s; end

        # @return [Boolean] true, if this object is an instance of `ThetaAngle`
        def θ?; self.is_a?(::ThetaAngle); end

        # @param [Symbol] arg_name
        # @param [*]      arg
        #
        # @raise [WrongParamType]
        def 🛑bool❓(arg_name, arg)
          unless arg_name == $PRM_MANY
            🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, [::FalseClass, ::TrueClass], arg) unless arg.bool?
          else
            arg.∀ₓᵢ do |x, i|
              🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", [::FalseClass, ::TrueClass], x) unless x.bool?
            end
          end
        end

        # @param [Symbol] arg_name
        # @param [*]      arg
        # @param [Symbol] normalization_checks (default{:none})
        #
        # @raise [WrongParamType]
        def 🛑sym❓(arg_name, arg, normalization_checks=:none)
          unless arg_name == $PRM_MANY
            if normalization_checks != :none
              🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Symbol, arg) unless arg.sym?(normalization_checks)
            else
              🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Symbol, arg) unless arg.sym?
            end
          else
            if normalization_checks != :none
              arg.∀ₓᵢ do |x, i|
                🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Symbol, x) unless x.sym?(normalization_checks)
              end
            else
              arg.∀ₓᵢ do |x, i|
                🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Symbol, x) unless x.sym?
              end
            end
          end
        end

        # @param [Symbol] arg_name
        # @param [*]      arg
        #
        # @raise [WrongParamType]
        def 🛑set❓(arg_name, arg)
          unless arg_name == $PRM_MANY
            🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::String, arg) unless arg.set?
          else
            arg.∀ₓᵢ do |x, i|
              🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::String, x) unless x.set?
            end
          end
        end

        # @param [Symbol] arg_name
        # @param [*]      arg
        # @param [Symbol] normalization_checks (default{:none})
        #
        # @raise [WrongParamType]
        def 🛑str❓(arg_name, arg, normalization_checks=:none)
          unless arg_name == $PRM_MANY
            if normalization_checks != :none
              🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::String, arg) unless arg.str?(normalization_checks)
            else
              🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::String, arg) unless arg.str?
            end
          else
            if normalization_checks != :none
              arg.∀ₓᵢ do |x, i|
                🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::String, x) unless x.str?(normalization_checks)
              end
            else
              arg.∀ₓᵢ do |x, i|
                🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::String, x) unless x.str?
              end
            end
          end
        end

        # @param [Symbol] arg_name
        # @param [*]      arg
        #
        # @raise [WrongParamType]
        def 🛑hsh❓(arg_name, arg)
          unless arg_name == $PRM_MANY
            🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::String, arg) unless arg.hsh?
          else
            arg.∀ₓᵢ do |x, i|
              🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Hash, x) unless x.hsh?
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
            if normalization_checks != :none
              🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Integer, arg) unless arg.int?(normalization_checks)
            else
              🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Integer, arg) unless arg.int?
            end
          else
            if normalization_checks != :none
              arg.∀ₓᵢ do |x, i|
                🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Integer, x) unless x.int?(normalization_checks)
              end
            else
              arg.∀ₓᵢ do |x, i|
                🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Integer, x) unless x.int?
              end
            end
          end
        end

        # @param [Symbol] arg_name
        # @param [*]      arg
        #
        # @raise [WrongParamType]
        def 🛑θ❓(arg_name, arg)
          unless arg_name == $PRM_MANY
            🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::ThetaAngle, arg) unless arg.θ?
          else
            arg.∀ₓᵢ do |x, i|
              🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::ThetaAngle, x) unless x.θ?
            end
          end
        end

        # @param [Symbol] arg_name
        # @param [*]      arg
        #
        # @raise [WrongParamType]
        def 🛑flt❓(arg_name, arg)
          unless arg_name == $PRM_MANY
            🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Float, arg) unless arg.flt?
          else
            arg.∀ₓᵢ do |x, i|
              🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Float, x) unless x.flt?
            end
          end
        end

        # @param [Symbol] arg_name
        # @param [*]      arg
        # @param [Symbol] normalization_checks
        #
        # @raise [WrongParamType]
        def 🛑num❓(arg_name, arg, normalization_checks=:none)
          if normalization_checks != :none
            🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Math::Space::NumberSpace::ALL_NUMS, arg) unless arg.num?(normalization_checks)
          else
            🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Math::Space::NumberSpace::ALL_NUMS, arg) unless arg.num?
          end
        end

        # @param [Array]  args
        # @param [Symbol] normalization_checks
        #
        # @raise [WrongParamType]
        def 🛑nums❓(args, normalization_checks=:none)
          if normalization_checks != :none
            args.∀ₓᵢ do |x, i|
              🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, "[#{i.to_s}]{#{x.to_s}}-t{#{x.class.to_s}}", ::Math::Space::NumberSpace::ALL_NUMS, x) unless x.num?(normalization_checks)
            end
          else
            args.∀ₓᵢ do |x, i|
              🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, "[#{i.to_s}]{#{x.to_s}}-t{#{x.class.to_s}}", ::Math::Space::NumberSpace::ALL_NUMS, x) unless x.num?
            end
          end
        end

        # @param [Symbol] arg_name
        # @param [*]      arg
        #
        # @raise [WrongParamType]
        def 🛑ary❓(arg_name, arg)
          unless arg_name == $PRM_MANY
            🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Array, arg) unless arg.ary?
          else
            arg.∀ₓᵢ do |x, i|
              🛑 Ruuuby::ParamErr::throw(self.ⓣ, caller_locations(1, 1).first.base_label.to_s, "#{$PRM_MANY.to_s}[#{i.to_s}]", ::Array, x) unless x.ary?
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
  alias_method :🆔, :object_id
  ⨍_add_aliases(:freeze, [:❄️, :❄])
  ⨍_add_aliases(:frozen?, [:❄️?, :❄?])
  # | ------------------------------------------------------------------------------------------------------------------

end
