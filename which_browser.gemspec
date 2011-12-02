# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "which_browser/version"

Gem::Specification.new do |s|
  s.name        = "which_browser"
  s.version     = WhichBrowser::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Spencer Steffen"]
  s.email       = ["spencer@citrusme.com"]
  s.homepage    = "https://github.com/citrus/which_browser"
  s.summary     = %q{Which Browser adds a few helper methods to a rack request making it easier to determine which browser is being used by the client.}
  s.description = %q{Which Browser adds a few helper methods to a rack request making it easier to determine which browser is being used by the client.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  
  s.require_paths = ["lib"]
  
  s.add_dependency('rack', '>= 1.0.1')
  
	s.add_development_dependency('rake',            '>= 0.8.7')
	s.add_development_dependency('minitest',        '>= 2.1.0')
	s.add_development_dependency('minitest_should', '>= 0.1.1')
	
end
