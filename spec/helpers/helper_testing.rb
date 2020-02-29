
module GeneralTestHelper

  def expect_response_to(responder, response_to)
    expect(responder.respond_to?(response_to)).to eq(true)
  end

  def throw_wrong_param_type(the_class, the_method, arg_name, received_type, expected_types)
    raise_error(ArgumentError, Ruuuby::ParamErr::generate_error_text(the_class, the_method, arg_name, received_type, expected_types))
  end
end
