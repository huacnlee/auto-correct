# coding: utf-8
require "auto-correct"
require "active_support/all"
require "active_model"

class User
  include ActiveModel::Dirty
  attr_accessor :name

  define_attribute_methods :name
end

describe "AutoCorrect" do
  let(:text) { "" }
  subject { text.auto_space! }
  context 'simple Chinese and English' do
    let(:text) { "部署到heroku有问题网页不能显示" }
    it { should eq "部署到 heroku 有问题网页不能显示" }
  end

  context 'when have []' do
    let(:text) { "[北京]美企聘site/web大型应用开发高手-Ruby" }
    it { should eq "[北京] 美企聘 site/web 大型应用开发高手-Ruby" }
  end

  context 'when have ()' do
    let(:text) { "[成都](团800)招聘Rails工程师" }
    it { should eq "[成都](团 800) 招聘 Rails 工程师" }
  end

  context 'when have .' do
    let(:text) { "Teahour.fm第18期发布" }
    it { should eq "Teahour.fm 第 18 期发布" }
  end

  context 'when have !' do
    context 'neer English' do
      let(:text) { "Yes!升级到了Rails 4" }
      it { should eq "Yes! 升级到了 Rails 4" }
    end
    context 'near Chinese' do
      let(:text) { "到了!升级到了Rails 4" }
      it { should eq "到了! 升级到了 Rails 4" }
    end
  end

  context 'when have URL' do
    let(:text) { "http://sourceforge.net/解禁了" }
    it { should eq "http://sourceforge.net/ 解禁了" }
  end

  context 'when have #' do
    let(:text) { "个人信息显示公开记事本,记事本显示阅读次数#149" }
    it { should eq "个人信息显示公开记事本,记事本显示阅读次数 #149" }
  end

  context 'when have @' do
    let(:text) { "里面用@foo符号的话后面的变量名会被替换成userN" }
    it { should eq "里面用 @foo 符号的话后面的变量名会被替换成 userN" }
  end

  context 'when have /' do
    let(:text) { "WWDC上讲到的Objective C/LLVM改进" }
    it { should eq "WWDC 上讲到的 Objective C/LLVM 改进" }
  end

  context 'when have numbers' do
    context 'near the English word' do
      let(:text) { "在Ubuntu11.10 64位系统安装newrelic出错" }
      it { should eq "在 Ubuntu11.10 64 位系统安装 newrelic 出错" }
    end
    context 'near the Chinese chars' do
      let(:text) { "升级了10.9 附遇到的bug" }
      it { should eq "升级了 10.9 附遇到的 bug" }
    end
    context 'complex1' do
      let(:text) { "喜欢暗黑2却对D3不满意的可以看看这个。。" }
      it { should eq "喜欢暗黑 2 却对 D3 不满意的可以看看这个。。" }
    end
    context 'complex2' do
      let(:text) { "在做ROR 3.2 Tutorial第Chapter 9.4.2遇到一个问题求助！" }
      it { should eq "在做 ROR 3.2 Tutorial 第 Chapter 9.4.2 遇到一个问题求助！" }
    end
  end

  context 'other cases' do
    it {
      "创建一篇article，但是却爆了ActionDispatch::Cookies::CookieOverflow的异常".auto_space!.should == "创建一篇 article，但是却爆了 ActionDispatch::Cookies::CookieOverflow 的异常"
    }
    it { "Mac安装软件新方法：Homebrew-cask".auto_space!.should == "Mac 安装软件新方法：Homebrew-cask" }
    it { "Mac安装软件新方法: Homebrew-cask".auto_space!.should == "Mac 安装软件新方法: Homebrew-cask" }
    it { "Gitlab怎么集成GitlabCI.".auto_space!.should == "Gitlab 怎么集成 GitlabCI." }
    it { "Linode的$10/mo的VPS在怎么样？".auto_space!.should == "Linode 的 $10/mo 的 VPS 在怎么样？" }
    it {
      "[成都]招聘3名Rails程序员".auto_space!.should == "[成都] 招聘 3 名 Rails 程序员"
      "注意[成都]招聘3名Rails程序员".auto_space!.should == "注意 [成都] 招聘 3 名 Rails 程序员"
    }
    it {
      "(成都)招聘3名Rails程序员".auto_space!.should == "(成都) 招聘 3 名 Rails 程序员"
      "注意(成都)招聘3名Rails程序员".auto_space!.should == "注意 (成都) 招聘 3 名 Rails 程序员"
      "(成都)Rails程序员3名".auto_space!.should == "(成都) Rails 程序员 3 名"
      "(成都)3名程序员需要".auto_space!.should == "(成都) 3 名程序员需要"
      "使用 Rails 的方式来开发移动应用(iOS/Android)".auto_space!.should == "使用 Rails 的方式来开发移动应用 (iOS/Android)"
      "使用“iOS”8的方式来开发移动应用‘Ruby’".auto_space!.should == "使用 “iOS” 8 的方式来开发移动应用 ‘Ruby’"
    }

  end

  context "+" do
    it {
      "Rspec+Capybara边学边用边分享1-Rspec".auto_space!.should == "Rspec+Capybara 边学边用边分享 1-Rspec"
    }
    it {
      "韩国+美国的什么什么".auto_space!.should == "韩国 + 美国的什么什么"
    }
    it {
      "求一份ROR或者c++的开发工作".auto_space!.should == "求一份 ROR 或者 c++ 的开发工作"
    }
  end

  context 'when 年月日' do
    it { "5天的活动".auto_space!.should == "5 天的活动" }
    it { "我10岁的时候".auto_space!.should == "我 10 岁的时候" }
    it { "再过3天我们就去".auto_space!.should == "再过 3 天我们就去" }
    it { "于3月10日开始".auto_space!.should == "于 3月10日 开始" }
    it { "于3月开始".auto_space!.should == "于 3月 开始" }
    it { "于2009年开始".auto_space!.should == "于 2009年 开始" }
    it { "2013年3月10日-Ruby Saturday活动召集".auto_space!.should == "2013年3月10日-Ruby Saturday 活动召集" }
    it { "2013年12月22号开始出发".auto_space!.should == "2013年12月22号开始出发" }
    it { "12月22号开始出发".auto_space!.should == "12月22号开始出发" }
    it { "22号开始出发".auto_space!.should == "22号开始出发" }
  end

  context 'when 日XX/年XX/月XX/号XX' do
    it { "五号的人物".auto_space!.should == "五号的人物" }
    it { "本月的活动".auto_space!.should == "本月的活动" }
    it { "今年就会出来".auto_space!.should == "今年就会出来" }
    it { "在日本比linode还便宜一半的服务器啊".auto_space!.should == "在日本比 linode 还便宜一半的服务器啊" }
    it { "明日大家都在这里".auto_space!.should == "明日大家都在这里" }
  end

  describe ".auto_convert!" do
    context "default conversion" do
      it { "【北京】".auto_convert!.should == "[北京]" }
      it { "（（北京））".auto_convert!.should == "((北京))" }
    end

    context "custom conversion" do
      it { "[上海]".auto_convert!({ "[" => "【", "]" => "】" }).should == "【上海】" }
      it { "(上海)".auto_convert!({ "(" => "（", ")" => "）" }).should == "（上海）" }
    end
  end

  describe ".auto_correct!" do
    context "between word" do
      it { "mOngodb".auto_correct!.should == "MongoDB" }
      it { " mongodb".auto_correct!.should == " MongoDB" }
      it { " mongodb ".auto_correct!.should == " MongoDB " }
      it { "的mongodb".auto_correct!.should == "的 MongoDB" }
      it { "mongodb的".auto_correct!.should == "MongoDB 的" }
    end

    context "all words" do
      it "should word" do
        AutoCorrect::DICTS.map do |key, val|
          str = key.dup
          str.auto_correct!.should == val
        end
      end
    end

    context "word in inside other word" do
      it { "oruby".auto_correct!.should == "oruby" }
    end

    context "with -" do
      it { "ruby-china社区".auto_correct!.should == "Ruby China 社区" }
    end

    context "do not change domain / code" do
      it { "www.ruby-lang.org".auto_correct!.should == "www.ruby-lang.org" }
      it { "rails 4.1.0.rc1 rubber fails, foo.rails.root set to nil".auto_correct!.should == "Rails 4.1.0.rc1 rubber fails, foo.rails.root set to nil" }
    end

    context "samples" do
      it { "OSX安装教程".auto_correct!.should == "OS X 安装教程" }
      it { "据说ios 6将会在明日发布".auto_correct!.should == "据说 iOS 6 将会在明日发布" }
      it { "Gitlab怎么集成GitlabCI".auto_correct!.should == "GitLab 怎么集成 GitLab CI"}
      it { "Gitlab.com地址".auto_correct!.should == "Gitlab.com 地址"}
      it { "[经验之谈]转行做ruby程序员的8个月, mysql经验".auto_correct!.should == "[经验之谈] 转行做 Ruby 程序员的 8 个月, MySQL 经验" }
      it { "vps上sessions不生效，但在本地的环境是ok的，why？".auto_correct!.should == "VPS 上 sessions 不生效，但在本地的环境是 ok 的，why？" }
      it { "全新的ruby web框架：lotus".auto_correct!.should == "全新的 Ruby web 框架：Lotus" }
      it { "grape写纯 api，选择哪个oauth gem好呢？".auto_correct!.should == "Grape 写纯 API，选择哪个 OAuth gem 好呢？" }
    end

    context 'with ActiveModel field_changed?' do
      it {
        u = User.new
        u.name = "foo的"
        u.name_changed?.should == false
        u.name_will_change!
        u.name.auto_correct!.should == "foo 的"
        u.name_change.should == ["foo的","foo 的"]
        u.name_changed?.should == true
      }
    end
  end
end
