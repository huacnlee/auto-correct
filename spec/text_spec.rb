require "auto-space"

describe "AutoSpace" do
  it "should work with simple" do
    "部署到heroku有问题网页不能显示".auto_space!.should == "部署到 heroku 有问题网页不能显示"
  end
  
  it "should with () or []" do
    "[北京]美企聘site/web大型应用开发高手-Ruby（Java/PHP/Python也可）".auto_space!.should == "[北京]美企聘 site/web 大型应用开发高手-Ruby（Java/PHP/Python 也可）"      
    "[成都](团800)招聘Rails工程师".auto_space!.should == "[成都](团 800)招聘 Rails 工程师"
  end
  
  it "should with . !" do
    "Teahour.fm第18期发布".auto_space!.should == "Teahour.fm 第 18 期发布"
    "Yes!升级到了Rails 4".auto_space!.should == "Yes! 升级到了 Rails 4"
    "delete!方法是做什么的".auto_space!.should == "delete! 方法是做什么的"
    "到了!升级到了Rails 4".auto_space!.should == "到了! 升级到了 Rails 4"
  end
  
  it "should with URL" do
    "http://sourceforge.net/解禁了".auto_space!.should == "http://sourceforge.net/ 解禁了"
  end
  
  it "should with #" do
    "个人信息显示公开记事本,记事本显示阅读次数#149".auto_space!.should == "个人信息显示公开记事本,记事本显示阅读次数 #149"      
  end
  
  it "should with @" do
    "里面用@foo符号的话后面的变量名会被替换成userN".auto_space!.should == "里面用 @foo 符号的话后面的变量名会被替换成 userN"
  end
  
  it 'should with \ /' do
    "我/解禁了".auto_space!.should == "我 / 解禁了"
    "WWDC上讲到的Objective C/LLVM改进".auto_space!.should == "WWDC 上讲到的 Objective C/LLVM 改进"
  end

  it "should with number" do
    "在Ubuntu11.10 64位系统安装newrelic出错".auto_space!.should == "在 Ubuntu11.10 64 位系统安装 newrelic 出错"
    "升级了10.9 附遇到的bug".auto_space!.should == "升级了 10.9 附遇到的 bug"
    "喜欢暗黑2却对D3不满意的可以看看这个。。".auto_space!.should == "喜欢暗黑 2 却对 D3 不满意的可以看看这个。。"
    "在做ROR 3.2 Tutorial第Chapter 9.4.2遇到一个问题求助！".auto_space!.should == "在做 ROR 3.2 Tutorial 第 Chapter 9.4.2 遇到一个问题求助！"
  end
  
  it "should with other cases" do
    "创建一篇article，但是却爆了ActionDispatch::Cookies::CookieOverflow的异常".auto_space!.should == "创建一篇 article，但是却爆了 ActionDispatch::Cookies::CookieOverflow 的异常"
    "Mac安装软件新方法：Homebrew-cask".auto_space!.should == "Mac 安装软件新方法：Homebrew-cask"
    "Mac安装软件新方法: Homebrew-cask".auto_space!.should == "Mac 安装软件新方法: Homebrew-cask"
    "Gitlab怎么集成GitlabCI.".auto_space!.should == "Gitlab 怎么集成 GitlabCI."
  end
  
  it "should with 年月日" do
    "5天的活动".auto_space!.should == "5 天的活动"
    "我10岁的时候".auto_space!.should == "我 10 岁的时候"
    "再过3天我们就去".auto_space!.should == "再过 3 天我们就去"
    "于3月10日开始".auto_space!.should == "于 3月10日 开始"
    "于3月开始".auto_space!.should == "于 3月 开始"
    "于2009年开始".auto_space!.should == "于 2009年 开始"
    "2013年3月10日-Ruby Saturday活动召集".auto_space!.should == "2013年3月10日-Ruby Saturday 活动召集"
  end
end