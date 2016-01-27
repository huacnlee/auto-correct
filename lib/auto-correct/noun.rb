require "auto-correct/dicts"
module AutoCorrect
  class Noun

    def self.auto_correct!(content)
      content.gsub! /([\d\p{Han}：:]|\s|^)([a-zA-Z\d\-\_\.]+)([\d\p{Han},，。；]|\s|$)/u do
        key = "#$2".downcase
        if AutoCorrect::DICTS.has_key?(key)
          ["#$1",AutoCorrect::DICTS[key],"#$3"].join("")
        else
          "#$1#$2#$3"
        end
      end

      content
    end
  end
end
