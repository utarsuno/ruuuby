require "bundler/gem_tasks"
require "rspec/core/rake_task"
gem 'rdoc'
require 'rdoc/rdoc'

spec_default_opts = ['--format documentation', '--color', '--require spec_helper']

#  __           ___  ___  __  ___         __
# /  \  /\  .    |  |__  /__`  |  | |\ | / _`
# \__X /~~\ .    |  |___ .__/  |  | | \| \__>
task_rspec            = RSpec::Core::RakeTask.new(:rspec)
task_rspec.verbose    = true
task_rspec.rspec_opts = (spec_default_opts + ['--tag ~@performance']).join(' ')

#  __            __   ___  __   ___  __   __                   __   ___
# /  \  /\  .   |__) |__  |__) |__  /  \ |__)  |\/|  /\  |\ | /  ` |__
# \__X /~~\ .   |    |___ |  \ |    \__/ |  \  |  | /~~\ | \| \__, |___
task_rspec_performance            = RSpec::Core::RakeTask.new(:rspec_performance)
task_rspec_performance.verbose    = true
task_rspec_performance.rspec_opts = (spec_default_opts + ['--tag @performance']).join(' ')

#  __
# /  \  /\  .    /\  |    |
# \__X /~~\ .   /~~\ |___ |___
task_rspec_all            = RSpec::Core::RakeTask.new(:rspec_all)
task_rspec_all.verbose    = true
task_rspec_all.rspec_opts = spec_default_opts.join(' ')

#  __   __   __              ___      ___      ___    __
# |  \ /  \ /  ` |  |  |\/| |__  |\ |  |   /\   |  | /  \ |\ |
# |__/ \__/ \__, \__/  |  | |___ | \|  |  /~~\  |  | \__/ | \|
RDoc::Task.new do |rdoc|
  rdoc.main = 'README.md'
  rdoc.rdoc_files.include('README.md','lib/**/*.rb')

  rdoc.options << '--verbose'

  # more options at: https://ruby.github.io/rdoc/RDoc/Options.html
  #%w(coverage-report verbose force-update).each do |option|
  #rdoc.options << "--#{option}"
  #end
end

#task :default => :rspec
