# encoding: UTF-8

# (`f14`)
module ::Ruuuby

  class DescriptiveStandardError < StandardError

    # @param [*]      the_self
    # @param [String] the_error_message
    def initialize(the_self, the_error_message)
      super("| c{#{the_self.Ⓣ}}-> m{#{caller_locations(2, 1).first.base_label.to_s}} w/ self{#{the_self.to_s}} #{the_error_message} |")
    end
  end

  class PrmErr < ::ArgumentError
    # @param [*]             the_self
    # @param [String]        arg_name
    # @param [String, Array] required_types
    # @param [*]             received_type
    def initialize(the_self, arg_name, required_types, received_type)
      arg_name = '0' if arg_name == nil
      if required_types.ary?
        super("| c{#{the_self.Ⓣ}}-> m{#{caller_locations(2, 1).first.base_label.to_s}} got arg(#{arg_name.to_s}) w/ type{#{received_type.to_s}}, allowed-types[#{required_types.join(', ')}] |")
      else
        super("| c{#{the_self.Ⓣ}}-> m{#{caller_locations(2, 1).first.base_label.to_s}} got arg(#{arg_name.to_s}) w/ type{#{received_type.to_s}}, required-type{#{required_types.to_s}} |")
      end
    end
  end # end definition of class{PrmErr}

  class PrmErrBool < ::ArgumentError
    # @param [*]             the_self
    # @param [String]        arg_name
    # @param [*]             received_type
    def initialize(the_self, arg_name, received_type)
      arg_name = '0' if arg_name == nil
      super("| c{#{the_self.Ⓣ}}-> m{#{caller_locations(3, 1).first.base_label.to_s}} got arg(#{arg_name.to_s}) w/ type{#{received_type.to_s}}, allowed-types{FalseClass, TrueClass} |")
    end
  end # end definition of class{PrmErrBool}

  class PrmErrSym < ::ArgumentError
    # @param [*]             the_self
    # @param [String]        arg_name
    # @param [*]             received_type
    def initialize(the_self, arg_name, received_type)
      arg_name = '0' if arg_name == nil
      super("| c{#{the_self.Ⓣ}}-> m{#{caller_locations(3, 1).first.base_label.to_s}} got arg(#{arg_name.to_s}) w/ type{#{received_type.to_s}}, required-type{Symbol} |")
    end
  end # end definition of class{PrmErrSym}

  class PrmErrSet < ::ArgumentError
    # @param [*]             the_self
    # @param [String]        arg_name
    # @param [*]             received_type
    def initialize(the_self, arg_name, received_type)
      arg_name = '0' if arg_name == nil
      super("| c{#{the_self.Ⓣ}}-> m{#{caller_locations(3, 1).first.base_label.to_s}} got arg(#{arg_name.to_s}) w/ type{#{received_type.to_s}}, required-type{Set} |")
    end
  end # end definition of class{PrmErrSym}

  class PrmErrStr < ::ArgumentError
    # @param [*]             the_self
    # @param [String]        arg_name
    # @param [*]             received_type
    def initialize(the_self, arg_name, received_type)
      arg_name = '0' if arg_name == nil
      super("| c{#{the_self.Ⓣ}}-> m{#{caller_locations(3, 1).first.base_label.to_s}} got arg(#{arg_name.to_s}) w/ type{#{received_type.Ⓣ}}, required-type{String} |")
    end
  end # end definition of class{PrmErrStr}

  class PrmErrHsh < ::ArgumentError
    # @param [*]             the_self
    # @param [String]        arg_name
    # @param [*]             received_type
    def initialize(the_self, arg_name, received_type)
      arg_name = '0' if arg_name == nil
      super("| c{#{the_self.Ⓣ}}-> m{#{caller_locations(3, 1).first.base_label.to_s}} got arg(#{arg_name.to_s}) w/ type{#{received_type.Ⓣ}}, required-type{Hash} |")
    end
  end # end definition of class{PrmErrHsh}

  class PrmErrAry < ::ArgumentError
    # @param [*]             the_self
    # @param [String]        arg_name
    # @param [*]             received_type
    def initialize(the_self, arg_name, received_type)
      arg_name = '0' if arg_name == nil
      super("| c{#{the_self.Ⓣ}}-> m{#{caller_locations(3, 1).first.base_label.to_s}} got arg(#{arg_name.to_s}) w/ type{#{received_type.Ⓣ}}, required-type{Array} |")
    end
  end # end definition of class{PrmErrHsh}

  class PrmErrInt < ::ArgumentError
    # @param [*]             the_self
    # @param [String]        arg_name
    # @param [*]             received_type
    def initialize(the_self, arg_name, received_type)
      arg_name = '0' if arg_name == nil
      super("| c{#{the_self.Ⓣ}}-> m{#{caller_locations(3, 1).first.base_label.to_s}} got arg(#{arg_name.to_s}) w/ type{#{received_type.Ⓣ}}, required-type{Integer} |")
    end
  end # end definition of class{PrmErrInt}

  class PrmErrFlt < ::ArgumentError
    # @param [*]             the_self
    # @param [String]        arg_name
    # @param [*]             received_type
    def initialize(the_self, arg_name, received_type)
      arg_name = '0' if arg_name == nil
      super("| c{#{the_self.Ⓣ}}-> m{#{caller_locations(3, 1).first.base_label.to_s}} got arg(#{arg_name.to_s}) w/ type{#{received_type.Ⓣ}}, required-type{Float} |")
    end
  end # end definition of class{PrmErrFlt}

  class PrmErrThetaAngle < ::ArgumentError
    # @param [*]             the_self
    # @param [String]        arg_name
    # @param [*]             received_type
    def initialize(the_self, arg_name, received_type)
      arg_name = '0' if arg_name == nil
      super("| c{#{the_self.Ⓣ}}-> m{#{caller_locations(3, 1).first.base_label.to_s}} got arg(#{arg_name.to_s}) w/ type{#{received_type.Ⓣ}}, required-type{ThetaAngle} |")
    end
  end # end definition of class{PrmErrThetaAngle}

  class PrmErrMatrix < ::ArgumentError
    # @param [*]             the_self
    # @param [String]        arg_name
    # @param [*]             received_type
    def initialize(the_self, arg_name, received_type)
      arg_name = '0' if arg_name == nil
      super("| c{#{the_self.Ⓣ}}-> m{#{caller_locations(3, 1).first.base_label.to_s}} got arg(#{arg_name.to_s}) w/ type{#{received_type.Ⓣ}}, required-type{Matrix} |")
    end
  end # end definition of class{PrmErrMatrix}

  class PrmErrVec < ::ArgumentError
    # @param [*]             the_self
    # @param [String]        arg_name
    # @param [*]             received_type
    def initialize(the_self, arg_name, received_type)
      arg_name = '0' if arg_name == nil
      super("| c{#{the_self.Ⓣ}}-> m{#{caller_locations(3, 1).first.base_label.to_s}} got arg(#{arg_name.to_s}) w/ type{#{received_type.Ⓣ}}, required-type{Vector} |")
    end
  end # end definition of class{PrmErrVec}

  class PrmErrNum < ::ArgumentError
    # @param [*]             the_self
    # @param [String]        arg_name
    # @param [*]             received_type
    def initialize(the_self, arg_name, received_type)
      arg_name = '0' if arg_name == nil
      super("| c{#{the_self.Ⓣ}}-> m{#{caller_locations(3, 1).first.base_label.to_s}} got arg(#{arg_name.to_s}) w/ type{#{received_type.Ⓣ}}, allowed-types{FalseClass, TrueClass} |")
    end
  end # end definition of class{PrmErrVec}

end
