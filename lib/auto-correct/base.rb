class AutoCorrect
  @@strategies = []

  class << self
    def rule(one, other, space: false, reverse: false)
      @@strategies << AutoCorrect::Strategery.new(one, other, space: space, reverse: reverse)
    end

    def strategies
      @@strategies
    end
  end
end
