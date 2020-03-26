
# add various aliases/functions to existing class +File+, (aliased globally by +Kernel+'s function +📁+ and +📂+)
class ::File
  extend(::Ruuuby::StaticAttributeSyntaxCache)

  # useful components for building `Regular Expressions`
  module Syntax

    # commonly used file meta-data
    module SourceCode

      # commonly used *C* file meta-data
      module C
        # @type [String]
        CODE   = '.c'.❄️

        # @type [String]
        HEADER = '.h'.❄️

        # @type [Array]
        ALL    = [CODE, HEADER].❄️

        ❄️
      end

      # commonly used *Ruby* file meta-data
      module Ruby
        # @type [String]
        CODE = '.rb'.❄️

        # @type [Array]
        ALL  = [CODE].❄️

        ❄️
      end

      ❄️
    end

  end

  # ---------------------------------------------------------------------------------------------------------- | *f04* |

  # @return [Boolean] true, if this file does not exist or has zero contents
  def ∅? ; ::File.empty?(self.path) ; end
  # ---------------------------------------------------------------------------------------------------------- | *f12* |

  # @param [String] path (to a non-directory file)
  #
  # @raise [WrongParamType]
  #
  # @return [Boolean] true, if provided path exists and is a file
  def self.∃?(path)
    🛑str❓(:path, path)
    # TODO: add param(follow_symbolic_links=true)
    ::File.file?(path)
  end

  # @param [String] path
  #
  # @raise [WrongParamType]
  #
  # @return [String]
  def self.dirname²(path)
    🛑str❓(:path, path)
    File.dirname(File.dirname(path))
  end

  # @param [String] path
  #
  # @raise [WrongParamType]
  #
  # @return [String]
  def self.dirname³(path)
    🛑str❓(:path, path)
    File.dirname(File.dirname(File.dirname(path)))
  end

  # | ------------------------------------------------------------------------------------------------------------------
end
