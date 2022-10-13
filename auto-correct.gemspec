$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "auto-correct"
  s.version     = "1.1.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Luikore", "Jason Lee"]
  s.email       = ["usurffx@gmail.com", "huacnlee@gmail.com"]
  s.homepage    = "https://github.com/huacnlee/autocorrect"
  s.summary     = "Automatically add whitespace between Chinese and and half-width characters (alphabetical letters, numerical digits and symbols)."
  s.description = "Automatically add whitespace between Chinese and and half-width characters (alphabetical letters, numerical digits and symbols)."
  s.files        = Dir.glob("lib/**/*") + %w(README.md)
  s.require_path = "lib"

  s.add_dependency "autocorrect-rb", ">= 2.1.2"
end
