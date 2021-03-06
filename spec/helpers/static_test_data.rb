# encoding: UTF-8

class MockString < ::String; end # :nodoc:
class MockTrue < ::TrueClass; end # :nodoc:
class MockFalse < ::FalseClass; end # :nodoc:

# utilized for setting up additional, clearer, test scenarios
class QAClass

  class InnerClassDepth1 # :nodoc:
    class InnerClassDepth2 # :nodoc:
    end
    module InnerModuleDepth2 # :nodoc:
    end
  end

  module InnerModuleDepth1 # :nodoc:
    class InnerClassDepth2 # :nodoc:
    end
    module InnerModuleDepth2 # :nodoc:
    end
  end

end

# utilized for setting up additional, clearer, test scenarios
module QAModule

  class InnerClassDepth1 # :nodoc:
    class InnerClassDepth2 # :nodoc:
    end
    module InnerModuleDepth2 # :nodoc:
    end
  end

  module InnerModuleDepth1 # :nodoc:
    class InnerClassDepth2 # :nodoc:
    end
    module InnerModuleDepth2 # :nodoc:
    end
  end

end
