require "bundler/gem_tasks"
require "rspec/core/rake_task"
gem 'rdoc'
require 'rdoc/rdoc'

# T E S T I N G
RSpec::Core::RakeTask.new(:rspec)
task :default => :rspec

# D O C U M E N T A T I O N
RDoc::Task.new do |rdoc|
  rdoc.main = 'README.md'
  rdoc.rdoc_files.include('README.md','lib/**/*.rb')

  # more options at: https://ruby.github.io/rdoc/RDoc/Options.html
  %w(coverage-report verbose force-update).each do |option|
    rdoc.options << "--#{option}"
  end
end
