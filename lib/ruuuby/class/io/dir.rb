
# add various aliases/functions to existing class +Dir+, ()aliased globally by +Kernel+'s function +🗄️+)
class ::Dir

  # ---------------------------------------------------------------------------------------------------------- | *f12* |

  # @param [String] path (to a directory)
  #
  # @return [Boolean] true, if provided path exists and is a directory
  def self.∃?(path)
    🛑str❓(:path, path)
    ::File.directory?(path)
  end

  # | ------------------------------------------------------------------------------------------------------------------

end
