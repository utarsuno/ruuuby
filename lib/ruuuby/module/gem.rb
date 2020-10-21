# encoding: UTF-8

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
