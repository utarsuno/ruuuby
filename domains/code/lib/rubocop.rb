# utf-8

module ::RuboCop

  # @param [String] file_path
  #
  # @return [Boolean, Hash]
  def self.check_file(file_path)
    🛑str❓('file_path', file_path)
    # TODO: fix any potential relative path issues, also check if the file provided is actually a Ruby file lol
    cmd            = "rubocop -c ./.rubocop.yml --format json #{file_path}"
    output, errors = 💻(cmd, true)
    return false if output.∅?
    begin
      parsed = JSON.parse(output)
      return parsed
    rescue ::JSON::ParserError => err
      #raise err
      return false
    end
  end

  # @param [String] file_path
  #
  # @return [Boolean]
  def self.∃_offense?(file_path)
    data = self.check_file(file_path)
    return true if data == false
    data['summary']['offense_count'] > 0
  end

end
