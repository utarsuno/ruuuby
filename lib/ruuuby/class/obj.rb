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

        alias_method :θ?, :theta_angle?

        # @param [String, Symbol] arg_name
        # @param [*]              arg
        #
        # @raise [WrongParamType]
        def 🛑bool❓(arg_name, arg)
          🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, [::FalseClass, ::TrueClass], arg) unless arg.bool?
        end

        # @param [*] args
        #
        # @raise [WrongParamType]
        def 🛑bools❓(args)
          args.∀ₓᵢ do |x, i|
            🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, "[#{i.to_s}]{#{x.to_s}}", [::FalseClass, ::TrueClass], x) unless x.bool?
          end
        end

        # @param [String, Symbol] arg_name
        # @param [*]              arg
        # @param [Symbol]         normalization_checks (default{:none})
        #
        # @raise [WrongParamType]
        def 🛑sym❓(arg_name, arg, normalization_checks=:none)
          if normalization_checks != :none
            🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Symbol, arg) unless arg.sym?(normalization_checks)
          else
            🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Symbol, arg) unless arg.sym?
          end
        end

        # @param [*]      args
        # @param [Symbol] normalization_checks (default{:none})
        #
        # @raise [WrongParamType]
        def 🛑syms❓(args, normalization_checks=:none)
          if normalization_checks != :none
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, "[#{i.to_s}]{#{x.to_s}}", ::Symbol, x) unless x.sym?(normalization_checks)
            end
          else
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, "[#{i.to_s}]{#{x.to_s}}", ::Symbol, x) unless x.sym?
            end
          end
        end

        # @param [String, Symbol] arg_name
        # @param [*]              arg
        #
        # @raise [WrongParamType]
        def 🛑set❓(arg_name, arg)
          🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::String, arg) unless arg.set?
        end

        # @param [*] args
        #
        # @raise [WrongParamType]
        def 🛑sets❓(args)
          args.∀ₓᵢ do |x, i|
            🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, "[#{i.to_s}]{#{x.to_s}}", ::String, x) unless x.set?
          end
        end

        # @param [String, Symbol] arg_name
        # @param [*]              arg
        # @param [Symbol]         normalization_checks (default{:none})
        #
        # @raise [WrongParamType]
        def 🛑str❓(arg_name, arg, normalization_checks=:none)
          if normalization_checks != :none
            🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::String, arg) unless arg.str?(normalization_checks)
          else
            🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::String, arg) unless arg.str?
          end
        end

        # @param [*]      args
        # @param [Symbol] normalization_checks (default{:none})
        #
        # @raise [WrongParamType]
        def 🛑strs❓(args, normalization_checks=:none)
          if normalization_checks != :none
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, "[#{i.to_s}]{#{x.to_s}}", ::String, x) unless x.str?(normalization_checks)
            end
          else
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, "[#{i.to_s}]{#{x.to_s}}", ::String, x) unless x.str?
            end
          end
        end

        # @param [String, Symbol] arg_name
        # @param [*]              arg
        #
        # @raise [WrongParamType]
        def 🛑hsh❓(arg_name, arg)
          🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Hash, arg) unless arg.hsh?
        end

        # @param [*] args
        #
        # @raise [WrongParamType]
        def 🛑hshs❓(args)
          args.∀ₓᵢ do |x, i|
            🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, "[#{i.to_s}]{#{x.to_s}}", ::Hash, x) unless x.hsh?
          end
        end

        # @param [String, Symbol] arg_name
        # @param [*]              arg
        # @param [Symbol]         normalization_checks
        #
        # @raise [WrongParamType]
        def 🛑int❓(arg_name, arg, normalization_checks=:none)
          if normalization_checks != :none
            🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Integer, arg) unless arg.int?(normalization_checks)
          else
            🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Integer, arg) unless arg.int?
          end
        end

        # @param [*]      args
        # @param [Symbol] normalization_checks
        #
        # @raise [WrongParamType]
        def 🛑ints❓(args, normalization_checks=:none)
          if normalization_checks != :none
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, "[#{i.to_s}]{#{x.to_s}}", ::Integer, x) unless x.int?(normalization_checks)
            end
          else
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, "[#{i.to_s}]{#{x.to_s}}", ::Integer, x) unless x.int?
            end
          end
        end

        # @param [String, Symbol] arg_name
        # @param [*]              arg
        #
        # @raise [WrongParamType]
        def 🛑θ❓(arg_name, arg)
          🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::ThetaAngle, arg) unless arg.θ?
        end


        # @param [*] args
        #
        # @raise [WrongParamType]
        def 🛑θs❓(args)
          args.∀ₓᵢ do |x, i|
            🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, "[#{i.to_s}]{#{x.to_s}}", ::ThetaAngle, x) unless x.θ?
          end
        end

        # @param [String, Symbol] arg_name
        # @param [*]              arg
        # @param [Symbol]         normalization_checks
        #
        # @raise [WrongParamType]
        def 🛑flt❓(arg_name, arg, normalization_checks=:none)
          if normalization_checks != :none
            🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Float, arg) unless arg.flt?(normalization_checks)
          else
            🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Float, arg) unless arg.flt?
          end
        end

        # @param [*]      args
        # @param [Symbol] normalization_checks
        #
        # @raise [WrongParamType]
        def 🛑flts❓(args, normalization_checks=:none)
          if normalization_checks != :none
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, "[#{i.to_s}]{#{x.to_s}}", ::Float, x) unless x.flt?(normalization_checks)
            end
          else
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, "[#{i.to_s}]{#{x.to_s}}", ::Float, x) unless x.flt?
            end
          end
        end

        # @param [String, Symbol] arg_name
        # @param [*]              arg
        # @param [Symbol]         normalization_checks
        #
        # @raise [WrongParamType]
        def 🛑num❓(arg_name, arg, normalization_checks=:none)
          if normalization_checks != :none
            🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Math::Space::NumberSpace::ALL_NUMS, arg) unless arg.num?(normalization_checks)
          else
            🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Math::Space::NumberSpace::ALL_NUMS, arg) unless arg.num?
          end
        end

        # @param [Array]  args
        # @param [Symbol] normalization_checks
        #
        # @raise [WrongParamType]
        def 🛑nums❓(args, normalization_checks=:none)
          if normalization_checks != :none
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, "[#{i.to_s}]{#{x.to_s}}", ::Math::Space::NumberSpace::ALL_NUMS, x) unless x.num?(normalization_checks)
            end
          else
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, "[#{i.to_s}]{#{x.to_s}}", ::Math::Space::NumberSpace::ALL_NUMS, x) unless x.num?
            end
          end
        end

        # @param [String, Symbol] arg_name
        # @param [*]              arg
        # @param [Symbol]         normalization_checks
        #
        # @raise [WrongParamType]
        def 🛑ary❓(arg_name, arg, normalization_checks=:none)
          if normalization_checks != :none
            🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Array, arg) unless arg.ary?(normalization_checks)
          else
            🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Array, arg) unless arg.ary?
          end
        end

        # @param [*]      args
        # @param [Symbol] normalization_checks
        #
        # @raise [WrongParamType]
        def 🛑arys❓(args, normalization_checks=:none)
          if normalization_checks != :none
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, "[#{i.to_s}]{#{x.to_s}}", ::Array, x) unless x.ary?(normalization_checks)
            end
          else
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, "[#{i.to_s}]{#{x.to_s}}", ::Array, x) unless x.ary?
            end
          end
        end

        # @param [String] arg_name
        # @param [*]      arg
        #
        # @raise [WrongParamType]
        def 🛑matrix❓(arg_name, arg)
          🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Matrix, arg) unless arg.matrix?
        end

        # @param [String] arg_name
        # @param [*]      arg
        #
        # @raise [WrongParamType]
        def 🛑vec❓(arg_name, arg)
          🛑 ::Ruuuby::ParamErr::throw(self.class, caller_locations(1, 1).first.base_label.to_s, arg_name.to_s, ::Vector, arg) unless arg.vec?
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
  alias_method :❄️, :freeze
  alias_method :❄️?, :frozen?
  # | ------------------------------------------------------------------------------------------------------------------

end
