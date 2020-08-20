# encoding: UTF-8

class ::RuuubyGem < ::ApplicationRecord
  module ContextSourceGeneration
    refine ::RuuubyGem do

      # @example `RuuubyGem.all.last.source_for_version_test`
      #
      # @return [String]
      def source_for_version_test
        initial_spacing = '      '
        source = ''
        if self.ref_source.str? && self.ref_version.str?
          full_ref = "#{self.ref_source}#{self.ref_version}"
          source += "#{initial_spacing}context 'for gem{#{self.name}}' do\n"
          source += "#{initial_spacing}  it 'has correct version{#{self.version_current}}' do\n"
          source += "#{initial_spacing}    expect(#{full_ref}).to eq('#{self.version_current}')\n"
          source += "#{initial_spacing}  end\n"
          source += "#{initial_spacing}end # end: {for gem{#{self.name}}}\n\n"
          source
        end
      end

      # @return [String]
      def source_for_readme
        if self.is_development && self.is_runtime
          gem_modes = "✅, ✅"
        elsif self.is_development
          gem_modes = "✅, ❌"
        elsif self.is_runtime
          gem_modes = "❌, ✅"
        else
          raise "unexpected condition at path{#{__FILE__}} line{#{__LINE__}}"
        end
        "| `#{self.name}` | [`#{self.version_current}`](#{self.url_gem}) | #{gem_modes} | `#{self.tags[2..self.tags.length-3]}` |\n"
      end

    end # end: {refine: RuuubyGem}
  end
end

class ::GitCommit < ApplicationRecord
  module ContextSourceGeneration
    refine ::GitCommit do

      def source_for_seed
        release = self.ruuuby_release
        source  = "@v#{release.vmajor.to_s}_#{release.vminor.to_s}_#{release.vtiny.to_s}"
        parsed_datetime = (self.commit_author_date.in_time_zone('Central Time (US & Canada)')).to_s.as_iso8601
        # TODO: INCORPORATE RELEASE_TAG INFO!
        source += ".spawn_git_commit('#{self.commit_subject}', '#{parsed_datetime}', '#{self.commit_hash}')"
        source
      end

    end # end: {refine: GitCommit}
  end
end
