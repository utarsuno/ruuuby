# encoding: UTF-8

class ::Object

  # @param [String] version_expected
  #
  # @raise [ArgumentError]
  def attribute_versionable(version_expected, &block)
    🛑str❓('version_expected', version_expected)
    self.instance_variable_set("@version_expected", version_expected)

    self.define_singleton_method(:∃version?) do ||
      self.instance_variable_set("@version_current", block.call) if @version_current.nil?
      if @version_current == @version_expected
        return true
      else
        🛑 ::RuntimeError.new("{#{@version_current.to_s}}[#{@version_current.Ⓣ}] != {#{@version_expected.to_s}}[#{@version_expected.Ⓣ}]")
      end
    end

    class << self
      attr_reader :version_expected

      # @return [String]
      def version_current; self.∃version? if @version_current.nil?; @version_current; end
    end

    self
  end

end

# | useful cmd/template         | purpose                                                               |
# | --------------------------- | --------------------------------------------------------------------- |
# | `gem -v`                    | print current `RubyGems` version                                      |
# | `gem outdated -V`           | print gems which are not up to date w/ the latest version             |
# | `gem environment`           | |
# | `gem help commands`         | |
# | `gem list --local`          | |
# | `gem cleanup -V (--dryrun)` | remove local gems which out-dated (TODO: and checks if not-utilized?) |
# | `gem server`                | host interactive web-page at `http://0.0.0.0:8808` to see documentation for currently installed gems |
module ::Gem
  attribute_versionable('3.2.0.rc.2'){::Gem.rubygems_version.to_s}

  # TODO: automate -> https://rubygems.org/api/v1/versions/ruuuby/latest.json
end
