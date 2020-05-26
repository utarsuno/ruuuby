# coding: UTF-8

require_relative 'lib/ruuuby/ruuuby/metadata/ruuuby_metadata_constants'

require 'rake/extensiontask'

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rdoc/rdoc'

# ______________________________________________________________________________________________________________________
#  __   __         __                 __
# /  ` /  \  |\/| |__) | |    | |\ | / _`
# \__, \__/  |  | |    | |___ | | \| \__>
# ______________________________________________________________________________________________________________________

#exttask = Rake::ExtensionTask.new('my_extension', my_gem_spec) do |ext|
Rake::ExtensionTask.new(:ruby_class_mods) do |ext|
  ext.cross_compile  = false
  ext.cross_platform = %w[x86-linux x86_64-linux x86_64-darwin18 x86-darwin18]
end

# ______________________________________________________________________________________________________________________
#  __
# /  \  /\  .
# \__X /~~\ .
# ______________________________________________________________________________________________________________________

def add_task_rspec(task_name, additional_options=[])
  rspec_task            = RSpec::Core::RakeTask.new(task_name)
  all_opts              = additional_options
  rspec_task.verbose    = all_opts.to_s.include?('--warnings')
  rspec_task.rspec_opts = (all_opts).join(' ')
end

qa = ::Ruuuby::MetaData::QA

add_task_rspec(:rspec_unit,        qa.generate_rspec_task_options(qa::Unit))
add_task_rspec(:rspec_db,          qa.generate_rspec_task_options(qa::DB))
add_task_rspec(:rspec_audit,       qa.generate_rspec_task_options(qa::Audits))
add_task_rspec(:rspec_performance, qa.generate_rspec_task_options(qa::Performance))
add_task_rspec(:rspec_locale,      qa.generate_rspec_task_options(qa::Locale))
add_task_rspec(:rspec_all,         qa.generate_rspec_task_options(qa::Full))

# ______________________________________________________________________________________________________________________
#  __       ___       __        __   ___
# |  \  /\   |   /\  |__)  /\  /__` |__
# |__/ /~~\  |  /~~\ |__) /~~\ .__/ |___
# ______________________________________________________________________________________________________________________

#require 'sqlite3'
#require 'active_record'

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
