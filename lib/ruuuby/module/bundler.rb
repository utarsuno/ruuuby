# encoding: UTF-8

# ⚠️: constant Gem::RubyGemsVersion is deprecated
#
# | useful cmd | purpose                          |
# | ---------- | -------------------------------- |
# | bundle clean (--dry-run) (--force) | "cleans up unused gems in your bundler directory" | https://bundler.io/man/bundle-clean.1.html |
#
# | env_var          | purpose                                    |
# | ---------------- | ------------------------------------------ |
# | `BUNDLE_GEMFILE` | designate the default/target gemfile to use |
module ::Bundler
  attribute_versionable('2.2.0.rc.1'){::Bundler::VERSION}

  # @return [Boolean]
  def self.healthy?
    if ::ENV['BUNDLE_GEMFILE'] == ::Bundler.path_gemfile
      if 💎.engine.os.mac?
        return !::Bundler.requires_sudo?
      elsif 💎.engine.os.unix
        return ::Bundler.requires_sudo?
      else
        🛑 ::RuntimeError.new("| {Bundler}-> m{healthy?} does not support the current OS |")
      end
    else
      return false
    end
  end

  def self.path_gemfile; "#{💎.engine.path_base}Gemfile"; end
end
