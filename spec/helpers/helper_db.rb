
module HelpersDB
  require_relative '../../db/seed'

  def audit_feature(the_feature, feature_str, description)
    expect(the_feature.class).to eq(RuuubyFeature)
    expect(the_feature.id.class).to eq(Integer)
    expect(the_feature.description).to eq(description)
    expect(the_feature.uid).to eq(feature_str)
    expect(the_feature.uid.match?(re_ruuuby_feature_id)).to eq(true)
    expect(the_feature.docs_feature_mapping).to eq("| #{feature_str} | #{description} |")
    expect(the_feature.docs_feature_mapping.match?(re_ruuuby_feature_docs_feature_mapping)).to eq(true)
  end

  def audit_version(the_version, version_str)
    expect(the_version.class).to eq(RuuubyRelease)
    expect(the_version.uid).to eq(version_str)
    expect(version_str.match?(re_ruuuby_release_version)).to eq(true)
    expect(the_version.id.class).to eq(Integer)
  end

end

RSpec.shared_context 'shared_context_db' do

  let(:re_ruuuby_feature){RuuubyFeature::Syntax}
  let(:re_ruuuby_feature_id){RuuubyFeature.cache_fetch(re_ruuuby_feature::UID)}
  let(:re_ruuuby_feature_docs_feature_mapping){RuuubyFeature.cache_fetch(re_ruuuby_feature::DOCS_FEATURE_MAPPING)}
  let(:re_ruuuby_release){RuuubyRelease::Syntax}
  let(:re_ruuuby_release_version){RuuubyRelease.cache_fetch(re_ruuuby_release::UID)}

  let(:v0_0_0){RuuubyRelease.all[0]}
  let(:v0_0_1){RuuubyRelease.all[1]}
  let(:v0_0_2){RuuubyRelease.all[2]}
  let(:v0_0_3){RuuubyRelease.all[3]}
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

  let(:f00){RuuubyFeature.by_id_num(0)}
  let(:f01){RuuubyFeature.by_id_num(1)}
  let(:f02){RuuubyFeature.by_id_num(2)}
  let(:f03){RuuubyFeature.by_id_num(3)}
  let(:f04){RuuubyFeature.by_id_num(4)}
  let(:f06){RuuubyFeature.by_id_num(6)}
  let(:f07){RuuubyFeature.by_id_num(7)}
  let(:f08){RuuubyFeature.by_id_num(8)}
  let(:f09){RuuubyFeature.by_id_num(9)}
  let(:f10){RuuubyFeature.by_id_num(10)}
  let(:f11){RuuubyFeature.by_id_num(11)}
  let(:f12){RuuubyFeature.by_id_num(12)}
  let(:f15){RuuubyFeature.by_id_num(15)}
  let(:f16){RuuubyFeature.by_id_num(16)}
  let(:f17){RuuubyFeature.by_id_num(17)}
  let(:f18){RuuubyFeature.by_id_num(18)}
  let(:f19){RuuubyFeature.by_id_num(19)}
  let(:f20){RuuubyFeature.by_id_num(20)}
  let(:f21){RuuubyFeature.by_id_num(21)}
  let(:f22){RuuubyFeature.by_id_num(22)}
  let(:f23){RuuubyFeature.by_id_num(23)}
  let(:f98){RuuubyFeature.by_id_num(98)}

end
