module AutoCorrect
  module AutoSpace
    class CorrectStrategory
      attr_reader :one, :other, :options

      def initialize(one, other, options)
        @one = one
        @other = other
        @options = options
      end

      def correct!(content)
        options[:nospace] ? remove_space!(content) : add_space!(content)
      end

      private
      def add_space!(content)
        content.gsub! /(#{one})(#{other})/u do
          "#$1 #$2"
        end

        return if options[:reverse_validate] == false

        content.gsub! /(#{other})(#{one})/u do
          "#$1 #$2"
        end
      end

      def remove_space!(content)
        content.gsub! /(#{one})\s+(#{other})/u do
          "#$1#$2"
        end

        return if options[:reverse_validate] == false

        content.gsub! /(#{other})\s+(#{one})/u do
          "#$1#$2"
        end
      end
    end

    class Base

      def self.between(one, other, options = {})
        @correct_strategies ||= []
        @correct_strategies << CorrectStrategory.new(one, other, options)
      end

      def self.auto_correct!(content)
        Array(@correct_strategies).each do |strategory|
          strategory.correct!(content)
        end
        content
      end
    end
  end
end
