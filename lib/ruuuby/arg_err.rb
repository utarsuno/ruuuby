
module ::Ruuuby

  # +ParamErr+ is used for providing utilities to catching and raising parameter errors
  module ParamErr

    # utility function to generate exception(WrongParamType)
    #
    # @param [Symbol|String] name_class
    # @param [Symbol|String] the_method
    # @param [Symbol|String] name_arg
    # @param [Class|Array]   arg_types_needed
    # @param [*]             arg_received
    #
    # @return [String]
    def self.throw(name_class, name_method, name_arg, arg_types_needed, arg_received)
      ParamErr::WrongParamType.new(self.generate_error_text(name_class, name_method, name_arg, arg_received.class, arg_types_needed))
    end

    # utility function to generate error message for the exception(WrongParamType)
    #
    # @param [Symbol|String] name_class
    # @param [Symbol|String] the_method
    # @param [Symbol|String] arg_name
    # @param [Class]         received_type
    # @param [Class|Array]   required_types
    #
    # @return [String]
    def self.generate_error_text(the_class, the_method, arg_name, received_type, required_types)
      arg_name = '0' if arg_name == nil
      if required_types.ary?
        "| c{#{the_class}}-> m{#{the_method.to_s}} got arg(#{arg_name.to_s}) w/ type{#{received_type.to_s}}, allowed-types[#{required_types.join(', ')}] |"
      else
        "| c{#{the_class}}-> m{#{the_method.to_s}} got arg(#{arg_name.to_s}) w/ type{#{received_type.to_s}}, required-type{#{required_types.to_s}} |"
      end
    end
  end

end
