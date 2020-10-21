# encoding: UTF-8

# (`f14`)
class ArgErr < ::ArgumentError

  def initialize(the_self, arg_name, arg, required_types, optional_normalizer=:none)
    extra_text = ""
    if optional_normalizer != :none
      extra_text = " with additional requirement{#{optional_normalizer.to_s}}"
    end
    needed_types = required_types.ary? ? "allowed types are#{required_types.to_s}" : "required type is{#{required_types}}#{extra_text}"
    if the_self.class == ::Class
      #super("| c{#{the_self.to_s}}-> m{#{caller_locations(3, 1).first.base_label.to_s}} got arg(#{arg_name.to_s}) w/ type{#{arg.Ⓣ}}, when #{needed_types} |")
      super("| c{#{the_self.to_s}}-> m{#{caller_locations(1, 1).first}} got arg(#{arg_name.to_s}) w/ type{#{arg.Ⓣ}}, when #{needed_types} |")
    else
      super("| c{#{the_self.Ⓣ}}-> m{#{caller_locations(1, 1).first}} got arg(#{arg_name.to_s}) w/ type{#{arg.Ⓣ}}, when #{needed_types} |")
    end
  end

end

# (`f14`)
module ::Ruuuby

  class DescriptiveStandardError < StandardError

    # @param [*]      the_self
    # @param [String] the_error_message
    def initialize(the_self, the_error_message)
      super("| c{#{the_self.Ⓣ}}-> m{#{caller_locations(2, 1).first}} w/ self{#{the_self.to_s}} #{the_error_message} |")
    end
  end

end
