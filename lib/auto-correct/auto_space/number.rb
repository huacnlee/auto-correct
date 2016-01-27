# coding: utf-8
require 'auto-correct/auto_space/base'

module AutoCorrect
  module AutoSpace
    class Number < Base

      between /(?![年月日号])\p{Han}/, /[0-9]/

    end
  end
end
