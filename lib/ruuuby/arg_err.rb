
module ::Ruuuby

  # +Err+ is used for providing utilities to catching and raising parameter errors
  module Err

    # utility function to generate exception(WrongParamType)
    #
    # @param [Symbol|String] name_class
    # @param [String]        name_arg
    # @param [*]             arg_received
    #
    # @return [WrongParamType] new instance of WrongParamType for type +String+
    def self.param¬str(name_class, name_arg, arg_received)
      WrongParamType::throw(name_class, caller_locations.first.label.to_s, name_arg, ::String, arg_received)
    end

    # utility function to generate exception(WrongParamType)
    #
    # @param [Symbol|String] name_class
    # @param [String]        name_arg
    # @param [*]             arg_received
    #
    # @return [WrongParamType] new instance of WrongParamType for type +String+ or +Symbol+
    def self.param¬stry(name_class, name_arg, arg_received)
      WrongParamType::throw(name_class, caller_locations.first.label.to_s, name_arg, [::Symbol, ::String], arg_received)
    end

    # utility function to generate exception(WrongParamType)
    #
    # @param [Symbol|String] name_class
    # @param [String]        name_arg
    # @param [*]             arg_received
    #
    # @return [WrongParamType] new instance of WrongParamType for type +Boolean+
    def self.param¬bool(name_class, name_arg, arg_received)
      WrongParamType::throw(name_class, caller_locations.first.label.to_s, name_arg, [::TrueClass, ::FalseClass], arg_received)
    end

    # utility function to generate exception(WrongParamType)
    #
    # @param [Symbol|String] name_class
    # @param [String]        name_arg
    # @param [*]             arg_received
    #
    # @return [WrongParamType] new instance of WrongParamType for type +Array+
    def self.param¬ary(name_class, name_arg, arg_received)
      WrongParamType::throw(name_class, caller_locations.first.label.to_s, name_arg, ::Array, arg_received)
    end

    # utility function to generate exception(WrongParamType)
    #
    # @param [Symbol|String] name_class
    # @param [String]        name_arg
    # @param [*]             arg_received
    #
    # @return [WrongParamType] new instance of WrongParamType for type +Module+
    def self.param¬module(name_class, name_arg, arg_received)
      WrongParamType::throw(name_class, caller_locations.first.label.to_s, name_arg, ::Module, arg_received)
    end

    # utility function to generate exception(WrongParamType)
    #
    # @param [Symbol|String] name_class
    # @param [String]        name_arg
    # @param [*]             arg_received
    #
    # @return [WrongParamType] new instance of WrongParamType for type +Class+
    def self.param¬class(name_class, name_arg, arg_received)
      WrongParamType::throw(name_class, caller_locations.first.label.to_s, name_arg, ::Class, arg_received)
    end

    # +WrongParamType+ extends +ArgumentError+ and provides a light wrapper for throwing more specific arg errors.
    #
    # fully-qualifying: +::Ruuuby::Err::WrongParamType+
    class WrongParamType < ArgumentError

      # utility function to generate error message for the exception(WrongParamType)
      #
      # @param [Symbol|String] name_class
      # @param [String]        the_method
      # @param [String]        arg_name
      # @param [Class]         received_type
      # @param [Class|Array]   required_types
      #
      # @return [String]
      def self.generate_error_text(the_class, the_method, arg_name, received_type, required_types)
        arg_name = '0' if arg_name == nil
        if required_types.ary?
          "| c{#{the_class}}-> m{#{the_method.to_s}} got arg(#{arg_name}) w/ type{#{received_type.to_s}}, allowed-types[#{required_types.join(', ')}] |"
        else
          "| c{#{the_class}}-> m{#{the_method.to_s}} got arg(#{arg_name}) w/ type{#{received_type.to_s}}, required-type{#{required_types.to_s}} |"
        end
      end

      # utility function to generate exception(WrongParamType)
      #
      # @param [Symbol|String] name_class
      # @param [String]        the_method
      # @param [String]        name_arg
      # @param [Class|Array]   arg_types_needed
      # @param [*]             arg_received
      #
      # @return [String]
      def self.throw(name_class, name_method, name_arg, arg_types_needed, arg_received)
        WrongParamType.new(self.generate_error_text(name_class, name_method, name_arg, arg_received.class, arg_types_needed))
      end

    end # end of Class(BadArgType)
  end # end of Module(Err)

end

