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

require "./lib/auto-correct"

task :memory do
  str = "【野村：重申吉利汽车(00175)“买入”评级 上调目标价至17.9港元】智通财经APP获悉，野村发布报告称，美国统计局：美国11月原油出口下降至302.3万桶/日，10月为338.3万桶/日。"
  a = []
  html = open("./test/fixtures/example.txt").read

  puts "Starting to profile memory..."
  b = {}
  puts "Before => #{GC.stat(b)[:heap_live_slots] }"
  count = 500_000
  step = (count / 100).to_i
  count.times do |i|
    AutoCorrect.format(str)
    # AutoCorrect.format_html(html)

    if i % step == 0
      print_memory
      GC.start
    end
  end

  print_memory
  puts GC.start
  puts "After GC"
  print_memory
end

def print_memory
  rss = `ps -eo pid,rss | grep #{Process.pid} | awk '{print $2}'`.to_i
  puts "rss: #{rss} live objects #{GC.stat[:heap_live_slots]}"
end

task :bench do
  require "benchmark/ips"
  require "./lib/auto-correct"

  html = open("./test/fixtures/example.txt").read

  Benchmark.ips do |x|
    x.report("format 50 chars") do |n|
      n.times do
        AutoCorrect.format("【野村：重申吉利汽车(00175)“买入”评级 上调目标价至17.9港元】智通财经APP获悉，野村发布报告称")
      end
    end
    x.report("format 100 chars") do |n|
      n.times do
        AutoCorrect.format("【野村：重申吉利汽车(00175)“买入”评级 上调目标价至17.9港元】智通财经APP获悉，野村发布报告称，【野村：重申吉利汽车(00175)“买入”评级 上调目标价至17.9港元】智通财经APP获悉，野村发布报告称")
      end
    end
    x.report("format 400 chars") do |n|
      n.times do
        AutoCorrect.format("【野村：重申吉利汽车(00175)“买入”评级 上调目标价至17.9港元】智通财经APP获悉，野村发布报告称，上调吉利汽车(00175)目标价12.58%，由15.9港元升至17.9港元，并维持吉汽为行业首选股，重申对其“买入”评级，坚信吉汽长远可成为行业赢家。 该行称，随着公司销量持续复苏及产品组合改善，预计今年销量可达148万辆，同比升9%，较公司原定目标销量141万辆为高。 该行又称称，上调公司今明两年每股盈利预测各13%及升毛利率0.1个百分点，以反映销量较预期高2%及产品组合改善，主要是由领克品牌带动。公司自去年8月开始已持续投资领克品牌及进行市场推广，带动领克销量环比有所改变，预期今明两年领克将占整体销量的11%及14%。 该行表示，由于低端国产车品牌在欠缺新车款及科技下，行业整合度将提升。另外，公司从去年第二季到12月为止，一直都积极推动经销商去库存，这将有利公司今年利润率复苏。")
      end
    end

    x.report("format_html") do |n|
      n.times do
        AutoCorrect.format_html(html)
      end
    end
  end
end
