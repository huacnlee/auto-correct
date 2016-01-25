# coding: utf-8
require "auto-correct/auto_space/number"

describe "AutoCorrect/AutoSpace/Number" do

  let(:text) { "" }
  subject { AutoCorrect::AutoSpace::Number.auto_correct!(text) }

  context 'when have numbers' do
    context 'near the English word' do
      let(:text) { "在 Ubuntu11.10 64位系统安装 newrelic 出错" }
      it { should eq "在 Ubuntu11.10 64 位系统安装 newrelic 出错" }
    end

    context 'near the Chinese chars' do
      let(:text) { "升级了10.9 附遇到的 bug" }
      it { should eq "升级了 10.9 附遇到的 bug" }
    end

    context 'complex1' do
      let(:text) { "喜欢暗黑2却对 D3不满意的可以看看这个。。" }
      it { should eq "喜欢暗黑 2 却对 D3 不满意的可以看看这个。。" }
    end

    context 'complex2' do
      let(:text) { "在做 ROR 3.2 Tutorial 第 Chapter 9.4.2遇到一个问题求助！" }
      it { should eq "在做 ROR 3.2 Tutorial 第 Chapter 9.4.2 遇到一个问题求助！" }
    end
  end
end
