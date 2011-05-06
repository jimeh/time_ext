require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask'
require 'rake/clean'


#
# Rspec
#

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec


#
# Rocco
#

begin
  require 'rocco/tasks'
  Rocco::make 'docs/'
rescue LoadError
  warn "#$! -- rocco tasks not loaded."
  task :rocco
end

desc 'Build rocco docs'
task :docs => :rocco
directory 'docs/'

desc 'Build docs and open in browser for the reading'
task :read => :docs do
  sh 'open docs/lib/time_ext.html'
end

# Make index.html a copy of rocco.html
file 'docs/index.html' => 'docs/lib/time_ext.html' do |f|
  cp 'docs/lib/time_ext.html', 'docs/index.html', :preserve => true
end
task :docs => 'docs/index.html'
CLEAN.include 'docs/index.html'

# Alias for docs task
task :doc => :docs

# GITHUB PAGES ===============================================================

desc 'Update gh-pages branch'
task :pages => ['docs/.git', :docs] do
  rev = `git rev-parse --short HEAD`.strip
  Dir.chdir 'docs' do
    sh "git add *"
    sh "git commit -m 'rebuild pages from #{rev}'" do |ok,res|
      if ok
        verbose { puts "gh-pages updated" }
        sh "git push -q o HEAD:gh-pages"
      end
    end
  end
end

# Update the pages/ directory clone
file 'docs/.git' => ['docs/', '.git/refs/heads/gh-pages'] do |f|
  sh "cd docs && git init -q && git remote add o ../.git" if !File.exist?(f.name)
  sh "cd docs && git fetch -q o && git reset -q --hard o/gh-pages && touch ."
end
CLOBBER.include 'docs/.git'


#
# Misc.
#

desc "Start an irb console with TimeExt pre-loaded."
task :console do
  exec "irb -r spec/spec_helper"
end
task :c => :console
