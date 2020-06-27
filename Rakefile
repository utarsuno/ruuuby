# coding: UTF-8

require 'rake/extensiontask'

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rdoc/rdoc'

# ______________________________________________________________________________________________________________________
#  __   __         __                 __
# /  ` /  \  |\/| |__) | |    | |\ | / _`
# \__, \__/  |  | |    | |___ | | \| \__>
# ______________________________________________________________________________________________________________________

spec = ::Gem::Specification.new do |s|
  s.name       = 'ruby_class_mods'
  s.platform   = ::Gem::Platform::RUBY # ::Gem::Platform::CURRENT
  s.extensions = ::FileList['ext/**/extconf.rb']
  #s.cross_platform = %w[x86_64-darwin18] %w[x86-linux x86_64-linux x86_64-darwin18 x86-darwin18]
end

::Gem::PackageTask.new(spec) do |pkg|
end

::Rake::ExtensionTask.new('ruby_class_mods', spec)

# ______________________________________________________________________________________________________________________
#  __
# /  \  /\  .
# \__X /~~\ .
# ______________________________________________________________________________________________________________________

module CategoriesQA
  ALL_SINGULAR_CATEGORIES = %w(audit db performance locale tech_debt unit integration)
  PATH_BASE               = ::File.dirname(__FILE__)
  module Preload
    DB_PARTIAL = %w(/db/db.rb)
    DB_FULL    = %w(/db/db.rb /db/seed.rb)
  end
end

# https://rubydoc.info/github/rspec/rspec-core/RSpec/Core/Configuration

def add_task_rspec(task_name, sub_category, with_warnings, singular_category_test, exclude_other_categories, exclude_patterns='', files_to_require=[])
  official_task_name = "#{task_name}"
  official_task_name += "_#{sub_category}" unless sub_category.empty?
  local_opts = ['--format progress', '--color', '--require spec_helper']
  local_opts << '--warnings' if with_warnings
  if singular_category_test && task_name != 'unit'
    local_opts << "--tag @#{task_name}"
  end
  if exclude_other_categories
    CategoriesQA::ALL_SINGULAR_CATEGORIES.each do |c|
      local_opts << "--tag ~@#{c}" if c != task_name
    end
  end
  rspec_task            = RSpec::Core::RakeTask.new("rspec_#{official_task_name}".to_sym)
  rspec_task.verbose    = with_warnings
  rspec_task.rspec_opts = local_opts.join(' ')
  unless files_to_require.empty?
    files_to_require.each do |relative_path|
      rspec_task.rspec_opts << " --require #{CategoriesQA::PATH_BASE}#{relative_path}"
    end
  end
  unless exclude_patterns.empty?
    rspec_task.rspec_opts << " --exclude-pattern \"#{exclude_patterns}\""
  end

  #puts "task{#{official_task_name}}, rspec_opts{#{rspec_task.rspec_opts.to_s}}"
end

add_task_rspec('unit', '',false,  true, true)
add_task_rspec('audit', '', false, true, true)
add_task_rspec('db', '', false, true, true, '', CategoriesQA::Preload::DB_FULL)
add_task_rspec('performance', '', false, true, true)
add_task_rspec('performance', 'without_nums', false, true, true, '**/int_spec.rb,**/float_spec.rb,**/complex_spec.rb,**/rational_spec.rb')
add_task_rspec('locale', '', false, true, true, '**/*_full_verification_spec.rb', CategoriesQA::Preload::DB_PARTIAL)
add_task_rspec('locale', 'full', false, true, true, '', CategoriesQA::Preload::DB_PARTIAL)
add_task_rspec('tech_debt', '', false, true, true)
add_task_rspec('integration', '', false, true, true)
add_task_rspec('all', '', true,  false, false, '', CategoriesQA::Preload::DB_FULL)

# ______________________________________________________________________________________________________________________
#  __       ___       __        __   ___
# |  \  /\   |   /\  |__)  /\  /__` |__
# |__/ /~~\  |  /~~\ |__) /~~\ .__/ |___
# ______________________________________________________________________________________________________________________

# ______________________________________________________________________________________________________________________
#  __   __   __              ___      ___      ___    __
# |  \ /  \ /  ` |  |  |\/| |__  |\ |  |   /\   |  | /  \ |\ |
# |__/ \__/ \__, \__/  |  | |___ | \|  |  /~~\  |  | \__/ | \|
# ______________________________________________________________________________________________________________________
RDoc::Task.new do |rdoc|
  #rdoc.main  = 'README.md'
  rdoc.title = "Ruuuby Documentation"
  #rdoc.rdoc_files.include('README.md', 'lib/**/*.rb')
  rdoc.rdoc_files.include('README.md', 'lib/**/*.rb', 'ext/**/*.rb', 'ext/**/*.c')

  rdoc.options << '--verbose'

  # more options at: https://ruby.github.io/rdoc/RDoc/Options.html
  #%w(coverage-report verbose force-update).each do |option|
  #rdoc.options << "--#{option}"
  #end
end

#task :default => :rspec
