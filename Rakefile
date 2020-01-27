#encoding: utf-8

require 'rake/extensiontask'

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rdoc/rdoc'

#exttask = Rake::ExtensionTask.new('my_extension', my_gem_spec) do |ext|
exttask = Rake::ExtensionTask.new(:ruby_class_mods) do |ext|
  ext.cross_compile  = true
  ext.cross_platform = %w[x86-linux x86_64-linux x86_64-darwin18 x86-darwin18]
end

#  __
# /  \  /\  .
# \__X /~~\ .
def add_task_rspec(task_name, additional_options=[])
  spec_default_opts     = ['--format documentation', '--color', '--require spec_helper', '--warnings']
  rspec_task            = RSpec::Core::RakeTask.new(task_name)
  rspec_task.verbose    = true
  rspec_task.rspec_opts = (spec_default_opts + additional_options).join(' ')
end

add_task_rspec(:spec, ['--tag ~@performance'])
add_task_rspec(:rspec_performance, ['--tag @performance'])
add_task_rspec(:rspec_all)

#  __   __   __              ___      ___      ___    __
# |  \ /  \ /  ` |  |  |\/| |__  |\ |  |   /\   |  | /  \ |\ |
# |__/ \__/ \__, \__/  |  | |___ | \|  |  /~~\  |  | \__/ | \|
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
