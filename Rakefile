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
  s.name = 'ruby_class_mods'
  #s.platform = ::Gem::Platform::CURRENT
  s.platform = ::Gem::Platform::RUBY
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
end

def add_task_rspec(task_name, with_warnings, singular_category_test, exclude_other_categories)
  local_opts = ['--format progress', '--color', '--require spec_helper']
  if with_warnings
    local_opts << '--warnings'
  end
  if singular_category_test && task_name != 'unit'
    local_opts << "--tag @#{task_name}"
  end
  if exclude_other_categories
    CategoriesQA::ALL_SINGULAR_CATEGORIES.each do |c|
      if c != task_name
        local_opts << "--tag ~@#{c}"
      end
    end
  end
  rspec_task            = RSpec::Core::RakeTask.new("rspec_#{task_name}".to_sym)
  rspec_task.verbose    = with_warnings
  rspec_task.rspec_opts = local_opts.join(' ')
end

add_task_rspec('unit', false,  true, true)
add_task_rspec('audit', false, true, true)
add_task_rspec('db', false, true, true)
add_task_rspec('performance', false, true, true)
add_task_rspec('locale', false, true, true)
add_task_rspec('tech_debt', false, true, true)
add_task_rspec('integration', false, true, true)
add_task_rspec('all', true,  false, false)

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
