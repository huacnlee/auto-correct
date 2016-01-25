# coding: utf-8
require "auto-correct/dicts"

module AutoCorrect
  module String
    def auto_space!
      self.gsub! /((?![年月日号])\p{Han})([a-zA-Z0-9+$@#\[\(\/‘“])/u do
        "#$1 #$2"
      end

      self.gsub! /([a-zA-Z0-9+$’”\]\)@#!\/]|[\d[年月日]]{2,})((?![年月日号])\p{Han})/u do
        "#$1 #$2"
      end

      # Fix () [] near the English and number
      self.gsub! /([a-zA-Z0-9]+)([\[\(‘“])/u do
        "#$1 #$2"
      end

      self.gsub! /([\)\]’”])([a-zA-Z0-9]+)/u do
        "#$1 #$2"
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
