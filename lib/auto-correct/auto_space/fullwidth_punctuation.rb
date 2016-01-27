# coding: utf-8
require 'auto-correct/auto_space/base'

module AutoCorrect
  module AutoSpace
    class FullwidthPunctuation < Base

      between /[(?![年月日号])\w\p{Han}]/, /[，。！？：；”’]/, nospace: true, reverse_validate: false
      between /[‘“]/, /[(?![年月日号])\w\p{Han}]/, nospace: true, reverse_validate: false

    end
  end
end
