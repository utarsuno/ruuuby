
# add various aliases/functions to existing class +Dir+, (aliased globally by +Kernel+'s function +🗄️+)
class ::Dir

  # ---------------------------------------------------------------------------------------------------------- | *f04* |

  # @return [Boolean] true, if this directory does not exist or has zero contents
  def ∅? ; ::Dir.empty?(self.path) ; end
  # ---------------------------------------------------------------------------------------------------------- | *f12* |

  # @param [String] path (to a directory)
  #
  # @return [Boolean] true, if provided path exists and is a directory
  def self.∃?(path)
    🛑str❓(:path, path)
    ::File.directory?(path)
  end

  # @type [Array]
  PATHS_TO_NORMALIZE = %w(. .. .DS_Store).❄️

  # @return [Array]
  def η̂_paths ; self.⨍{|path| yield path if ::Dir::PATHS_TO_NORMALIZE.∌?(path)} ; end

  # | ------------------------------------------------------------------------------------------------------------------

end
