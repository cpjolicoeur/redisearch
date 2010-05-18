require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  require File.dirname( __FILE__ ) + '/lib/redisearch/version.rb'
  Jeweler::Tasks.new do |gem|
    gem.version = Redisearch::Version
    gem.name = "redisearch"
    gem.summary = %Q{TODO: REDIS backed full-text search for Ruby}
    gem.description = %Q{TODO: Full-text search system for Ruby using REDIS for storage}
    gem.email = "cpjolicoeur@gmail.com"
    gem.homepage = "http://github.com/cpjolicoeur/redisearch"
    gem.authors = ["Craig P Jolicoeur"]
    gem.add_dependency "redis", ">= 2"
    gem.add_development_dependency "shoulda", ">= 2"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "redisearch #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
