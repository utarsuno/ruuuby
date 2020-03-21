
# add various aliases/functions to existing class +File+, (aliased globally by +Kernel+'s function +📁+ and +📂+)
class ::File

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
