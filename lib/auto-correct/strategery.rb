class AutoCorrect
  class Strategery
    attr_reader :space, :reverse
    attr_reader :add_space_rules, :remove_space_rules

    def initialize(one, other, space: false, reverse: false)
      @space = space
      @reverse = reverse

      @add_space_rules = [
        /(#{one})(#{other})/u,
        /(#{other})(#{one})/u
      ]

      @remove_space_rules = [
        /(#{one})\s+(#{other})/u,
        /(#{other})\s+(#{one})/u
      ]
    end

    def format(str)
      self.space ? add_space(str) : remove_space(str)
    end

    def add_space(str)
      r0, r1 = add_space_rules
      str = str.gsub(r0) { "#$1 #$2" }
      if self.reverse
        str = str.gsub(r1) { "#$1 #$2" }
      end
      str
    end

    def remove_space(str)
      r0, r1 = remove_space_rules
      str = str.gsub(r0) { "#$1 #$2" }
      if self.reverse
        str = str.gsub(r1) { "#$1 #$2" }
      end
      str
    end
  end
end
