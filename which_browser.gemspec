# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "which_browser/version"

Gem::Specification.new do |s|
  s.name        = "which_browser"
  s.version     = WhichBrowser::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Spencer Steffen"]
  s.email       = ["spencer@citrusme.com"]
  s.homepage    = ""
  s.summary     = %q{Which Browser adds a few helper methods to a rack request.}
  s.description = %q{Which Browser adds a few helper methods to a rack request.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  
  s.require_paths = ["lib"]
  
  s.add_dependency('rack', '>= 1.0.1')
	s.add_development_dependency('shoulda', '>= 2.11.3')
	
end
