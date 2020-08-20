# coding: UTF-8

# `Ruuuby` modifications to c(`Object`)
module ::Ruuuby

  # (not-final-design): attributes that are to be included/extended an absolute maximum of once per Class & Runtime
  module Feature

    # attributes that are to be included, not extended
    module Includable

      # defines the operations needed to support Feature(`f06`) that are applied to Class(`Object`)
      module ObjectF06

        # @param [String, Symbol] arg_name
        # @param [*]              arg
        #
        # @raise [ArgumentError]
        def 🛑bool❓(arg_name, arg); 🛑 ::Ruuuby::PrmErrBool.🆕(self, arg_name.to_s, arg) unless arg.bool?; end

        # @param [*] args
        #
        # @raise [ArgumentError]
        def 🛑bools❓(args)
          args.∀ₓᵢ do |x, i|
            🛑 ::Ruuuby::PrmErrBool.🆕(self, "[#{i.to_s}]{#{x.to_s}}", x) unless x.bool?
          end
        end

        # @param [String, Symbol] arg_name
        # @param [*]              arg
        # @param [Symbol]         normalization_checks (default{:none})
        #
        # @raise [ArgumentError]
        def 🛑sym❓(arg_name, arg, normalization_checks=:none)
          if normalization_checks != :none
            🛑 ::Ruuuby::PrmErrSym.🆕(self, arg_name.to_s, arg) unless arg.sym?(normalization_checks)
          else
            🛑 ::Ruuuby::PrmErrSym.🆕(self, arg_name.to_s, arg) unless arg.sym?
          end
        end

        # @param [*]      args
        # @param [Symbol] normalization_checks (default{:none})
        #
        # @raise [ArgumentError]
        def 🛑syms❓(args, normalization_checks=:none)
          if normalization_checks != :none
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::PrmErrSym.🆕(self, "[#{i.to_s}]{#{x.to_s}}", x) unless x.sym?(normalization_checks)
            end
          else
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::PrmErrSym.🆕(self, "[#{i.to_s}]{#{x.to_s}}", x) unless x.sym?
            end
          end
        end

        # @param [String, Symbol] arg_name
        # @param [*]              arg
        #
        # @raise [ArgumentError]
        def 🛑set❓(arg_name, arg); 🛑 ::Ruuuby::PrmErrSet.🆕(self.class, arg_name.to_s, arg) unless arg.set?; end

        # @param [*] args
        #
        # @raise [ArgumentError]
        def 🛑sets❓(args)
          args.∀ₓᵢ do |x, i|
            🛑 ::Ruuuby::PrmErrSet.🆕(self.class, "[#{i.to_s}]{#{x.to_s}}", x) unless x.set?
          end
        end

        # @param [String, Symbol] arg_name
        # @param [*]              arg
        # @param [Symbol]         normalization_checks (default{:none})
        #
        # @raise [ArgumentError]
        def 🛑str❓(arg_name, arg, normalization_checks=:none)
          if normalization_checks != :none
            🛑 ::Ruuuby::PrmErrStr.🆕(self, arg_name.to_s, arg) unless arg.str?(normalization_checks)
          else
            🛑 ::Ruuuby::PrmErrStr.🆕(self, arg_name.to_s, arg) unless arg.str?
          end
        end

        # @param [*]      args
        # @param [Symbol] normalization_checks (default{:none})
        #
        # @raise [ArgumentError]
        def 🛑strs❓(args, normalization_checks=:none)
          if normalization_checks != :none
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::PrmErrStr.🆕(self, "[#{i.to_s}]{#{x.to_s}}", x) unless x.str?(normalization_checks)
            end
          else
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::PrmErrStr.🆕(self, "[#{i.to_s}]{#{x.to_s}}", x) unless x.str?
            end
          end
        end

        # @param [String, Symbol] arg_name
        # @param [*]              arg
        #
        # @raise [ArgumentError]
        def 🛑hsh❓(arg_name, arg); 🛑 ::Ruuuby::PrmErrHsh.🆕(self, arg_name.to_s, arg) unless arg.hsh?; end

        # @param [*] args
        #
        # @raise [ArgumentError]
        def 🛑hshs❓(args)
          args.∀ₓᵢ do |x, i|
            🛑 ::Ruuuby::PrmErrHsh.🆕(self, "[#{i.to_s}]{#{x.to_s}}", x) unless x.hsh?
          end
        end

        # @param [String, Symbol] arg_name
        # @param [*]              arg
        # @param [Symbol]         normalization_checks
        #
        # @raise [ArgumentError]
        def 🛑int❓(arg_name, arg, normalization_checks=:none)
          if normalization_checks != :none
            🛑 ::Ruuuby::PrmErrInt.🆕(self, arg_name.to_s, arg) unless arg.int?(normalization_checks)
          else
            🛑 ::Ruuuby::PrmErrInt.🆕(self, arg_name.to_s, arg) unless arg.int?
          end
        end

        # @param [*]      args
        # @param [Symbol] normalization_checks
        #
        # @raise [ArgumentError]
        def 🛑ints❓(args, normalization_checks=:none)
          if normalization_checks != :none
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::PrmErrInt.🆕(self, "[#{i.to_s}]{#{x.to_s}}", x) unless x.int?(normalization_checks)
            end
          else
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::PrmErrInt.🆕(self, "[#{i.to_s}]{#{x.to_s}}", x) unless x.int?
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
            🛑 ::Ruuuby::PrmErrFlt.🆕(self, arg_name.to_s, arg) unless arg.flt?(normalization_checks)
          else
            🛑 ::Ruuuby::PrmErrFlt.🆕(self, arg_name.to_s, arg) unless arg.flt?
          end
        end

        # @param [*]      args
        # @param [Symbol] normalization_checks
        #
        # @raise [ArgumentError]
        def 🛑flts❓(args, normalization_checks=:none)
          if normalization_checks != :none
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::PrmErrFlt.🆕(self, "[#{i.to_s}]{#{x.to_s}}", x) unless x.flt?(normalization_checks)
            end
          else
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::PrmErrFlt.🆕(self, "[#{i.to_s}]{#{x.to_s}}", x) unless x.flt?
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
            🛑 ::Ruuuby::PrmErrNum.🆕(self, arg_name.to_s, arg) unless arg.num?(normalization_checks)
          else
            🛑 ::Ruuuby::PrmErrNum.🆕(self, arg_name.to_s, arg) unless arg.num?
          end
        end

        # @param [Array]  args
        # @param [Symbol] normalization_checks
        #
        # @raise [ArgumentError]
        def 🛑nums❓(args, normalization_checks=:none)
          if normalization_checks != :none
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::PrmErrNum.🆕(self, "[#{i.to_s}]{#{x.to_s}}", x) unless x.num?(normalization_checks)
            end
          else
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::PrmErrNum.🆕(self, "[#{i.to_s}]{#{x.to_s}}", x) unless x.num?
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
            🛑 ::Ruuuby::PrmErrAry.🆕(self, arg_name.to_s, arg) unless arg.ary?(normalization_checks)
          else
            🛑 ::Ruuuby::PrmErrAry.🆕(self, arg_name.to_s, arg) unless arg.ary?
          end
        end

        # @param [*]      args
        # @param [Symbol] normalization_checks
        #
        # @raise [ArgumentError]
        def 🛑arys❓(args, normalization_checks=:none)
          if normalization_checks != :none
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::PrmErrAry.🆕(self, "[#{i.to_s}]{#{x.to_s}}", x) unless x.ary?(normalization_checks)
            end
          else
            args.∀ₓᵢ do |x, i|
              🛑 ::Ruuuby::PrmErrAry.🆕(self, "[#{i.to_s}]{#{x.to_s}}", x) unless x.ary?
            end
          end
        end

        # @param [String] arg_name
        # @param [*]      arg
        #
        # @raise [ArgumentError]
        def 🛑matrix❓(arg_name, arg); 🛑 ::Ruuuby::PrmErrMatrix.🆕(self, arg_name.to_s, arg) unless arg.matrix?; end

        # @param [String] arg_name
        # @param [*]      arg
        #
        # @raise [ArgumentError]
        def 🛑vec❓(arg_name, arg); 🛑 ::Ruuuby::PrmErrVec.🆕(self, arg_name.to_s, arg) unless arg.vec?; end

      end # end: f06

      # TODO: convert this into an optional refinement
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
  # ---------------------------------------------------------------------------------------------------------- | *f10* |

  # func{ⓣ} returns [Class]
  alias_method :ⓣ, :class

  # @return [String] this particular object's Class as a String
  def Ⓣ; self.class.to_s; end

  # ---------------------------------------------------------------------------------------------------------- | *f16* |
  include Ruuuby::Feature::Includable::ObjectF16
  alias_method :🆔, :object_id
  alias_method :❄️, :freeze
  alias_method :❄️?, :frozen?
  # | ------------------------------------------------------------------------------------------------------------------

  # @param [String] version_expected
  #
  # @raise [ArgumentError]
  def attribute_versionable(version_expected, &block)
    🛑str❓('version_expected', version_expected)
    self.instance_variable_set("@version_expected", version_expected)

    self.define_singleton_method(:∃version?) do ||
      self.instance_variable_set("@version_current", block.call) if @version_current.nil?
      if @version_current == @version_expected
        return true
      else
        🛑 ::RuntimeError.new("{#{@version_current.to_s}[#{@version_current.class.to_s}] != {#{@version_expected.to_s}}[#{@version_expected.class.to_s}]")
      end
    end

    class << self
      attr_reader :version_expected

      # @return [String]
      def version_current; self.∃version? if @version_current.nil?; @version_current; end
    end

    self
  end

end
