
require_relative 'db'
require_relative '../db/seeds/ruuuby_features'
require_relative '../db/seeds/ruuuby_releases'
require_relative '../db/seeds/git_commits'

# TODO: for v0.0.29, automate working with this file, v0.0.28 automated the previous step of updating the file `db/seeds/git_commits.rb`
@v0_0_25.released!
@v0_0_26.released!
@v0_0_27.released!
@v0_0_28.released!(false)

# TODO: FOR v0.0.29? (), ADD OBJECT/FUNC TO GATHER ALL RELEASES AND THEN PRINT OUT CHANGELOG
# (to remove code below)

=begin
puts "PRINTING DOCS"
@v0_0_28.docs_changelog.each do |line|
  puts line
end
=end
