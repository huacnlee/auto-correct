# coding: utf-8
class String
  def auto_space!
    self.gsub! /((?![年月日])\p{Han})([a-zA-Z0-9@#\/])/u do
      "#$1 #$2"
    end
    self.gsub! /([a-zA-Z0-9@#!\/]|[\d[年月日]])((?![年月日])\p{Han})/u do
      "#$1 #$2"
    end
    self
  end
end
