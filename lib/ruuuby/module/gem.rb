# encoding: UTF-8

# ⚠️: constant Gem::RubyGemsVersion is deprecated
#
# | useful cmd | purpose                          |
# | ---------- | -------------------------------- |
# | `gem -v`   | print current `RubyGems` version |
# | gem outdated | | |
# | gem environment | | |
# | gem help commands | | |
# gem cleanup --dryrun
# gem list --local
module ::Gem
  attribute_versionable('3.2.0.rc.1'){::Gem.rubygems_version.to_s}
end
