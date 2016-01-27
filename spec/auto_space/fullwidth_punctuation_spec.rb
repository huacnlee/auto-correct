# coding: utf-8
require "auto-correct/auto_space/fullwidth_punctuation"

describe "AutoCorrect/AutoSpace/FullwidthPunctuation" do

  let(:text) { "" }
  subject { AutoCorrect::AutoSpace::FullwidthPunctuation.auto_correct!(text) }

  context 'when have fullwith punctuations' do
    context 'near the English word' do
      let(:text) { "剛剛買了一部 iPhone ，好開心！" }
      it { should eq "剛剛買了一部 iPhone，好開心！" }
    end

    context 'near the Chinese chars' do
      let(:text) { "升级了 10.9 附遇到的 bug 。" }
      it { should eq "升级了 10.9 附遇到的 bug。" }
    end

    context 'when have “”' do
      let(:text) { "他说 “ 10.9 非常值得升级 ”" }
      it { should eq "他说 “10.9 非常值得升级”" }
    end

    context 'when have ‘’' do
      let(:text) { "他说 ‘ 10.9 非常值得升级 ’" }
      it { should eq "他说 ‘10.9 非常值得升级’" }
    end
  end
end
