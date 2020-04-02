
RSpec.shared_context 'lets_language_deltas' do

  let(:cΔ_Integer){RuuubyTestHelper::Nums::CONFIG_INTEGER}
  let(:cΔ_Float){RuuubyTestHelper::Nums::CONFIG_FLOAT}
  let(:cΔ_NilClass){RuuubyTestHelper::CONFIG_NIL}
  let(:cΔ_Enumerable){RuuubyTestHelper::CONFIG_ENUMERABLE}
  let(:cΔ_Set){RuuubyTestHelper::CONFIG_SET}
  let(:cΔ_Array){RuuubyTestHelper::CONFIG_ARRAY}
  let(:cΔ_Hash){RuuubyTestHelper::CONFIG_HASH}
  let(:cΔ_Numeric){RuuubyTestHelper::CONFIG_NUMERIC}
  let(:cΔ_Module){RuuubyTestHelper::CONFIG_MODULE}
  let(:cΔ_Object){RuuubyTestHelper::CONFIG_OBJECT}
  let(:cΔ_Symbol){RuuubyTestHelper::CONFIG_SYMBOL}
  let(:cΔ_String){RuuubyTestHelper::CONFIG_STRING}

  def expect_added_ruby_methods(the_class, the_configs)
    the_configs[:ruby].∀{|c| expect(the_class.∃⨍?(c)).to eq(true)}
  end

  def expect_added_c_methods(the_class, the_configs)
    the_configs[:c].∀{|c| expect(the_class.∃⨍?(c)).to eq(true)}
  end

  def expect_added_method_aliases(the_class, the_configs)
    the_configs[:aliases].∀{|base_func, aliased_name| expect(the_class.∃⨍_alias?(base_func, aliased_name)).to eq(true)}
  end

  def throw_wrong_param_type(the_class, the_method, arg_name, received_type, expected_types)
    raise_error(ArgumentError, Ruuuby::ParamErr::generate_error_text(the_class, the_method, arg_name, received_type, expected_types))
  end

end

# TODO: ORM SHOULD BE ABLE TO DYNAMICALLY GENERATE THIS DATA ONCE ALL VERSION HISTORY IS TRACKED & ABSTRACTED
module RuuubyTestHelper

  module FeatureMath
    NUMERICAL_SETS = [:ℕ?, :ℤ?, :ℂ?, :ℚ?, :ℝ?, :𝕌?]
  end

  module Nums
    CONFIG_INTEGER = {
        ruby: [:finite?, :infinite?, :♾️?, :∞?, :∞ℂ?, :nan?, :¿?] + RuuubyTestHelper::FeatureMath::NUMERICAL_SETS
    }
    CONFIG_FLOAT = {
        ruby: RuuubyTestHelper::FeatureMath::NUMERICAL_SETS
    }
    CONFIG_RATIONAL = {
        ruby: RuuubyTestHelper::FeatureMath::NUMERICAL_SETS
    }
    CONFIG_COMPLEX = {
        ruby: RuuubyTestHelper::FeatureMath::NUMERICAL_SETS
    }
    CONFIG_BIG_DECIMAL = {
        ruby: RuuubyTestHelper::FeatureMath::NUMERICAL_SETS
    }
    CONFIG_NUMERIC = {
        ruby: [:∞?, :♾️?, :𝔹?] + RuuubyTestHelper::FeatureMath::NUMERICAL_SETS,
        aliases: {
            finite?: :𝕌?
        }
    }
  end

  module IO
    CONFIG_FILE = {
        ruby: [:∃?, :dirname², :dirname³]
    }

    CONFIG_DIR = {
        ruby: [:∃?]
    }
  end

  CONFIG_OBJECT = {
      ruby: [:🛑bool❓, :🛑🅱️❓, :🛑int❓, :🛑ary❓, :🛑str❓, :🛑stry❓, :🛑countable❓, :⁻¹, :⁻², :⁻³, :⁻⁴, :⁻⁵, :⁻⁶, :⁻⁷, :⁻⁸, :⁻⁹],
      c: [:int?, :str?, :stry?, :hsh?, :ary?, :bool?, :sym?],
      aliases: {
          object_id: :🆔,
          freeze: :❄️,
          frozen?: :❄️?,
          bool?: :🅱️?
      }
  }

  CONFIG_MODULE = {
      ruby: [:∃⨍_alias?, :∃⨍?],
      aliases: {
          private: :🙈,
          protected: :🛡️,
          🙈constants⟶: :private_constant,
          ∃const?: :const_defined?,
          private_method_defined?: :∃🙈func?
      }
  }

  CONFIG_METHOD = {
      aliases: {
          source_location: :🏠
      }
  }

  CONFIG_STRING = {
      ruby: [:∋?, :∌?, :∉?, :∈?, :ensure_start!, :ensure_ending!],
      c: [:>>],
      aliases: {
          ∅?: :empty?,
          𝔠: :length,
          ⬇️: :downcase,
          ⬇️!: :downcase!,
          ⬇: :downcase,
          ⬇!: :downcase!,
          🔡: :downcase,
          🔡!: :downcase!,
          ⬆️: :upcase,
          ⬆️: :upcase!,
          ⬆: :upcase,
          ⬆: :upcase!,
          🔠: :upcase!,
          🔠!: :upcase!,
      }
  }

  CONFIG_SYMBOL = {
      aliases: {
          ⬇️: :downcase,
          ⬇: :downcase,
          🔡: :downcase,
          ⬆️: :upcase,
          ⬆: :upcase,
          🔠: :upcase
      }
  }

  CONFIG_NIL = {
      c: [:empty?],
      aliases: {empty?: :∅?}
  }

  CONFIG_HASH = {
      aliases: {
          🔑?: :key?,
          ∃🔑?: :key?,
          🗝?: :key?,
          ∃🗝?: :key?,
          ∀: :each,
          ∅?: :empty?,
          ∋?: :include?,
          𝔠: :length
      },
  }

  CONFIG_NUMERIC = {
      ruby: [:𝔹?, :𝕌?, :∞?],
      aliases: {
          infinite?: :∞?,
          finite?: :𝕌?
      }
  }

  CONFIG_ENUMERABLE = {
      ruby: [:∌?],
      aliases: {
          map: :⨍,
          each_with_index: :∀ₓᵢ,
      }
  }

  CONFIG_SET = {
      ruby: [:remove_empty!],
      aliases: {
          empty?: :∅?,
          each: :∀,
          include?: :∋?,
          length: :𝔠
      }
  }

  CONFIG_ARRAY = {
      ruby: [:📊, :∌?, :⊕, :∖, :≈≈, :end_with?, :start_with?, :ensure_start!, :ensure_ending!],
      c: [:remove_empty!, :disjunctive_union, :equal_contents?, :frequency_counts, :>>],
      aliases: {
          each: [:∀],
          uniq_to_me: :∖,
          include?: :∋?,
          empty?: :∅?,
          reverse: :↩️,
          reverse!: :↩️!,
          reverse_each: :↩️∀,
          length: :𝔠,
      }
  }

end
