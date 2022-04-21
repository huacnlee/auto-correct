$:.push File.expand_path("../lib", __FILE__)
require "auto-correct/version"
Gem::Specification.new do |s|
  s.name = "auto-correct"
  s.version = AutoCorrect::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Luikore", "Jason Lee"]
  s.email = ["usurffx@gmail.com", "huacnlee@gmail.com"]
  s.homepage = "https://github.com/huacnlee/autocorrect"
  s.summary = "Automatically add whitespace between CJK and and half-width characters."
  s.description = "Automatically add whitespace between CJK (Chinese, Japanese, Korean) and and half-width characters (alphabetical letters, numerical digits and symbols)."
  s.files = Dir.glob("lib/**/*") + %w[README.md Rakefile]
  s.require_paths = ["lib"]
  s.license = "MIT"

  s.add_runtime_dependency "rb_sys1", "~> 0.1", ">= 0.1.3"
end
