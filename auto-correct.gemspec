$:.push File.expand_path("../lib", __FILE__)

require "auto-correct/version"

Gem::Specification.new do |s|
  s.name        = "auto-correct"
  s.version     = AutoCorrect::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Luikore", "Jason Lee"]
  s.email       = ["usurffx@gmail.com", "huacnlee@gmail.com"]
  s.homepage    = "https://github.com/huacnlee/auto-correct"
  s.summary     = "Automatically add whitespace between Chinese and and half-width characters (alphabetical letters, numerical digits and symbols)."
  s.description = "Automatically add whitespace between Chinese and and half-width characters (alphabetical letters, numerical digits and symbols)."
  s.files        = Dir.glob("lib/**/*") + %w(README.md)
  s.require_path = "lib"

  s.add_dependency "nokogiri", ">= 1.4"
end
