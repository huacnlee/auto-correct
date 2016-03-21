# coding: utf-8
require "auto-correct/auto_space/special_symbol"

describe "AutoCorrect/AutoSpace/SpecialSymbol" do

  let(:text) { "" }
  subject { AutoCorrect::AutoSpace::SpecialSymbol.auto_correct!(text) }

  context 'when have []' do
    let(:text) { "[北京]美企聘 site/web 大型应用开发高手-Ruby" }
    it { should eq "[北京] 美企聘 site/web 大型应用开发高手-Ruby" }
  end

  context 'when have ()' do
    let(:text) { "[成都](团 800)招聘 Rails 工程师" }
    it { should eq "[成都](团 800) 招聘 Rails 工程师" }
  end

  context 'when have .' do
    let(:text) { "Teahour.fm 第 18 期发布" }
    it { should eq "Teahour.fm 第 18 期发布" }
  end

  context 'when have !' do
    context 'neer English' do
      let(:text) { "Yes!升级到了 Rails 4" }
      it { should eq "Yes! 升级到了 Rails 4" }
    end
    context 'near Chinese' do
      let(:text) { "到了!升级到了 Rails 4" }
      it { should eq "到了! 升级到了 Rails 4" }
    end
  end

  context 'when have #' do
    let(:text) { "个人信息显示公开记事本,记事本显示阅读次数#149" }
    it { should eq "个人信息显示公开记事本,记事本显示阅读次数 #149" }
  end

  context 'when have @' do
    let(:text) { "里面用@foo 符号的话后面的变量名会被替换成 userN" }
    it { should eq "里面用 @foo 符号的话后面的变量名会被替换成 userN" }
  end

  context 'when have URL' do
    let(:text) { "http://sourceforge.net/解禁了" }
    it { should eq "http://sourceforge.net/ 解禁了" }
  end

  context "when English has it's" do
    let(:text) { "without looking like it’s been marked up with tags or formatting instructions." }
    it { should eq "without looking like it’s been marked up with tags or formatting instructions." }
  end
end
