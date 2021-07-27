class AutoCorrect
  CJK = '\p{Han}|\p{Hangul}|\p{Hanunoo}|\p{Katakana}|\p{Hiragana}|\p{Bopomofo}'
  SPACE = "[ ]"

  # rubocop:disable Style/StringLiterals
  # EnglishLetter
  rule CJK.to_s, '[a-zA-Z0-9]', space: true, reverse: true

  # SpecialSymbol
  rule CJK.to_s, '[\|+*]', space: true, reverse: true
  rule CJK.to_s, '[@]', space: true, reverse: false
  rule CJK.to_s, '[\[\(‘“]', space: true
  rule '[’”\]\)!%]', CJK.to_s, space: true
  rule '[”\]\)!]', '[a-zA-Z0-9]+', space: true

  # FullwidthPunctuation remove space case, Fullwidth can safe to remove spaces
  rule %r{[\w#{CJK}]}o, '[，。！？：；）」》】”’]', reverse: true
  rule '[‘“【「《（]', %r{[\w#{CJK}]}o, reverse: true

  class << self
    DASH_HAN_RE = /([#{CJK}）】」》”’])(-+)([#{CJK}（【「《“‘])/
    LEFT_QUOTE_RE = /#{SPACE}([（【「《])/
    RIGHT_QUOTE_RE = /([）】」》])#{SPACE}/

    def format(str)
      strategies.each do |s|
        str = s.format(str)
      end
      space_dash_with_hans(str)
    end

    private

    def space_dash_with_hans(str)
      str = str.gsub(DASH_HAN_RE, '\1 \2 \3')
      str = str.gsub(LEFT_QUOTE_RE, '\1')
      str.gsub(RIGHT_QUOTE_RE, '\1')
    end
  end
end
