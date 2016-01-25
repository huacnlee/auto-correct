# coding: utf-8
require "auto-correct/auto_space/english_word"

describe "AutoCorrect/AutoSpace/EnglishWord" do

  let(:text) { "" }
  subject { AutoCorrect::AutoSpace::EnglishWord.auto_correct!(text) }

  context 'simple Chinese and English' do
    let(:text) { "部署到heroku有问题网页不能显示" }
    it { should eq "部署到 heroku 有问题网页不能显示" }
  end
end
