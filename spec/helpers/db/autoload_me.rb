# encoding: UTF-8

$ruuuby = 💎
$ruuuby.engine.stats_ext['RUUUBY_ENV']     = 'dev'
$ruuuby.engine.stats_ext['RUUUBY_CONFIGS'] = 'configs_local/db/dev.yml'

require_relative '../../../lib/ruuuby/db/migrations/migration_ext'
require_relative '../../../lib/ruuuby/db/migrations/ruuuby_gem'
require_relative '../../../lib/ruuuby/db/migrations/env_vars'

$orm = 💎.engine.orm

class CreateMockData < RuuubyDBMigration
  def self.up
    create_table :mock_data do |t|
      t.string :mock_data, :null => false

      t.index :mock_data, unique: true
    end
  end
  def self.down
    ♻️index(:mock_data, :mock_data)
    ♻️table(:mock_data)
  end
end

class MockData < ApplicationRecord
  self.table_name= :mock_data
end

module HelpersDB

  def audit_feature(the_feature, feature_str, expected_num_feats, description)
    expect(the_feature.ⓣ).to eq(::RuuubyFeature)
    expect(the_feature.uid.ⓣ).to eq(::String)
    expect(the_feature.id.ⓣ).to eq(::Integer)
    expect(the_feature.description.ⓣ).to eq(::String)
    expect(the_feature.uid).to eq(feature_str)
    expect(feature_str.match?(::RuuubyFeature.syntax_uid)).to eq(true)
    expect(the_feature.description).to eq(description)
    expect(the_feature.ruuuby_feature_behaviors.length).to eq(expected_num_feats)
  end

  # @param [RuuubyRelease] the_version
  # @param [String]        version_str
  # @param [Integer]       num_gems_added
  # @param [Integer]       num_gems_updated
  def audit_version(the_version, version_str, num_gems_added, num_gems_updated)
    expect(the_version.ⓣ).to eq(::RuuubyRelease)
    expect(the_version.num_gems_added.ⓣ).to eq(::Integer)
    expect(the_version.num_gems_updated.ⓣ).to eq(::Integer)
    expect(the_version.id.ⓣ).to eq(::Integer)
    #expect(the_version.git_commits_count.ⓣ).to eq(::Integer)
    expect(the_version.uid).to eq(version_str)
    expect(version_str.match?(::RuuubyRelease.syntax_uid)).to eq(true)
    if the_version.released?
      #expect(the_version.git_commits_count > 0).to eq(true)
      #expect(the_version.has_release_tag?).to eq(true)
    else
      #expect(the_version.git_commits_count).to eq(0)
      #expect(the_version.has_release_tag?).to eq(false)
    end
    expect(the_version.num_gems_added).to eq(num_gems_added)
    expect(the_version.num_gems_updated).to eq(num_gems_updated)
  end

  def audit_feature_behavior(the_feature, the_feature_behavior, uid, description)
    expect(the_feature_behavior.ⓣ).to eq(::RuuubyFeatureBehavior)
    expect(the_feature_behavior.uid.ⓣ).to eq(::String)
    expect(the_feature_behavior.description.ⓣ).to eq(::String)
    expect(the_feature_behavior.uid).to eq(uid)
    expect(the_feature_behavior.description).to eq(description)
    expect(the_feature_behavior.ruuuby_feature).to eq(the_feature)
    expect(the_feature.∋?(the_feature_behavior)).to eq(true)
  end

end

RSpec.shared_context 'shared_context_db' do
  let(:data_git_hash){'0123456789012345678901234567890123456789'}
  let(:data_git_author_date){'2019-12-31T18:03:39-06:00'}
  let(:data_git_author_date_older){'2019-12-31T18:03:39-06:00'}
  let(:data_git_author_date_oldest){'2018-12-13T18:03:49-06:00'}
  let(:data_git_author_date_newer){'2020-11-31T18:03:39-06:00'}
  let(:data_git_author_date_wo_normalization){'2019-12-31 18:03:39 -0600'}
end
