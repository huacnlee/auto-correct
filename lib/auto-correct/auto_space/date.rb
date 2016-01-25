# coding: utf-8
require 'auto-correct/auto_space/base'

module AutoCorrect
  module AutoSpace
    class Date < Base

      between /[\d[年月日]]{2,}/, /(?![年月日号])\p{Han}/

    end
  end
end
