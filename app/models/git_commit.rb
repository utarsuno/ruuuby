# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

# provides an `ORM` representation of a GIT commit
class GitCommit < ApplicationRecord

  # _________________________________________________________________________________________________________________
  #      ___ ___  __     __       ___  ___  __
  #  /\   |   |  |__) | |__) |  |  |  |__  /__`
  # /~~\  |   |  |  \ | |__) \__/  |  |___ .__/
  # ________________________________________________________________________________________________________________ */

  # useful components for any expression parsing
  module Syntax
    # @type [String]
    COMMIT_HASH = '(\d|[a-z]){40}'.❄️
  end

  include ::Comparable
  include ::Ruuuby::ORMAttribute::Includable::UID

  # _________________________________________________________________________________________________________________
  #  __   __
  # /  \ |__)  |\/|
  # \__/ |  \  |  |
  # ________________________________________________________________________________________________________________ */

  belongs_to :ruuuby_release, class_name: 'RuuubyRelease'

  validates :commit_hash, presence: true
  validates :commit_author_date, presence: true
  validates :commit_subject, presence: true

  validates_length_of :commit_author_date, :maximum => 32, :minimum => 16
  validates_length_of :commit_subject, :maximum => 128, :minimum => 5
  validates_length_of :commit_hash, :is => 40

  # @param [String]        commit_msg
  # @param [String]        release_timestamp
  # @param [String]        commit_hash
  # @param [RuuubyRelease] ruuuby_release
  #
  # @return [GitCommit]
  def self.spawn(commit_msg, release_timestamp, commit_hash, release_tag, ruuuby_release)
    🛑str❓($PRM_MANY, [commit_msg, release_timestamp, commit_hash])
    🛑 ArgumentError.new("c{GitCommit}-> m{spawn} got arg(commit_hash){#{commit_hash.to_s}} of type{#{commit_hash.Ⓣ}} which is not valid type or format for a commit hash") unless commit_hash.match?(::GitCommit.syntax_commit_hash)
    🛑 ArgumentError.new("c{GitCommit}-> m{spawn} got arg(release_timestamp){#{release_timestamp.to_s}} of type{#{release_timestamp.Ⓣ}} which is not valid type or format for a commit timestamp") unless release_timestamp.match?(::String.syntax_iso8601_normalizable)
    if release_tag.∅?
      git_commit = GitCommit.create!(commit_subject: commit_msg, commit_author_date: release_timestamp.as_iso8601, commit_hash: commit_hash, release_tag: nil)
    else
      🛑str❓(:release_tag, release_tag)
      git_commit = GitCommit.create!(commit_subject: commit_msg, commit_author_date: release_timestamp.as_iso8601, commit_hash: commit_hash, release_tag: release_tag)
    end
    git_commit.save!
    ruuuby_release.git_commits << git_commit
    ruuuby_release.save!
    git_commit
  end

  # _________________________________________________________________________________________________________________
  #   __   __   ___  __       ___  __   __   __
  #  /  \ |__) |__  |__)  /\   |  /  \ |__) /__`
  #  \__/ |    |___ |  \ /~~\  |  \__/ |  \ .__/
  # ________________________________________________________________________________________________________________ */

  def self.get_latest
    ::GitCommit.where('commit_author_date = ?', ::GitCommit.maximum('commit_author_date')).first
  end

  def self.query_get_newest_within_version(ruuuby_release)
    ::GitCommit.where('ruuuby_release_id = ?', ruuuby_release.id).sort{|a, b| a.commit_author_date <=> b.commit_author_date }
  end

  # @param [RuuubyRelease] them
  #
  # @raise [ArgumentError] if them is not a +GitCommit+
  #
  # @return [Integer] 1 for >, 0 for ==, -1 for <
  def <=>(them)
    if them.is_a?(::GitCommit)
      if self.ruuuby_release == them.ruuuby_release
        self.commit_author_date <=> them.commit_author_date
      else
        self.ruuuby_release <=> them.ruuuby_release
      end
    else
      nil
    end
  end

  # ----------------

  # @return [Boolean]
  def has_release_tag?; !(self.release_tag.∅?); end

  # ----------------

  def source_for_seed
    release = self.ruuuby_release
    source  = "@v#{release.vmajor.to_s}_#{release.vminor.to_s}_#{release.vtiny.to_s}"
    parsed_datetime = (self.commit_author_date.in_time_zone('Central Time (US & Canada)')).to_s.as_iso8601
    # TODO: INCORPORATE RELEASE_TAG INFO!
    source += ".spawn_git_commit('#{self.commit_subject}', '#{parsed_datetime}', '#{self.commit_hash}')"
    source
  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
