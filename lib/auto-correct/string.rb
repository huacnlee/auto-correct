# coding: utf-8
require "auto-correct/noun"
Dir[File.join(File.dirname(__FILE__), 'auto_space/*.rb')].each { |f| require f }

module AutoCorrect
  module String
    def auto_space!
      stragories = AutoCorrect::Configuration.new.auto_space_stragories || []
      stragories.each do |klass|
        klass.auto_correct!(self)
      end
      self
    end

    def auto_correct!
      self.auto_space!

      AutoCorrect::Noun.auto_correct!(self)

      self
    end

  end
end
