# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "auto-correct"
  s.version     = "0.1.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Luikore","Jason Lee"]
  s.email       = ["usurffx@gmail.com","huacnlee@gmail.com"]
  s.homepage    = "https://github.com/huacnlee/auto-correct"
  s.summary     = %q{自动给中文英文之间加入合理的空格}
  s.description = %q{自动给中文英文之间加入合理的空格}
  s.files        = Dir.glob("lib/**/*") + %w(README.md)
  s.require_path = 'lib'
  
  s.add_dependency "activesupport", '> 3.0.0'
end