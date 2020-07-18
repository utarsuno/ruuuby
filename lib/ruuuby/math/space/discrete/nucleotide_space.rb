# coding: UTF-8

# mathematics related code
module ::Math

  # math related code that can be categorized under +Space+
  module Space

    class NucleotideSpace < ::Math::Space::TypesSpaceⓣ¹

      ALL_NUCLEOTIDES = [::Module, ::Class].❄️

      def initialize
        @space_type     = 'types'
        @symbol         = :🧬
        @num_dimensions = 1
      end

      def ∋ˢ?(the_obj); the_obj.ⓣ.ancestors.∋?(Singleton); end

      # @param [Symbol] kclass
      # @param [Class]  owner (default⟶Kernel)
      #
      # @return [Boolean]
      def ∃ᶜ?(kclass, owner=::Kernel)
        🛑sym❓('kclass', kclass)
        🛑 ::Ruuuby::DescriptiveStandardError.🆕(self, "provided param owner{#{owner.to_s}} must be a module but received type{#{owner.Ⓣ}}") unless owner.is_a?(::Module)
        owner.∃const?(kclass) && owner.const_get(kclass).instance_of?(::Class)
      end

      # @param [Symbol] kmodule
      # @param [Module, Class] owner (default⟶Kernel)
      #
      # @raise [ArgumentError]
      #
      # @return [Boolean]
      def ∃ᵐ?(kmodule, owner=::Kernel)
        🛑sym❓('kmodule', kmodule)
        🛑 ::Ruuuby::DescriptiveStandardError.🆕(self, "provided param owner{#{owner.to_s}} must be a module but received type{#{owner.Ⓣ}}") unless owner.is_a?(::Module)
        if owner.∃const?(kmodule)
          c = owner.const_get(kmodule)
          (c.instance_of?(::Module) && c.class == ::Module)
        else
          false
        end
      end

      # @param [Symbol] kmodule
      #
      # @raise [ArgumentError]
      #
      # @return [Boolean] true, if arg(`kmodule`) was found as a global module
      def ∃ᴹ?(kmodule); self.∃ᵐ?(kmodule, ::Kernel); end

      #def ∋?(n); n.nucleotide?; end
      #def ∌?(n); !(self.∋?(n)); end

      include ::Singleton

    end

  end

end
