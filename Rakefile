require "benchmark"
require "auto-space"

task :benchmark do
  @examples = [
    "创建一篇article，但是却爆了ActionDispatch::Cookies::CookieOverflow的异常",
    "Gitlab怎么集成GitlabCI.",
    "Linode的$10/mo的VPS在怎么样？",
    "[成都]招聘3名Rails程序员",
    "使用“iOS”8的方式来开发移动应用‘Ruby’",
    "Rspec+Capybara边学边用边分享1-Rspec",
    "韩国+美国的什么什么",
    "2013年3月10日-Ruby Saturday活动召集",
    "在日本比linode还便宜一半的服务器啊"
  ]
  Benchmark.bm do |r|
    r.report "100 times" do
      100.times do 
        @examples.sample.clone.auto_space!
      end
    end
    
    r.report "1000 times" do
      1000.times do 
        @examples.sample.clone.auto_space!
      end
    end
    
    r.report "10000 times" do
      10000.times do 
        @examples.sample.clone.auto_space!
      end
    end
  end
end