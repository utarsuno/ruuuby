
# -------------------------------------------- ⚠️ --------------------------------------------

class GitCommit < ApplicationRecord

  belongs_to :ruuuby_release, class_name: 'RuuubyRelease'

  # useful components for any expression parsing
  module Syntax
  end

  #include ::ApplicationRecord::ORMAttributeUID
  #include ::Ruuuby::Attribute::Includable::SyntaxCache

  validates :commit_hash, presence: true
  validates :commit_author_date, presence: true
  validates :commit_subject, presence: true

  validates_length_of :commit_author_date, :maximum => 64, :minimum => 20
  validates_length_of :commit_subject, :maximum => 64, :minimum => 5
  validates_length_of :commit_hash, :is => 40

  # @param [String]        commit_msg
  # @param [String]        release_timestamp
  # @param [String]        commit_hash
  # @param [RuuubyRelease] ruuuby_release
  #
  # @return [GitCommit]
  def self.spawn(commit_msg, release_timestamp, commit_hash, ruuuby_release)
    git_commit = GitCommit.create!(commit_subject: commit_msg, commit_author_date: release_timestamp, commit_hash: commit_hash)
    git_commit.save!
    ruuuby_release.git_commits << git_commit
    ruuuby_release.save!
    git_commit
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
