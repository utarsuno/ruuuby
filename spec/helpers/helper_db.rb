# encoding: UTF-8

module HelpersDB
  require_relative '../../db/seed'

  def audit_feature(the_feature, feature_str, description)
    expect(the_feature.class).to eq(RuuubyFeature)
    expect(the_feature.uid).to eq(feature_str)
    expect(feature_str.match?(::RuuubyFeature.syntax_uid)).to eq(true)
    expect(description.match?(::RuuubyFeature.syntax_docs_feature_mapping)).to eq(true)
    expect(the_feature.id.class).to eq(Integer)
    expect(the_feature.description).to eq(description)
    expect(the_feature.description.class).to eq(String)
  end

  def audit_version(the_version, version_str)
    expect(the_version.class).to eq(RuuubyRelease)
    expect(the_version.uid).to eq(version_str)
    expect(version_str.match?(::RuuubyRelease.syntax_uid)).to eq(true)
    expect(the_version.id.class).to eq(Integer)
    if the_version.is_released?
      expect(the_version.num_commits > 0).to eq(true)
    else
      expect(the_version.num_commits).to eq(0)
    end
  end

  def audit_feature_behavior(the_feature, the_feature_behavior, uid, description)
    expect(the_feature_behavior.class).to eq(::RuuubyFeatureBehavior)
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

  let(:re_ruuuby_feature){RuuubyFeature::Syntax}
  let(:re_ruuuby_release){RuuubyRelease::Syntax}

  let(:v0_0_0){RuuubyRelease.find_by_uid(0, 0, 0)}
  let(:v0_0_1){RuuubyRelease.find_by_uid(0, 0, 1)}
  let(:v0_0_2){RuuubyRelease.find_by_uid(0, 0, 2)}
  let(:v0_0_3){RuuubyRelease.find_by_uid(0, 0, 3)}
  let(:v0_0_18){RuuubyRelease.find_by_uid(0, 0, 18)}
  let(:v0_0_19){RuuubyRelease.find_by_uid(0, 0, 19)}
  let(:v0_0_20){RuuubyRelease.find_by_uid(0, 0, 20)}
  let(:v0_0_21){RuuubyRelease.find_by_uid(0, 0, 21)}
  let(:v0_0_22){RuuubyRelease.find_by_uid(0, 0, 22)}
  let(:v0_0_23){RuuubyRelease.find_by_uid(0, 0, 23)}
  let(:v0_0_24){RuuubyRelease.find_by_uid(0, 0, 24)}
  let(:v0_0_25){RuuubyRelease.find_by_uid(0, 0, 25)}
  let(:v0_0_26){RuuubyRelease.find_by_uid(0, 0, 26)}
  let(:v0_0_27){RuuubyRelease.find_by_uid(0, 0, 27)}
  let(:v0_0_28){RuuubyRelease.find_by_uid(0, 0, 28)}
  let(:v0_0_29){RuuubyRelease.find_by_uid(0, 0, 29)}
  let(:v0_0_30){RuuubyRelease.find_by_uid(0, 0, 30)}
  let(:v0_0_31){RuuubyRelease.find_by_uid(0, 0, 31)}
  let(:v0_0_32){RuuubyRelease.find_by_uid(0, 0, 32)}
  let(:v0_0_33){RuuubyRelease.find_by_uid(0, 0, 33)}
  let(:v0_0_34){RuuubyRelease.find_by_uid(0, 0, 34)}
  let(:v0_0_35){RuuubyRelease.find_by_uid(0, 0, 35)}

  let(:f00){RuuubyFeature.find_by_uid(0)}
  let(:f00_b00){f00.ruuuby_feature_behaviors[0]}
  let(:f00_b01){f00.ruuuby_feature_behaviors[1]}

  let(:f01){RuuubyFeature.find_by_uid(1)}
  let(:f02){RuuubyFeature.find_by_uid(2)}
  let(:f03){RuuubyFeature.find_by_uid(3)}
  let(:f04){RuuubyFeature.find_by_uid(4)}
  let(:f05){RuuubyFeature.find_by_uid(5)}

  let(:f06){RuuubyFeature.find_by_uid(6)}

  let(:f06_b00){f06.ruuuby_feature_behaviors[0]}
  let(:f06_b01){f06.ruuuby_feature_behaviors[1]}

  let(:f07){RuuubyFeature.find_by_uid(7)}
  let(:f08){RuuubyFeature.find_by_uid(8)}
  let(:f09){RuuubyFeature.find_by_uid(9)}
  let(:f10){RuuubyFeature.find_by_uid(10)}

  let(:f11){RuuubyFeature.find_by_uid(11)}
  let(:f11_b00){f11.ruuuby_feature_behaviors[0]}
  let(:f11_b01){f11.ruuuby_feature_behaviors[1]}
  let(:f11_b02){f11.ruuuby_feature_behaviors[2]}

  let(:f12){RuuubyFeature.find_by_uid(12)}
  let(:f13){RuuubyFeature.find_by_uid(13)}
  let(:f15){RuuubyFeature.find_by_uid(15)}
  let(:f16){RuuubyFeature.find_by_uid(16)}
  let(:f17){RuuubyFeature.find_by_uid(17)}
  let(:f18){RuuubyFeature.find_by_uid(18)}
  let(:f19){RuuubyFeature.find_by_uid(19)}
  let(:f20){RuuubyFeature.find_by_uid(20)}
  let(:f21){RuuubyFeature.find_by_uid(21)}
  let(:f22){RuuubyFeature.find_by_uid(22)}
  let(:f23){RuuubyFeature.find_by_uid(23)}

  let(:f24){RuuubyFeature.find_by_uid(24)}
  let(:f24_b00){f24.ruuuby_feature_behaviors[0]}
  let(:f24_b01){f24.ruuuby_feature_behaviors[1]}
  let(:f24_b02){f24.ruuuby_feature_behaviors[2]}
  let(:f24_b03){f24.ruuuby_feature_behaviors[3]}

  let(:f25){RuuubyFeature.find_by_uid(25)}
  let(:f26){RuuubyFeature.find_by_uid(26)}
  let(:f27){RuuubyFeature.find_by_uid(27)}

  let(:f28){RuuubyFeature.find_by_uid(28)}
  let(:f28_b00){f28.ruuuby_feature_behaviors[0]}
  let(:f28_b01){f28.ruuuby_feature_behaviors[1]}
  let(:f28_b02){f28.ruuuby_feature_behaviors[2]}
  let(:f28_b03){f28.ruuuby_feature_behaviors[3]}
  let(:f28_b04){f28.ruuuby_feature_behaviors[4]}
  let(:f28_b05){f28.ruuuby_feature_behaviors[5]}
  let(:f28_b06){f28.ruuuby_feature_behaviors[6]}
  let(:f28_b07){f28.ruuuby_feature_behaviors[7]}
  let(:f28_b08){f28.ruuuby_feature_behaviors[8]}

  let(:f29){RuuubyFeature.find_by_uid(29)}

  let(:f30){RuuubyFeature.find_by_uid(30)}
  let(:f30_b00){f30.ruuuby_feature_behaviors[0]}
  let(:f30_b01){f30.ruuuby_feature_behaviors[1]}
  let(:f30_b02){f30.ruuuby_feature_behaviors[2]}
  let(:f30_b03){f30.ruuuby_feature_behaviors[3]}

  let(:f97){RuuubyFeature.find_by_uid(97)}

  let(:f98){RuuubyFeature.find_by_uid(98)}
  let(:f98_b00){f98.ruuuby_feature_behaviors[0]}

end
