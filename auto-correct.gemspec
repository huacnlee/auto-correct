$:.push File.expand_path("../lib", __FILE__)

require "auto-correct"

Gem::Specification.new do |s|
  s.name        = "auto-correct"
  s.version     = AutoCorrect::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Luikore", "Jason Lee"]
  s.email       = ["usurffx@gmail.com", "huacnlee@gmail.com"]
  s.homepage    = "https://github.com/huacnlee/auto-correct"
  s.summary     = "自动给中文英文之间加入合理的空格"
  s.description = "自动给中文英文之间加入合理的空格"
  s.files        = Dir.glob("lib/**/*") + %w(README.md)
  s.require_path = "lib"
end
