#encoding: utf-8

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

# TODO: ORGANIZE BEFORE VERSION(0.1.0)

def add_task_rspec(task_name, additional_options=[])
  #spec_default_opts     = ['--format documentation', '--color', '--require spec_helper']
  spec_default_opts     = ['--format progress', '--color', '--require spec_helper']

  # --format progress

  rspec_task            = RSpec::Core::RakeTask.new(task_name)
  all_options           = (spec_default_opts + additional_options)
  rspec_task.verbose    = all_options.include?('--warnings')
  rspec_task.rspec_opts = (spec_default_opts + additional_options).join(' ')
end

add_task_rspec(:rspec_unit, ['--tag ~@performance --tag ~@audits'])
add_task_rspec(:rspec_audit, ['--tag @audits --tag ~@performance'])
add_task_rspec(:rspec_performance, ['--tag @performance --tag ~@audits'])
add_task_rspec(:rspec_ruby, ['--tag ~@performance --tag ~@audits'])
add_task_rspec(:rspec_all, ['--warnings'])


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
