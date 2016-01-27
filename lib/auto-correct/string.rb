# coding: utf-8
require "yaml"
require "auto-correct/dicts"
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

      self.gsub! /([\d\p{Han}：:]|\s|^)([a-zA-Z\d\-\_\.]+)([\d\p{Han},，。；]|\s|$)/u do
        key = "#$2".downcase
        if AutoCorrect::DICTS.has_key?(key)
          ["#$1",AutoCorrect::DICTS[key],"#$3"].join("")
        else
          "#$1#$2#$3"
        end
      end

      self
    end

  end
end
