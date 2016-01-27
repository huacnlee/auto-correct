require 'auto-correct/configuration'
require 'auto-correct/string'

module AutoCorrect

  class << self

    def configure
      @configuration ||= Configuration.new
      yield @configuration if block_given?
      @configuration
    end

    def config
      @configuration ||= Configuration.new
    end
  end
end

String.send :include, AutoCorrect::String
