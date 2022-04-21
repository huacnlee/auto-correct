Gem::Specification.new do |s|
  s.name = "auto-correct"
  s.version = "1.1.0"
  s.platform = Gem::Platform::RUBY
  s.authors = ["Luikore", "Jason Lee"]
  s.email = ["usurffx@gmail.com", "huacnlee@gmail.com"]
  s.homepage = "https://github.com/huacnlee/autocorrect"
  s.summary = "Automatically add whitespace between Chinese and and half-width characters (alphabetical letters, numerical digits and symbols)."
  s.description = "Automatically add whitespace between Chinese and and half-width characters (alphabetical letters, numerical digits and symbols)."
  s.files = Dir.glob("{lib,ext}/**/*") + %w[README.md Rakefile]
  s.require_paths = ["lib"]
  s.required_rubygems_version = ">= 3.3.11"

  s.extensions = ["ext/autocorrect/extconf.rb"]

  s.add_dependency "rb_sys1", ">= 0.1.1"
end
