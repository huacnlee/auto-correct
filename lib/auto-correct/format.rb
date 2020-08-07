class AutoCorrect
  CJK = '\p{Han}|\p{Hangul}|\p{Hanunoo}|\p{Katakana}|\p{Hiragana}|\p{Bopomofo}'
  SPACE = "[ ]"

  # rubocop:disable Style/StringLiterals
  # EnglishLetter
  rule "#{CJK}", '[0-9a-zA-Z]', space: true, reverse: true

  # SpecialSymbol
  rule "#{CJK}", '[\|+$@#*]', space: true, reverse: true
  rule "#{CJK}", '[\[\(‘“]', space: true
  rule '[’”\]\)!%]', "#{CJK}", space: true
  rule '[”\]\)!]', '[a-zA-Z0-9]+', space: true

  # FullwidthPunctuation
  rule %r([\w#{CJK}]), '[，。！？：；」》】”’]', reverse: true
  rule '[‘“【「《]', %r([\w#{CJK}]), reverse: true

  class << self
    FULLDATE_RE = /#{SPACE}{0,}\d+#{SPACE}{0,}年#{SPACE}{0,}\d+#{SPACE}{0,}月#{SPACE}{0,}\d+#{SPACE}{0,}[日号]#{SPACE}{0,}/u
    DASH_HAN_RE = /([#{CJK}）】」》”’])([\-]+)([#{CJK}（【「《“‘])/
    LEFT_QUOTE_RE = /#{SPACE}([（【「《])/
    RIGHT_QUOTE_RE = /([）】」》])#{SPACE}/

    def format(str)
      out = str
      self.strategies.each do |s|
        out = s.format(out)
      end
      out = remove_full_date_spacing(out)
      out = space_dash_with_hans(out)
      out
    end

    private

      def remove_full_date_spacing(str)
        str.gsub(FULLDATE_RE) do |m|
          m.gsub(/\s+/, "")
        end
      end

      def space_dash_with_hans(str)
        str = str.gsub(DASH_HAN_RE, '\1 \2 \3')
        str = str.gsub(LEFT_QUOTE_RE, '\1')
        str = str.gsub(RIGHT_QUOTE_RE, '\1')
        str
      end
  end
end
