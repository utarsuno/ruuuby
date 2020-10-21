# encoding: UTF-8

# add various aliases/functions to existing class +Dir+, (aliased globally by +Kernel+'s function +🗄️+)
class ::Dir

  # ---------------------------------------------------------------------------------------------------------- | *f04* |

  # @return [Boolean] true, if this directory does not exist or has zero contents
  def ∅?; ::Dir.empty?(self.path); end

  # ---------------------------------------------------------------------------------------------------------- | *f10* |
  alias_method :∀, :each_child

  # ---------------------------------------------------------------------------------------------------------- | *f12* |

  # @param [String] path (to a directory)
  #
  # @return [Boolean] true, if provided path exists and is a directory
  def self.∃?(path)
    🛑str❓(:path, path)
    ::File.directory?(path)
  end

  # @see https://stackoverflow.com/questions/2370702/one-liner-to-recursively-list-directories-in-ruby
  #
  # @param [Boolean] recursively
  def ∀_📁(recursively=false)
    if recursively
      ::Dir["#{self.path}**/*"].reject{|fn| ::File.directory?(fn)}
      #::Dir["#{self.path}**/*"]
    else
      self.∀{|path| yield path if ::File.file?("#{self.path}/#{path}")}
      #self.∀{|path| yield "#{self.path}/#{path}"}
      #self.∀{|path| yield path if ::File.file?(path)}
    end
  end

  # @param [Boolean] recursively
  def ∀_🗄️(recursively=false)
    #self.∀{|path| yield path if ::Dir.∃?("#{self.path}#{path}")}
    if recursively
      ::Dir["#{self.path}**/*"].reject{|fn| ::File.file?(fn)}
    else
      self.∀ do |path|
        full_path = "#{self.path}".ensure_ending!('/') + path
        if ::File.directory?(full_path)
          yield ::Dir.new(full_path)
        end
      end
      #self.∀{|path| yield ::Dir.new("#{self.path}#{path}") if ::File.directory?("#{self.path}".ensure_ending!('/') + path)}
    end
  end

  # | ------------------------------------------------------------------------------------------------------------------

  # @param [Boolean] recursively
  #
  # @raise [NotImplementedError]
  #
  # @return [String]
  def md5(recursively=false)
    if recursively
      results = []
      self.∀_🗄️ do |sub_dir|
        #dir = Dir.new("#{self.path}#{sub_dir}/")
        #results << [dir.md5(true), sub_dir]
        results << [sub_dir.md5(true), sub_dir.path]
      end
      results.sort!{|a, b| a[1] <=> b[1]}
      parsed = []
      results.each{|r| parsed << r[0]}
      parsed >> self.md5(false)
      ::Math::Crypto.md5(parsed.join)
    else
      results = []
      self.∀_📁(false) do |path|
        md5 = ::File.md5("#{self.path}".ensure_ending!('/') + path)
        results << [md5, path]
      end
      results.sort!{|a, b| a[1] <=> b[1]}
      results.map!{|e| e[0].to_s + e[1].to_s}
      results = results.join
      results << ::File.basename(self.path)
      ::Math::Crypto.md5(results)
    end
  end

  # @param [Dir, String] dir_or_path
  #
  # @raise [ArgumentError]
  #
  # @return [String, NilClass]
  def path_overlap(dir_or_path)
    #🛑 ArgumentError.new("| c{Dir}-> m{path_overlap} got arg(dir) w/ invalid type{#{dir.Ⓣ}}, expected{Dir} or{String} |") unless (dir_or_path.str? || dir_or_path.is_a?(::Dir))
    🛑 ::ArgErr.str(elf, 'dir_or_path', dir_or_path) unless (dir_or_path.str? || dir_or_path.is_a?(::Dir))
    sections_self = self.path.split('/')
    sections_them = dir_or_path.str? ? dir_or_path.split('/') : dir_or_path.path.split('/')
    them_str      = dir_or_path.str? ? dir_or_path : dir_or_path.path
    num_same      = 0
    if sections_self[0] == sections_them[0]
      num_same      = 1
      keep_checking = true
      while keep_checking
        if sections_self[num_same] == sections_them[num_same]
          num_same += 1
          if num_same == sections_self.length
            keep_checking = false
          end
        else
          keep_checking = false
        end
      end
    end

    if num_same == 0
      nil
    else
      result = sections_self[0...num_same].join('/')
      if result.end_with?('/')
        result
      else
        with_ending = result.dup.ensure_ending!('/')
        if self.path.start_with?(with_ending) && them_str.start_with?(with_ending)
          with_ending
        else
          result
        end
      end
    end
  end

  # @param [Dir, String] dir_or_path
  #
  # @raise [ArgumentError]
  #
  # @return [String, NilClass]
  def path_overlap_reversed(dir_or_path)
    #🛑 ArgumentError.new("| c{Dir}-> m{path_overlap} got arg(dir) w/ invalid type{#{dir.Ⓣ}}, expected{Dir} or{String} |") unless (dir_or_path.str? || dir_or_path.is_a?(::Dir))
    🛑 ::ArgErr.str(elf, 'dir_or_path', dir_or_path) unless (dir_or_path.str? || dir_or_path.is_a?(::Dir))
    sections_self = self.path.split('/')
    sections_them = dir_or_path.str? ? dir_or_path.split('/') : dir_or_path.path.split('/')
    them_str      = dir_or_path.str? ? dir_or_path : dir_or_path.path
    num_same      = 0
    if sections_self[-1] == sections_them[-1]
      num_same      = 1
      keep_checking = true
      while keep_checking && sections_them.length > num_same && sections_self.length > num_same
        if sections_self[-num_same - 1] == sections_them[-num_same - 1]
          num_same += 1
        else
          keep_checking = false
        end
      end
    end

    if num_same == 0
      nil
    else
      result = sections_self[(sections_self.length - num_same)...(sections_self.length)].join('/')
      result.ensure_enclosed_with!('/', '/')
    end
  end

end
