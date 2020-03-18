
# add various aliases/functions to existing class +File+, (aliased globally by +Kernel+'s function +📁+ and +📂+)
class ::File

  # ---------------------------------------------------------------------------------------------------------- | *f12* |

  # @param [String] path (to a non-directory file)
  #
  # @return [Boolean] true, if provided path exists and is a file
  def self.∃?(path)
    🛑str❓(:path, path)
    ::File.file?(path)
  end

  # @param [String] path
  #
  # @return [String]
  def self.dirname²(path)
    File.dirname(File.dirname(path))
  end

  # @param [String] path
  #
  # @return [String]
  def self.dirname³(path)
    File.dirname(File.dirname(File.dirname(path)))
  end

  # | ------------------------------------------------------------------------------------------------------------------
end
