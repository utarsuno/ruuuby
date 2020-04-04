
# -------------------------------------------- ⚠️ --------------------------------------------

module ::Ruuuby

  class RuuubyAPI
    include Singleton

    def path_base ; @path_base ||= File.dirname⁴(__FILE__) ; end

    def path_lib ; self.path_base + '/lib' ; end

    def prepare_for_version_update
      version_next = RuuubyRelease.get_next_version_uid
      version_next = version_next[1..version_next.length]

      version_curr = RuuubyRelease.get_latest_version_uid
      version_curr = version_curr[1..version_curr.length]

      puts "Ruuuby's current-version{#{version_curr}}, the next version is{#{version_next}}"
      self.api_routine_update_version_file(version_curr, version_next)
      self.api_routine_update_readme_file(version_curr, version_next)
    end

    # ---

    def api_routine_update_version_file(version_current, version_next)
      self.api_routine_update_file(
          self.path_lib + '/ruuuby/version.rb',
          "VERSION = '#{version_current}'.freeze",
          "VERSION = '#{version_next}'.freeze",
          1
      )
    end

    def api_routine_update_readme_file(version_current, version_next)
      self.api_routine_update_file(
          self.path_base + '/README.md',
          "| `gem 'ruuuby', '~> #{version_current}'`",
          "| `gem 'ruuuby', '~> #{version_next}'`",
          1
      )
    end

    def api_routine_update_file(path_file, the_expr, the_replacement, num_matches)
      print "Ensuring file{#{path_file}} is ready for release..."
      num_matched = ::File.replace_expr_with(path_file, the_expr, the_replacement, num_matches)
      if num_matched >= num_matches
        puts "updated, done!"
      else
        puts "done!"
      end
    end

  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
