# encoding: UTF-8

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
  # @param [Boolean]       audit_tag_version_match
  def audit_version(the_version, version_str, num_gems_added, num_gems_updated, audit_tag_version_match=true)
    expect(the_version.ⓣ).to eq(::RuuubyRelease)
    expect(the_version.num_gems_added.ⓣ).to eq(::Integer)
    expect(the_version.num_gems_updated.ⓣ).to eq(::Integer)
    expect(the_version.id.ⓣ).to eq(::Integer)
    expect(the_version.git_commits_count.ⓣ).to eq(::Integer)
    expect(the_version.uid).to eq(version_str)
    expect(version_str.match?(::RuuubyRelease.syntax_uid)).to eq(true)
    if the_version.released?
      expect(the_version.git_commits_count > 0).to eq(true)
      expect(the_version.has_release_tag?).to eq(true)
      if audit_tag_version_match
        the_git_commit = the_version.get_release_commit
        expect(the_git_commit.ⓣ).to eq(::GitCommit)
        expect(the_git_commit.has_release_tag?).to eq(true)
        expect(the_git_commit.commit_subject.∋?(version_str)).to eq(true)
        expect(the_git_commit.release_tag.∋?(version_str)).to eq(true)
      end
    else
      expect(the_version.git_commits_count).to eq(0)
      expect(the_version.has_release_tag?).to eq(false)
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

  let(:v0_0_0){::RuuubyRelease.find_by_uid(0, 0, 0)}
  let(:v0_0_1){::RuuubyRelease.find_by_uid(0, 0, 1)}
  let(:v0_0_2){::RuuubyRelease.find_by_uid(0, 0, 2)}
  let(:v0_0_3){::RuuubyRelease.find_by_uid(0, 0, 3)}
  let(:v0_0_4){::RuuubyRelease.find_by_uid(0, 0, 4)}
  let(:v0_0_5){::RuuubyRelease.find_by_uid(0, 0, 5)}
  let(:v0_0_6){::RuuubyRelease.find_by_uid(0, 0, 6)}
  let(:v0_0_7){::RuuubyRelease.find_by_uid(0, 0, 7)}
  let(:v0_0_8){::RuuubyRelease.find_by_uid(0, 0, 8)}
  let(:v0_0_9){::RuuubyRelease.find_by_uid(0, 0, 9)}
  let(:v0_0_10){::RuuubyRelease.find_by_uid(0, 0, 10)}
  let(:v0_0_11){::RuuubyRelease.find_by_uid(0, 0, 11)}
  let(:v0_0_12){::RuuubyRelease.find_by_uid(0, 0, 12)}
  let(:v0_0_13){::RuuubyRelease.find_by_uid(0, 0, 13)}
  let(:v0_0_14){::RuuubyRelease.find_by_uid(0, 0, 14)}
  let(:v0_0_15){::RuuubyRelease.find_by_uid(0, 0, 15)}
  let(:v0_0_16){::RuuubyRelease.find_by_uid(0, 0, 16)}
  let(:v0_0_17){::RuuubyRelease.find_by_uid(0, 0, 17)}
  let(:v0_0_18){::RuuubyRelease.find_by_uid(0, 0, 18)}
  let(:v0_0_19){::RuuubyRelease.find_by_uid(0, 0, 19)}
  let(:v0_0_20){::RuuubyRelease.find_by_uid(0, 0, 20)}
  let(:v0_0_21){::RuuubyRelease.find_by_uid(0, 0, 21)}
  let(:v0_0_22){::RuuubyRelease.find_by_uid(0, 0, 22)}
  let(:v0_0_23){::RuuubyRelease.find_by_uid(0, 0, 23)}
  let(:v0_0_24){::RuuubyRelease.find_by_uid(0, 0, 24)}
  let(:v0_0_25){::RuuubyRelease.find_by_uid(0, 0, 25)}
  let(:v0_0_26){::RuuubyRelease.find_by_uid(0, 0, 26)}
  let(:v0_0_27){::RuuubyRelease.find_by_uid(0, 0, 27)}
  let(:v0_0_28){::RuuubyRelease.find_by_uid(0, 0, 28)}
  let(:v0_0_29){::RuuubyRelease.find_by_uid(0, 0, 29)}
  let(:v0_0_30){::RuuubyRelease.find_by_uid(0, 0, 30)}
  let(:v0_0_31){::RuuubyRelease.find_by_uid(0, 0, 31)}
  let(:v0_0_32){::RuuubyRelease.find_by_uid(0, 0, 32)}
  let(:v0_0_33){::RuuubyRelease.find_by_uid(0, 0, 33)}
  let(:v0_0_34){::RuuubyRelease.find_by_uid(0, 0, 34)}
  let(:v0_0_35){::RuuubyRelease.find_by_uid(0, 0, 35)}
  let(:v0_0_36){::RuuubyRelease.find_by_uid(0, 0, 36)}
  let(:v0_0_37){::RuuubyRelease.find_by_uid(0, 0, 37)}
  let(:v0_0_38){::RuuubyRelease.find_by_uid(0, 0, 38)}
  let(:v0_0_39){::RuuubyRelease.find_by_uid(0, 0, 39)}
  let(:v0_0_40){::RuuubyRelease.find_by_uid(0, 0, 40)}
  let(:v0_0_41){::RuuubyRelease.find_by_uid(0, 0, 41)}
  let(:v0_0_42){::RuuubyRelease.find_by_uid(0, 0, 42)}
  let(:v0_0_43){::RuuubyRelease.find_by_uid(0, 0, 43)}
  let(:v0_0_44){::RuuubyRelease.find_by_uid(0, 0, 44)}
  let(:v0_0_45){::RuuubyRelease.find_by_uid(0, 0, 45)}
  let(:v0_0_46){::RuuubyRelease.find_by_uid(0, 0, 46)}
  let(:v0_0_47){::RuuubyRelease.find_by_uid(0, 0, 47)}
  let(:v0_0_48){::RuuubyRelease.find_by_uid(0, 0, 48)}

  let(:f00){::RuuubyFeature.find_by_uid(0)}
  let(:f00_b00){f00.ruuuby_feature_behaviors[0]}
  let(:f00_b01){f00.ruuuby_feature_behaviors[1]}

  let(:f01){::RuuubyFeature.find_by_uid(1)}
  let(:f01_b00){f01.ruuuby_feature_behaviors[0]}
  let(:f01_b01){f01.ruuuby_feature_behaviors[1]}
  let(:f01_b02){f01.ruuuby_feature_behaviors[2]}
  let(:f01_b03){f01.ruuuby_feature_behaviors[3]}
  let(:f01_b04){f01.ruuuby_feature_behaviors[4]}
  let(:f01_b05){f01.ruuuby_feature_behaviors[5]}

  let(:f02){::RuuubyFeature.find_by_uid(2)}
  let(:f03){::RuuubyFeature.find_by_uid(3)}

  let(:f04){::RuuubyFeature.find_by_uid(4)}
  let(:f04_b00){f04.ruuuby_feature_behaviors[0]}
  let(:f04_b01){f04.ruuuby_feature_behaviors[1]}
  let(:f04_b02){f04.ruuuby_feature_behaviors[2]}

  let(:f05){::RuuubyFeature.find_by_uid(5)}
  let(:f05_b00){f05.ruuuby_feature_behaviors[0]}
  let(:f05_b01){f05.ruuuby_feature_behaviors[1]}

  let(:f06){::RuuubyFeature.find_by_uid(6)}
  let(:f06_b00){f06.ruuuby_feature_behaviors[0]}
  let(:f06_b01){f06.ruuuby_feature_behaviors[1]}
  let(:f06_b02){f06.ruuuby_feature_behaviors[2]}
  let(:f06_b03){f06.ruuuby_feature_behaviors[3]}
  let(:f06_b04){f06.ruuuby_feature_behaviors[4]}
  let(:f06_b05){f06.ruuuby_feature_behaviors[5]}
  let(:f06_b06){f06.ruuuby_feature_behaviors[6]}
  let(:f06_b07){f06.ruuuby_feature_behaviors[7]}
  let(:f06_b08){f06.ruuuby_feature_behaviors[8]}
  let(:f06_b09){f06.ruuuby_feature_behaviors[9]}

  let(:f07){::RuuubyFeature.find_by_uid(7)}
  let(:f08){::RuuubyFeature.find_by_uid(8)}
  let(:f09){::RuuubyFeature.find_by_uid(9)}

  let(:f10){::RuuubyFeature.find_by_uid(10)}
  let(:f10_b00){f10.ruuuby_feature_behaviors[0]}
  let(:f10_b01){f10.ruuuby_feature_behaviors[1]}
  let(:f10_b02){f10.ruuuby_feature_behaviors[2]}
  let(:f10_b03){f10.ruuuby_feature_behaviors[3]}
  let(:f10_b04){f10.ruuuby_feature_behaviors[4]}
  let(:f10_b05){f10.ruuuby_feature_behaviors[5]}
  let(:f10_b06){f10.ruuuby_feature_behaviors[6]}
  let(:f10_b07){f10.ruuuby_feature_behaviors[7]}
  let(:f10_b08){f10.ruuuby_feature_behaviors[8]}

  let(:f11){::RuuubyFeature.find_by_uid(11)}
  let(:f11_b00){f11.ruuuby_feature_behaviors[0]}
  let(:f11_b01){f11.ruuuby_feature_behaviors[1]}
  let(:f11_b02){f11.ruuuby_feature_behaviors[2]}

  let(:f12){::RuuubyFeature.find_by_uid(12)}
  let(:f12_b00){f12.ruuuby_feature_behaviors[0]}
  let(:f12_b01){f12.ruuuby_feature_behaviors[1]}

  let(:f13){::RuuubyFeature.find_by_uid(13)}
  let(:f15){::RuuubyFeature.find_by_uid(15)}
  let(:f16){::RuuubyFeature.find_by_uid(16)}
  let(:f17){::RuuubyFeature.find_by_uid(17)}
  let(:f18){::RuuubyFeature.find_by_uid(18)}
  let(:f19){::RuuubyFeature.find_by_uid(19)}
  let(:f20){::RuuubyFeature.find_by_uid(20)}
  let(:f21){::RuuubyFeature.find_by_uid(21)}

  let(:f22){::RuuubyFeature.find_by_uid(22)}
  let(:f22_b00){f22.ruuuby_feature_behaviors[0]}
  let(:f22_b01){f22.ruuuby_feature_behaviors[1]}
  let(:f22_b02){f22.ruuuby_feature_behaviors[2]}
  let(:f22_b03){f22.ruuuby_feature_behaviors[3]}
  let(:f22_b04){f22.ruuuby_feature_behaviors[4]}
  let(:f22_b05){f22.ruuuby_feature_behaviors[5]}
  let(:f22_b06){f22.ruuuby_feature_behaviors[6]}

  let(:f23){::RuuubyFeature.find_by_uid(23)}

  let(:f24){::RuuubyFeature.find_by_uid(24)}
  let(:f24_b00){f24.ruuuby_feature_behaviors[0]}
  let(:f24_b01){f24.ruuuby_feature_behaviors[1]}
  let(:f24_b02){f24.ruuuby_feature_behaviors[2]}
  let(:f24_b03){f24.ruuuby_feature_behaviors[3]}

  let(:f25){::RuuubyFeature.find_by_uid(25)}

  let(:f26){::RuuubyFeature.find_by_uid(26)}
  let(:f26_b00){f26.ruuuby_feature_behaviors[0]}

  let(:f27){::RuuubyFeature.find_by_uid(27)}
  let(:f27_b00){f27.ruuuby_feature_behaviors[0]}
  let(:f27_b01){f27.ruuuby_feature_behaviors[1]}
  let(:f27_b02){f27.ruuuby_feature_behaviors[2]}
  let(:f27_b03){f27.ruuuby_feature_behaviors[3]}
  let(:f27_b04){f27.ruuuby_feature_behaviors[4]}
  let(:f27_b05){f27.ruuuby_feature_behaviors[5]}
  let(:f27_b06){f27.ruuuby_feature_behaviors[6]}
  let(:f27_b07){f27.ruuuby_feature_behaviors[7]}
  let(:f27_b08){f27.ruuuby_feature_behaviors[8]}
  let(:f27_b09){f27.ruuuby_feature_behaviors[9]}
  let(:f27_b10){f27.ruuuby_feature_behaviors[10]}

  let(:f28){::RuuubyFeature.find_by_uid(28)}
  let(:f28_b00){f28.ruuuby_feature_behaviors[0]}
  let(:f28_b01){f28.ruuuby_feature_behaviors[1]}
  let(:f28_b02){f28.ruuuby_feature_behaviors[2]}
  let(:f28_b03){f28.ruuuby_feature_behaviors[3]}
  let(:f28_b04){f28.ruuuby_feature_behaviors[4]}
  let(:f28_b05){f28.ruuuby_feature_behaviors[5]}
  let(:f28_b06){f28.ruuuby_feature_behaviors[6]}
  let(:f28_b07){f28.ruuuby_feature_behaviors[7]}
  let(:f28_b08){f28.ruuuby_feature_behaviors[8]}
  let(:f28_b09){f28.ruuuby_feature_behaviors[9]}
  let(:f28_b10){f28.ruuuby_feature_behaviors[10]}
  let(:f28_b11){f28.ruuuby_feature_behaviors[11]}
  let(:f28_b12){f28.ruuuby_feature_behaviors[12]}

  let(:f29){::RuuubyFeature.find_by_uid(29)}

  let(:f30){::RuuubyFeature.find_by_uid(30)}
  let(:f30_b00){f30.ruuuby_feature_behaviors[0]}
  let(:f30_b01){f30.ruuuby_feature_behaviors[1]}
  let(:f30_b02){f30.ruuuby_feature_behaviors[2]}
  let(:f30_b03){f30.ruuuby_feature_behaviors[3]}
  let(:f30_b04){f30.ruuuby_feature_behaviors[4]}

  let(:f31){::RuuubyFeature.find_by_uid(31)}
  let(:f31_b00){f31.ruuuby_feature_behaviors[0]}
  let(:f31_b01){f31.ruuuby_feature_behaviors[1]}

  let(:f32){::RuuubyFeature.find_by_uid(32)}
  let(:f32_b00){f32.ruuuby_feature_behaviors[0]}
  let(:f32_b01){f32.ruuuby_feature_behaviors[1]}
  let(:f32_b02){f32.ruuuby_feature_behaviors[2]}
  let(:f32_b03){f32.ruuuby_feature_behaviors[3]}
  let(:f32_b04){f32.ruuuby_feature_behaviors[4]}
  let(:f32_b05){f32.ruuuby_feature_behaviors[5]}
  let(:f32_b06){f32.ruuuby_feature_behaviors[6]}
  let(:f32_b07){f32.ruuuby_feature_behaviors[7]}
  let(:f32_b08){f32.ruuuby_feature_behaviors[8]}
  let(:f32_b09){f32.ruuuby_feature_behaviors[9]}
  let(:f32_b10){f32.ruuuby_feature_behaviors[10]}

  let(:f33){::RuuubyFeature.find_by_uid(33)}

  let(:f34){::RuuubyFeature.find_by_uid(34)}
  let(:f34_b00){f34.ruuuby_feature_behaviors[0]}
  let(:f34_b01){f34.ruuuby_feature_behaviors[1]}
  let(:f34_b02){f34.ruuuby_feature_behaviors[2]}
  let(:f34_b03){f34.ruuuby_feature_behaviors[3]}
  let(:f34_b04){f34.ruuuby_feature_behaviors[4]}

  let(:f35){::RuuubyFeature.find_by_uid(35)}
  let(:f35_b00){f35.ruuuby_feature_behaviors[0]}
  let(:f35_b01){f35.ruuuby_feature_behaviors[1]}
  let(:f35_b02){f35.ruuuby_feature_behaviors[2]}
  let(:f35_b03){f35.ruuuby_feature_behaviors[3]}

  let(:f36){::RuuubyFeature.find_by_uid(36)}
  let(:f36_b00){f36.ruuuby_feature_behaviors[0]}
  let(:f36_b01){f36.ruuuby_feature_behaviors[1]}
  let(:f36_b02){f36.ruuuby_feature_behaviors[2]}
  let(:f36_b03){f36.ruuuby_feature_behaviors[3]}
  let(:f36_b04){f36.ruuuby_feature_behaviors[4]}
  let(:f36_b05){f36.ruuuby_feature_behaviors[5]}
  let(:f36_b06){f36.ruuuby_feature_behaviors[6]}
  let(:f36_b07){f36.ruuuby_feature_behaviors[7]}

  let(:f37){::RuuubyFeature.find_by_uid(37)}
  let(:f37_b00){f37.ruuuby_feature_behaviors[0]}
  let(:f37_b01){f37.ruuuby_feature_behaviors[1]}
  let(:f37_b02){f37.ruuuby_feature_behaviors[2]}

  let(:f38){::RuuubyFeature.find_by_uid(38)}
  let(:f38_b00){f38.ruuuby_feature_behaviors[0]}
  let(:f38_b01){f38.ruuuby_feature_behaviors[1]}
  let(:f38_b02){f38.ruuuby_feature_behaviors[2]}
  let(:f38_b03){f38.ruuuby_feature_behaviors[3]}

  let(:f39){::RuuubyFeature.find_by_uid(39)}

  let(:f40){::RuuubyFeature.find_by_uid(40)}
  let(:f40_b00){f40.ruuuby_feature_behaviors[0]}
  let(:f40_b01){f40.ruuuby_feature_behaviors[1]}

  let(:f95){::RuuubyFeature.find_by_uid(95)}
  let(:f96){::RuuubyFeature.find_by_uid(96)}
  let(:f97){::RuuubyFeature.find_by_uid(97)}

  let(:f98){::RuuubyFeature.find_by_uid(98)}
  let(:f98_b00){f98.ruuuby_feature_behaviors[0]}
  let(:f98_b01){f98.ruuuby_feature_behaviors[1]}
  let(:f98_b02){f98.ruuuby_feature_behaviors[2]}

  let(:f99){::RuuubyFeature.find_by_uid(99)}

end
