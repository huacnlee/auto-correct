# coding: utf-8
require 'auto-correct/auto_space/base'

module AutoCorrect
  module AutoSpace
    class SpecialSymbol < Base

      between /(?![年月日号])\p{Han}/, /[+$@#\/]/
      between /(?![年月日号])\p{Han}/, /[\[\(‘“]/, reverse_validate: false
      between /[’”\]\)!]/, /(?![年月日号])\p{Han}/, reverse_validate: false
      between /[a-zA-Z0-9]+/, /[\[\(‘“]/, reverse_validate: false
      between /[’”\]\)!]/, /[a-zA-Z0-9]+/, reverse_validate: false

    end
  end
end
