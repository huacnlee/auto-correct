class AutoCorrect
  CJK = '\p{Han}|\p{Hangul}|\p{Hanunoo}|\p{Katakana}|\p{Hiragana}|\p{Bopomofo}'

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
    FULLDATE_RE = /[\s]{0,}\d+[\s]{0,}年[\s]{0,}\d+[\s]{0,}月[\s]{0,}\d+[\s]{0,}[日号][\s]{0,}/u
    DASH_HAN_RE = /([#{CJK}）】」》”’])([\-]+)([#{CJK}（【「《“‘])/
    LEFT_QUOTE_RE = /\s([（【「《])/
    RIGHT_QUOTE_RE = /([）】」》])\s/

    def ruby_format(str)
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
