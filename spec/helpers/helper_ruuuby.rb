
module RuuubyTestHelper

  CONFIG_OBJECT = {
      ruby: [:🛑bool❓, :🛑int❓, :🛑ary❓, :🛑str❓, :🛑stry❓, :🛑str_or_ary❓],
      c: [:int?, :str?, :stry?, :hsh?, :ary?, :bool?, :sym?],
      aliases: {
          object_id: :🆔,
          freeze: :❄️,
          frozen?: :❄️?
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
          ∀: :each,
          ∅?: :empty?,
          ∋?: :include?,
      },
  }

  CONFIG_NUMERIC = {
      aliases: {
          infinite?: :∞?
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
      ruby: [:📊, :∌?, :⊕, :∖, :≈, :end_with?, :start_with?, :ensure_start!, :ensure_ending!],
      c: [:remove_empty!, :disjunctive_union, :>>],
      aliases: {
          each: [:∀],
          uniq_to_me: :∖,
          include?: :∋?,
          empty?: :∅?
      }
  }

end
