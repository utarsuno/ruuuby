# encoding: UTF-8

require 'rake/extensiontask'

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rdoc/rdoc'

require 'rake'

namespace :dev_settings do

  f92 = ENV['RUUUBY_F92']

  task :disable_db_dev do
    raise ::RuntimeError.new("| ENV[RUUUBY_F92] w/ value{#{f92.to_s}} indicates it should not be disabled |") if (f92 != nil && (f92.include?('b01') || f92.include?('b02')))
    `bundle config unset with`
    `bundle config unset without`
    `bundle config set with 'development'`
    `bundle config set without 'db'`
  end

  task :enable_db_dev do
    raise ::RuntimeError.new("| ENV[RUUUBY_F92] w/ value{#{f92.to_s}} does not have the required feature behavior needed |") if (f92.class == ::String && !(f92.include?('b01') || f92.include?('b02')))
    `bundle config unset with`
    `bundle config unset without`
    `bundle config set with 'db' 'development'`
    #`bundle config set without 'prod'`
  end

end

namespace :qa do

  task :unit do
    #ENV['RUBYOPT']    = '-W:no-deprecated -W:no-experimental'
    #ENV['RUUUBY_F01'] = 'b00'
    ::Rake::Task['rspec_unit'].invoke
  end

  task :functionality do
    #ENV['RUBYOPT']    = '-W:no-deprecated -W:no-experimental'
    #ENV['RUUUBY_F01'] = 'b00'
    ::Rake::Task['rspec_audit'].execute
    ::Rake::Task['rspec_locale'].execute
    ::Rake::Task['rspec_tech_debt'].execute
    ::Rake::Task['rspec_integration'].execute
    ::Rake::Task['qa:unit'].invoke
  end

  task :db do
    ENV['RUBYOPT']    = '-W:no-deprecated -W:no-experimental'
    ENV['RUUUBY_F01'] = 'b00'
    ::Rake::Task['rspec_db'].execute
  end

  task :audit do
    ENV['RUBYOPT']    = '-W:no-deprecated -W:no-experimental'
    ENV['RUUUBY_F01'] = 'b00'
    ::Rake::Task['rspec_audit'].execute
  end

  task :locale do
    ENV['RUBYOPT']    = '-W:no-deprecated -W:no-experimental'
    ENV['RUUUBY_F01'] = 'b00'
    ::Rake::Task['rspec_locale'].execute
  end

  task :locale_full do
    ENV['RUBYOPT']    = '-W:no-deprecated -W:no-experimental'
    ENV['RUUUBY_F01'] = 'b00'
    ::Rake::Task['rspec_locale_full'].execute
  end

end

namespace :manual do

  task :clean_logs do
    ::Rake::Task['clobber_rdoc'].execute
    ::Rake::Task['clobber'].execute
  end

  task :clean_all do
    ::Rake::Task['clobber_rdoc'].execute
    ::Rake::Task['clobber'].execute
    ::Rake::Task['clean'].execute
  end

end

# ______________________________________________________________________________________________________________________
#  __   __         __                 __
# /  ` /  \  |\/| |__) | |    | |\ | / _`
# \__, \__/  |  | |    | |___ | | \| \__>
# ______________________________________________________________________________________________________________________

spec = ::Gem::Specification.new do |s|
  s.name       = 'ruby_class_mods'
  s.platform   = ::Gem::Platform::CURRENT #::Gem::Platform::RUBY
  s.extensions = ::FileList['ext/**/extconf.rb']
  #s.cross_platform = %w[x86_64-darwin18] %w[x86-linux x86_64-linux x86_64-darwin18 x86-darwin18]
end

# TODO: is this needed?
Gem::PackageTask.new(spec) do |pkg|
end

::Rake::ExtensionTask.new('ruby_class_mods', spec)

# ______________________________________________________________________________________________________________________
#  __
# /  \  /\  .
# \__X /~~\ .
# ______________________________________________________________________________________________________________________

module CategoriesQA
  ALL_SINGULAR_CATEGORIES = %w(audit db performance locale tech_debt unit integration system service)
  PATH_BASE               = ::File.dirname(__FILE__)
  module Preload
    DB_PARTIAL    = %w(/db/db)
    DB_FULL       = %w(/db/db /db/seed)
    LIB_BENCHMARK = %w(/spec/helpers/load_benchmark)
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
      rspec_task.rspec_opts << " --require #{CategoriesQA::PATH_BASE}#{relative_path}.rb"
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

# TODO: use better solution for loading benchmark (use existing rake task settings)
add_task_rspec('performance', '', false, true, true, '', CategoriesQA::Preload::LIB_BENCHMARK)
add_task_rspec('performance', 'no_nums', false, true, true, '**/int_spec.rb,**/float_spec.rb,**/complex_spec.rb,**/rational_spec.rb', CategoriesQA::Preload::LIB_BENCHMARK)

add_task_rspec('locale', '', false, true, true, '**/*_full_verification_spec.rb')
add_task_rspec('locale', 'full', false, true, true, '')
add_task_rspec('tech_debt', '', false, true, true)
add_task_rspec('integration', '', false, true, true)
add_task_rspec('system', '', false, true, true)
add_task_rspec('service', '', false, true, true)
add_task_rspec('all', '', true,  false, false, '**/*_service_spec.rb', CategoriesQA::Preload::DB_FULL)

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
