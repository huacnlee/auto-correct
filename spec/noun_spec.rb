require 'auto-correct/noun'

describe 'AutoCorrect::Noun' do
  let(:text) { "" }
  subject { AutoCorrect::Noun.auto_correct!(text) }

  context "between word" do
    it { AutoCorrect::Noun.auto_correct!("mOngodb").should == "MongoDB" }
    it { AutoCorrect::Noun.auto_correct!(" mongodb").should == " MongoDB" }
    it { AutoCorrect::Noun.auto_correct!(" mongodb ").should == " MongoDB " }
    it { AutoCorrect::Noun.auto_correct!("的 mongodb").should == "的 MongoDB" }
    it { AutoCorrect::Noun.auto_correct!("mongodb 的").should == "MongoDB 的" }
  end

  context "all words" do
    it "should word" do
      AutoCorrect::DICTS.map do |key, val|
        str = key.dup
        AutoCorrect::Noun.auto_correct!(str).should == val
      end
    end
  end

  context "word in inside other word" do
    it { AutoCorrect::Noun.auto_correct!("oruby").should == "oruby" }
  end

  context "with -" do
    it { AutoCorrect::Noun.auto_correct!("ruby-china 社区").should == "Ruby China 社区" }
  end

  context "do not change domain / code" do
    it { AutoCorrect::Noun.auto_correct!("www.ruby-lang.org").should == "www.ruby-lang.org" }
    it { AutoCorrect::Noun.auto_correct!("rails 4.1.0.rc1 rubber fails, foo.rails.root set to nil").should == "Rails 4.1.0.rc1 rubber fails, foo.rails.root set to nil" }
  end


end
