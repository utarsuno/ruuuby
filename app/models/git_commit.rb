
# -------------------------------------------- ⚠️ --------------------------------------------

class GitCommit < ApplicationRecord

  belongs_to :ruuuby_release, class_name: 'RuuubyRelease'

  # useful components for any expression parsing
  module Syntax
  end

  #include ::ApplicationRecord::ORMAttributeUID
  #include ::ApplicationRecord::ORMAttributeCache

  validates :commit_hash, presence: true
  validates :commit_author_date, presence: true
  validates :commit_subject, presence: true

  def self.spawn(commit_msg, release_timestamp, commit_hash, ruuuby_release)
    git_commit = GitCommit.create!(commit_subject: commit_msg, commit_author_date: release_timestamp, commit_hash: commit_hash)
    git_commit.save!
    ruuuby_release.git_commits << git_commit
    ruuuby_release.save!
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
