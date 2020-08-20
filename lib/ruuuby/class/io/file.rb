# encoding: UTF-8

# add various aliases/functions to existing class +File+, (aliased globally by +Kernel+'s function{+📁+})
class ::File

  # TODO: all these characters should be valid for JavaScript: http://www.fileformat.info/info/charset/UTF-16/list.htm

  class << self
    alias_method :∅?, :empty?
  end

  # ---------------------------------------------------------------------------------------------------------- | *f04* |

  # @return [Boolean] true, if this file does not exist or has zero contents
  def ∅?; ::File.∅?(self.path); end

  # ---------------------------------------------------------------------------------------------------------- | *f12* |

  # TODO: missing coverage
  #
  # @param [String] path
  #
  # @raise [ArgumentError]
  #
  # @return [Boolean]
  def self.∃?(path)
    🛑str❓('path', path)
    ::File.file?(path)
  end

  # | ------------------------------------------------------------------------------------------------------------------

  # @param [String] the_path
  # @param [String] the_line
  # @param [String] expression
  def self.insert_line_before_expr(the_path, the_line, expression)
    🛑strs❓([the_path, the_line, expression], :∉∅)
    ::File.replace_expr_with!(the_path, expression, "#{the_line}\n#{expression}", 1)
  end

  # @param [String] the_path
  # @param [Array]  the_lines
  # @param [String] expression
  def self.insert_lines_before_expr(the_path, the_lines, expression)
    🛑strs❓([the_path, expression], :∉∅)
    🛑ary❓('the_lines', the_lines)
    combined_lines = ''
    the_lines.each do |line|
      combined_lines << "#{line}\n"
    end
    ::File.replace_expr_with!(the_path, expression, "#{combined_lines}#{expression}", 1)
  end

  # original source referenced from:
  # @see https://stackoverflow.com/questions/1274605/how-to-search-file-text-for-a-pattern-and-replace-it-with-a-given-value
  #
  # @param [String]  the_path
  # @param [String]  expression
  # @param [String]  replacement
  # @param [Integer] num_matches (default: 1)
  #
  # @return [Integer] -1 if an error occurred, 0 if there were no matches, otherwise n, (a positive int), for number of matches
  def self.replace_expr_with(the_path, expression, replacement, num_matches=1)
    🛑strs❓([the_path, expression, replacement], :∉∅)
    🛑int❓('num_matches', num_matches, :∈ℕ)
    num_matched = 0

    # TODO: NEED TO OPEN THE FILES WITH ENCODING SPECIFIED

    ::Tempfile.open(".#{::File.basename(the_path)}", ::File.dirname(the_path)) do |temp_file|
      ::File.open(the_path).each do |line|
        if num_matched < num_matches
          if line.∋?(expression)
            temp_file.puts(line.gsub(expression, replacement))
            num_matched += 1
          else
            temp_file.puts(line)
          end
        else
          temp_file.puts(line)
        end
      end
      temp_file.fdatasync
      temp_file.close
      if num_matched > 0
        stats = ::File.stat(the_path)
        ::FileUtils.chown(stats.uid, stats.gid, temp_file.path)
        ::FileUtils.chmod(stats.mode, temp_file.path)
        ::FileUtils.mv(temp_file.path, the_path)
      else
        temp_file.delete
      end
    end
    return num_matched
  end

  # @param [String]  the_path
  # @param [String]  expression
  # @param [String]  replacement
  # @param [Integer] num_matches
  #
  # @raise [RuntimeError] if the expression provided was not found in any line of the file provided
  #
  # @return [Integer] 0 if there were no matches, otherwise n, (a positive int), for number of matches
  def self.replace_expr_with!(the_path, expression, replacement, num_matches)
    num_matched = ::File.replace_expr_with(the_path, expression, replacement, num_matches)
    if num_matched == 0
      🛑 ::RuntimeError.🆕("| c{File}-> m{replace_expr_with!} did not end up replacing any content |")
    else
      num_matched
    end
  end

  # @see https://ruby-doc.org/stdlib-2.6.1/libdoc/csv/rdoc/CSV.html
  module CSV

    # @param [String] path
    # @param [String] row_sep
    # @param [String] encoding
    #
    # @raise [ArgumentError]
    #
    # @return [Array]
    def self.read(path, row_sep=$/, encoding='US_ASCII')
      🛑strs❓([path, encoding, row_sep])
      ::CSV.read(path, {skip_blanks: true, headers: true, col_sep: ',', row_sep: row_sep, encoding: encoding})
    end

    # @param [String] path
    # @param [String] row_sep
    # @param [String] encoding
    #
    # @raise [ArgumentError]
    #
    # @return [Array]
    def self.read!(path, row_sep=$/, encoding='US_ASCII')
      🛑strs❓([path, encoding, row_sep])
      if ::File.∃?(path, true)
        ::CSV.read(path, {skip_blanks: true, headers: true, col_sep: ',', row_sep: row_sep, encoding: encoding})
      else
        🛑 ::ArgumentError.new("| c{File::CSV}-> m{read!} received arg(path) w/ val{#{path}} which is not a valid file reference |")
      end
    end

  end # end: {CSV}

  # @see https://ruby-doc.org/stdlib-2.7.1/libdoc/yaml/rdoc/YAML.html
  module YAML

    # @param [String] path
    #
    # @raise [ArgumentError]
    #
    # @return [Hash]
    def self.read(path)
      🛑str❓('path', path)
      ::YAML.load_file(path)
    end

    # @param [String] path
    # @param [Array]  expected_sections
    #
    # @raise [ArgumentError]
    #
    # @return [Hash]
    def self.read!(path, expected_sections)
      🛑str❓('path', path)
      🛑ary❓('expected_sections', expected_sections)
      data = ::YAML.load_file(path)
      if (data.keys).≈≈(expected_sections)
        return data
      else
        🛑 ::RuntimeError.new("| c{File::YAML}-> m{read!} did not find sections{#{expected_sections.to_s}} at path{#{path.to_s}} |")
      end
    end

  end # end: {YAML}

end

# TODO: simple file user/group permission checks/fixes

# TODO: https://askubuntu.com/questions/49184/sudo-chown-r-rootmyusername-var-lib-php-session-what-should-i-put-in-usernam
# TODO: https://phoenixnap.com/kb/linux-file-permissions
# TODO: https://stackoverflow.com/questions/16376995/bundler-cannot-install-any-gems-without-sudo
#
