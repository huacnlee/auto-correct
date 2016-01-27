# coding: utf-8
require "auto-correct/auto_space/date"

describe "AutoCorrect/AutoSpace/Date" do

  let(:text) { "" }
  subject { AutoCorrect::AutoSpace::Date.auto_correct!(text) }

  context 'when 年月日' do
    it { AutoCorrect::AutoSpace::Date.auto_correct!("于3月10日开始").should == "于 3月10日 开始" }
    it { AutoCorrect::AutoSpace::Date.auto_correct!("于3月开始").auto_space!.should == "于 3月 开始" }
    it { AutoCorrect::AutoSpace::Date.auto_correct!("于2009年开始").auto_space!.should == "于 2009年 开始" }
    it { AutoCorrect::AutoSpace::Date.auto_correct!("2013年3月10日-Ruby Saturday活动召集").auto_space!.should == "2013年3月10日-Ruby Saturday 活动召集" }
    it { AutoCorrect::AutoSpace::Date.auto_correct!("2013年12月22号开始出发").auto_space!.should == "2013年12月22号开始出发" }
    it { AutoCorrect::AutoSpace::Date.auto_correct!("12月22号开始出发").auto_space!.should == "12月22号开始出发" }
    it { AutoCorrect::AutoSpace::Date.auto_correct!("22号开始出发").auto_space!.should == "22号开始出发" }
  end

end
