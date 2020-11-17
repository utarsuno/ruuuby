# encoding: UTF-8

require 'rake/extensiontask'

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rdoc/rdoc'

require 'rake'

namespace :qa do

  task :unit do
    #ENV['RUUUBY_F01'] = 'b00'
    ENV['RUUUBY_PERFORMANCE_LIMIT'] = 'on'
    ENV['RUUUBY_AUTOLOAD_DB'] = 'off'
    ::Rake::Task['rspec_unit'].invoke
  end

  task :functionality do
    #ENV['RUUUBY_F01'] = 'b00'
    ENV['RUUUBY_PERFORMANCE_LIMIT'] = 'on'
    ::Rake::Task['rspec_audit'].execute
    ::Rake::Task['rspec_locale'].execute
    ::Rake::Task['rspec_tech_debt'].execute
    ::Rake::Task['qa:unit'].invoke

    ::Rake::Task['qa:integration'].invoke
  end

  task :integration do
    ENV['RUBYOPT']                  = '-W:no-deprecated -W:no-experimental'
    ENV['RUUUBY_F01']               = 'b00'
    ENV['RUUUBY_PERFORMANCE_LIMIT'] = 'on'
    ENV['RUUUBY_AUTOLOAD_DB']       = 'off'
    ENV['RUUUBY_RSPEC_INTEGRATION'] = 'on'
    ::Rake::Task['rspec_integration'].execute
  end

  task :db do
    ENV['RUBYOPT']                  = '-W:no-deprecated -W:no-experimental'
    ENV['RUUUBY_F01']               = 'b00'
    ENV['RUUUBY_PERFORMANCE_LIMIT'] = 'on'
    ENV['RUUUBY_F92']               = 'b01|b02'
    ENV['RUUUBY_RSPEC_INTEGRATION'] = 'off'
    ENV['RUUUBY_AUTOLOAD_DB']       = 'on'
    ::Rake::Task['rspec_db'].invoke
  end

  task :rng do
    ENV['RUBYOPT']                  = '-W:no-deprecated -W:no-experimental'
    ENV['RUUUBY_F01']               = 'b00'
    ENV['RUUUBY_PERFORMANCE_LIMIT'] = 'on'
    ::Rake::Task['rspec_rng'].execute
  end

  task :audit do
    ENV['RUBYOPT']                  = '-W:no-deprecated -W:no-experimental'
    ENV['RUUUBY_F01']               = 'b00'
    ENV['RUUUBY_PERFORMANCE_LIMIT'] = 'on'
    ::Rake::Task['rspec_audit'].execute
  end

  task :locale do
    ENV['RUBYOPT']                  = '-W:no-deprecated -W:no-experimental'
    ENV['RUUUBY_F01']               = 'b00'
    ENV['RUUUBY_PERFORMANCE_LIMIT'] = 'on'
    ::Rake::Task['rspec_locale'].execute
  end

  task :locale_full do
    ENV['RUBYOPT']                  = '-W:no-deprecated -W:no-experimental'
    ENV['RUUUBY_F01']               = 'b00'
    ENV['RUUUBY_F43']               = 'b00'
    ENV['RUUUBY_PERFORMANCE_LIMIT'] = 'on'
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
  RSPEC_TAG_NAMES  = %w(audit db db_new performance locale preferences tech_debt unit integration system service rng)
  PATH_BASE        = ::File.dirname(__FILE__)
  module Preload
    DB_FULL  = %w(/db/db /db/seed)
#    DB_NEW  = %w(/services/ruuuby_db/spec/migration_spec)
    DB_NEW   = %w(
    /spec/helpers/db/autoload_me
    /services/ruuuby_db/spec/migration_spec
)
    INTEGRATION   = %w(/spec/helpers/integration/autoload_me)
    LIB_BENCHMARK = %w(/spec/helpers/performance/autoload_me)
    LOCALE_BASE   = %w(/spec/helpers/locale/autoload_me)
    LOCALE_FULL   = LOCALE_BASE + %w(
    /services/dev_configs/mac/spec/locale/f43_spec
    /services/dev_configs/mac/spec/locale/f44_spec
    /services/dev_configs/mac/spec/locale/f45_spec
    /services/dev_configs/mac/spec/locale/f46_spec
    /services/dev_configs/mac/spec/locale/f47_spec
    /services/dev_configs/mac/spec/locale/f92_b00_spec
    /services/dev_configs/mac/spec/locale/f98_spec
    /services/dev_configs/mac/spec/locale/locale_full_verification_spec
)
  end
end

# https://rubydoc.info/github/rspec/rspec-core/RSpec/Core/Configuration

# @param [String] task_name
# @param [String] exclude_patterns
# @param [Array]  files_to_require
def add_task_rspec(task_name, exclude_patterns='', files_to_require=[])
  rspec_task = RSpec::Core::RakeTask.new("rspec_#{task_name}".to_sym)
  local_opts = ['--format progress', '--color', '--require spec_helper']

  if task_name == 'all'
    local_opts << '--warnings'
    rspec_task.verbose = true
  else
    rspec_task.verbose = false
    CategoriesQA::RSPEC_TAG_NAMES.each do |tag|
      local_opts << "--tag ~@#{tag}" if tag != task_name
    end
    local_opts << "--tag @#{task_name}" unless task_name == 'unit'
    case task_name
    when 'rng'
      local_opts << '--out rspec_rng.txt'
    else
    end
  end

  rspec_task.rspec_opts = local_opts.join(' ')

  unless files_to_require.empty?
    files_to_require.each do |relative_path|
      rspec_task.rspec_opts << " --require #{CategoriesQA::PATH_BASE}#{relative_path}.rb"
    end
  end
  unless exclude_patterns.empty?
    rspec_task.rspec_opts << " --exclude-pattern \"#{exclude_patterns}\""
  end
end

add_task_rspec('db', '', CategoriesQA::Preload::DB_FULL)
add_task_rspec('db_new',   '', CategoriesQA::Preload::DB_NEW)
add_task_rspec('performance', '', CategoriesQA::Preload::LIB_BENCHMARK)

add_task_rspec('unit')
add_task_rspec('audit')
add_task_rspec('rng')
add_task_rspec('locale',  '**/*_full_verification_spec.rb', CategoriesQA::Preload::LOCALE_BASE)
add_task_rspec('preferences', '', CategoriesQA::Preload::LOCALE_FULL)
add_task_rspec('tech_debt')
add_task_rspec('integration',  '', CategoriesQA::Preload::INTEGRATION)
add_task_rspec('system', '', %w(/spec/helpers/db/autoload_me))
add_task_rspec('service')

#add_task_rspec('all',   '**/*_service_spec.rb', CategoriesQA::Preload::DB_FULL)

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

task :default => :'qa:unit'
