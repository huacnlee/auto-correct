require "rubygems"

begin
  require "bundler/setup"
rescue LoadError
  puts "You must `gem install bundler` and `bundle install` to run rake tasks"
end

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task default: :test

task :bench do
  require "benchmark/ips"
  require "./lib/auto-correct"

  Benchmark.ips do |x|
    x.report("format") do |times|
      i = 0
      while i < times
        AutoCorrect.format("那里找到Ruby China App下载地址")
        i += 1
      end
    end
    x.report("format_html") do |times|
      i = 0
      while i < times
        AutoCorrect.format_html("<div><p>长桥LongBridge App下载</p><p>最新版本1.0</p></div>")
        i += 1
      end
    end
  end
end
