
module RuuubyTestHelper

  module FeatureMath
    NUMERICAL_SETS = [:ℕ?, :ℤ?, :ℂ?, :ℚ?, :ℝ?, :𝕌?]
  end

  module Nums
    CONFIG_INTEGER = {
        ruby: [:finite?, :infinite?, :∞?] + RuuubyTestHelper::FeatureMath::NUMERICAL_SETS
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
        ruby: [:∞?] + RuuubyTestHelper::FeatureMath::NUMERICAL_SETS
    }
  end

  CONFIG_OBJECT = {
      ruby: [:🛑bool❓, :🛑🅱️❓, :🛑int❓, :🛑ary❓, :🛑str❓, :🛑stry❓, :🛑str_or_ary❓],
      c: [:int?, :str?, :stry?, :hsh?, :ary?, :bool?, :sym?],
      aliases: {
          object_id: :🆔,
          freeze: :❄️,
          frozen?: :❄️?,
          bool?: :🅱️?
      }
  }

  CONFIG_MODULE = {
      ruby: [:∃func_alias?, :∃func?],
      aliases: {
          private: :🙈,
          🙈constants⟶: :private_constant,
          ∃const?: :const_defined?,
          private_method_defined?: :∃🙈func?
      }
  }

  CONFIG_STRING = {
      ruby: [:∋?, :∌?, :∉?, :∈?, :ensure_start!, :ensure_ending!],
      c: [:>>],
      aliases: {∅?: :empty?}
  }

  CONFIG_NIL = {
      c: [:empty?],
      aliases: {∅?: :empty?}
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
      },
  }

  CONFIG_NUMERIC = {
      ruby: [:𝔹?, :∞?],
      aliases: {
          infinite?: :∞?,
          finite?: :𝕌?
      }
  }

  CONFIG_ENUMERABLE = {
      ruby: [:∌?],
      aliases: {
          map: :⨍
      }
  }

  CONFIG_SET = {
      ruby: [:remove_empty!],
      aliases: {
          empty?: :∅?,
          each: :∀,
          include?: :∋?,
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
          reverse_each: :↩️∀
      }
  }

end
