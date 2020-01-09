class AutoCorrect
  # rubocop:disable Style/StringLiterals
  # EnglishLetter
  rule '\p{Han}', '[0-9a-zA-Z]', space: true, reverse: true

  # SpecialSymbol
  rule '\p{Han}', '[\|+$@#]', space: true, reverse: true
  rule '\p{Han}', '[\[\(‘“]', space: true
  rule '[’”\]\)!%]', '\p{Han}', space: true
  rule '[”\]\)!]', '[a-zA-Z0-9]+', space: true

  # FullwidthPunctuation
  rule '[\w\p{Han}]', '[，。！？：；」》】”’]', reverse: true
  rule '[‘“【「《]', '[\w\p{Han}]', reverse: true

  class << self
    FULLDATE_RE = /[\s]{0,}\d+[\s]{0,}年[\s]{0,}\d+[\s]{0,}月[\s]{0,}\d+[\s]{0,}[日号][\s]{0,}/u

    def format(str)
      out = str
      self.strategies.each do |s|
        out = s.format(out)
      end
      out = remove_full_date_spacing(out)
      out
    end

    private

      def remove_full_date_spacing(str)
        str.gsub(FULLDATE_RE) do |m|
          m.gsub(/\s+/, "")
        end
      end
  end
end
