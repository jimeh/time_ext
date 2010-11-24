# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "time_ext/version"

Gem::Specification.new do |s|
  s.name        = "time_ext"
  s.version     = TimeExt::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jim Myhrberg"]
  s.email       = ["contact@jimeh.me"]
  s.homepage    = "http://github.com/jimeh/time_ext"
  s.summary     = "Extends the abilities of Ruby's built-in Time class by building on top of ActiveSupport."
  s.description = "Extends the abilities of Ruby's built-in Time class by building on top of ActiveSupport."

  s.rubyforge_project = "time_ext"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_runtime_dependency 'activesupport', '>= 2.3.0'
  s.add_runtime_dependency 'i18n', '>= 0.4.2'
end
