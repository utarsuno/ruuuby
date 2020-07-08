# encoding: UTF-8

module ::Ruuuby

  class BitwiseFlag

    attr_reader :len, :flags

    # @param [Array] flag_names
    def initialize(flag_names)
      @len  = flag_names.length
      @flags = {}
      flag_names.each_with_index{|scenario, index| @flags[scenario] = Integer(2.0 ** (index))}
    end

    # @return [Integer]
    def combined_val(*flag_names)
      total_val = 0
      flag_names.each{|flag_name| total_val += self[flag_name]}
      total_val
    end

    # @return [Integer]
    def [](flag_name)
      if @flags.key?(flag_name)
        @flags[flag_name]
      else
        raise "| c{BitwiseFlag}-> m{[]} does not have flag{#{flag_name.to_s}} but contains{#{@flag_names.to_s}} |"
      end
    end

    # @return [Boolean]
    def flag?(flag_name, flag_value)
      if @flags.key?(flag_name)
        (flag_value & @flags[flag_name]) != 0
      else
        raise "| c{BitwiseFlag}-> m{flag?} does not have flag{#{flag_name.to_s}} but contains{#{@flag_names.to_s}} |"
      end
    end

    # @return [String]
    def to_s
      as_str = '{'
      @flags.each{|flag_name, flag_value| as_str += "#{flag_name}: #{flag_value}, "}
      as_str = as_str.♻️⟵(', ')
      "#{as_str}}"
    end

  end

end
