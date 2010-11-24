require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "time_ext"
    gem.summary = %Q{Extends the abilities of Ruby's built-in Time class by building on top of ActiveSupport.}
    gem.description = %Q{Extends the abilities of Ruby's built-in Time class by building on top of ActiveSupport.}
    gem.email = "contact@jimeh.me"
    gem.homepage = "http://github.com/jimeh/time_ext"
    gem.authors = ["Jim Myhrberg"]
    gem.add_dependency 'activesupport', '>= 2.3.0'
    gem.add_dependency 'i18n', '>= 0.4.2'
    gem.add_development_dependency 'jeweler', '>= 1.4.0'
    gem.add_development_dependency 'rspec', '>= 2.1.0'
    gem.add_development_dependency 'yard', '>= 0.6.3'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

# Rspec
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

desc "Start an irb console with TimeExt pre-loaded."
task :console do
  exec "irb -r spec/spec_helper"
end
task :c => :console

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end
