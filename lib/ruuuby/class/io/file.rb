# encoding: UTF-8

# add various aliases/functions to existing class +File+, (aliased globally by +Kernel+'s function{+📁+})
#
# `Ruuuby` modifications to existing `Ruby` class{+File+} | can be aliased w/ `📁`
#
# helpful CLI commands:
# --------------------------------------------------------------------------------------------------------
# | scenario                          | command/template/example                              | source   |
# | --------------------------------- | ----------------------------------------------------- | -------- |
# | get file size in bytes             | `stat --printf="%s" PATH_TO_FILE`                     | 0x0      |
# | with full path, extract portion   | File methods: basename, extname, dirname (see source) | 0x1      |
class ::File
  attribute_lazy_loadable('tempfile', false)

  # TODO: all these characters should be valid for JavaScript: http://www.fileformat.info/info/charset/UTF-16/list.htm

  class << self
    alias_method :∅?, :empty?
  end

  module Syntax
    # expression from: https://stackoverflow.com/questions/6416065/c-sharp-regex-for-file-paths-e-g-c-test-test-exe/42036026#42036026
    #
    # @type [String]
    UNIX_PATH = '\/$|(^(?=\/)|^\.|^\.\.|^\~|^\~(?=\/))(\/(?=[^/\0])[^/\0]+)*\/?'
  end

  include ::Ruuuby::Attribute::Includable::SyntaxCache

  # ---------------------------------------------------------------------------------------------------------- | *f04* |

  # @return [Boolean] true, if this file does not exist or has zero contents
  def ∅?; ::File.∅?(self.path); end

  # ---------------------------------------------------------------------------------------------------------- | *f12* |

  # @param [String] path
  #
  # @raise [ArgumentError, RuntimeError]
  #
  # @return [String]
  def self.md5(path); ::Math::Crypto.md5(::File.read(path)) if self.∃!(path); end

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

  def self.∄?(path); !self.∃?(path); end

  # @param [String] path
  #
  # @raise [ArgumentError]
  #
  # @return [Boolean]
  def self.∃!(path)
    🛑str❓('path', path)
    🛑 ::RuntimeError.new("| c{File}-> m{∃!} got path{#{path}} which does not exist as a file |") unless ::File.file?(path)

    true
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

    self.ensure_lazy_loaded

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
      🛑 ::RuntimeError.new("| c{File}-> m{replace_expr_with!} did not end up replacing any content |")
    else
      num_matched
    end
  end

  # @see https://ruby-doc.org/stdlib-2.6.1/libdoc/csv/rdoc/CSV.html
  module CSV
    attribute_lazy_loadable('csv', false)

    # @param [String] path
    # @param [String] row_sep
    # @param [String] encoding
    #
    # @raise [ArgumentError]
    #
    # @return [Array]
    def self.read(path, row_sep=$/, encoding='US_ASCII')
      🛑strs❓([path, encoding, row_sep])
      self.ensure_lazy_loaded
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
      self.ensure_lazy_loaded
      if ::File.∃!(path)
        ::CSV.read(path, {skip_blanks: true, headers: true, col_sep: ',', row_sep: row_sep, encoding: encoding})
      end
    end

  end # end: {CSV}

  # @see https://ruby-doc.org/stdlib-2.7.1/libdoc/yaml/rdoc/YAML.html
  module YAML
    attribute_lazy_loadable('yaml', false)

    # @param [String] path
    #
    # @raise [ArgumentError]
    #
    # @return [Hash]
    def self.read(path)
      if ::File.∃?(path)
        self.ensure_lazy_loaded
        ::YAML.load_file(path)
      end
    end

    # @param [String] path
    # @param [Array]  expected_sections
    #
    # @raise [ArgumentError]
    #
    # @return [Hash]
    def self.read!(path, expected_sections)
      if ::File.∃?(path)
        🛑ary❓('expected_sections', expected_sections)
        self.ensure_lazy_loaded
        data = ::YAML.load_file(path)
        if (data.keys).≈≈(expected_sections)
          return data
        else
          🛑 ::RuntimeError.new("| c{File::YAML}-> m{read!} did not find sections{#{expected_sections.to_s}} at path{#{path.to_s}} |")
        end
      end
    end

  end # end: {YAML}

  module JSON

    # @see https://makandracards.com/makandra/15611-how-to-fix-unexpected-token-error-for-json-parse
    # @see https://www.jvt.me/posts/2019/11/22/minify-json-ruby/
    #
    # @param [String]  path
    # @param [Boolean] output_as_string
    #
    # @raise [ArgumentError]
    #
    # @return [String, Hash]
    def self.read!(path, output_as_string=false)
      if ::File.∃?(path)
        🛑bool❓('output_as_string', output_as_string)
        self.ensure_lazy_loaded
        contents = ::JSON.parse(::File.read(path))
        return (output_as_string ? contents.to_json : contents)
      end
    end

  end

end

# TODO: simple file user/group permission checks/fixes

# TODO: https://askubuntu.com/questions/49184/sudo-chown-r-rootmyusername-var-lib-php-session-what-should-i-put-in-usernam
# TODO: https://phoenixnap.com/kb/linux-file-permissions

# resources
# 0x0) https://unix.stackexchange.com/questions/16640/how-can-i-get-the-size-of-a-file-in-a-bash-script
# 0x1) https://stackoverflow.com/questions/20793180/get-file-name-and-extension-in-ruby
