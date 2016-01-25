# coding: utf-8
require 'auto-correct/auto_space/base'

module AutoCorrect
  module AutoSpace
    class EnglishWord < Base

      between /(?![年月日号])\p{Han}/, /[a-zA-Z]/

    end
  end
end
