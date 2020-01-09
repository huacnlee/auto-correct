class AutoCorrect
  module String
    def auto_space!
      ActiveSupport::Deprecation.warn("String.auto_space! is deprecated and will be removed in auto-corrrect 1.0, please use AutoCorrect.format instead.")
      self.sub!(self, AutoCorrect.format(self))
    end

    def auto_correct!
      ActiveSupport::Deprecation.warn("String.auto_correct! is deprecated and will be removed in auto-corrrect 1.0, please use AutoCorrect.format instead.")
      self.sub!(self, AutoCorrect.format(self))
    end
  end
end
