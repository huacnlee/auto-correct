module AutoCorrect
  class Configuration
    attr_accessor :auto_space_stragories

    def initialize
      @auto_space_stragories = [
        AutoCorrect::AutoSpace::EnglishLetter,
        AutoCorrect::AutoSpace::Number,
        AutoCorrect::AutoSpace::SpecialSymbol,
        AutoCorrect::AutoSpace::Date
      ]
    end
  end
end
