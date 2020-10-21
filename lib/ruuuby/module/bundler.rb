# encoding: UTF-8

# | useful cmd                         | purpose                          |
# | ---------------------------------- | -------------------------------- |
# | bundle clean (--dry-run) (--force) | "cleans up unused gems in your bundler directory" | https://bundler.io/man/bundle-clean.1.html |
# | bundle exec rake rdoc              | generate documentation coverage report            |
# | bundle exec rake release           | push git version tags and publish gem to Rubygems |
# | bundler check                      | |
#
# | env_var          | purpose                                    |
# | ---------------- | ------------------------------------------ |
# | `BUNDLE_GEMFILE` | designate the default/target gemfile to use |
module ::Bundler
  attribute_versionable('2.2.0.rc.2'){::Bundler::VERSION}

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

# archived resources

# 0x0) https://stackoverflow.com/questions/16376995/bundler-cannot-install-any-gems-without-sudo
