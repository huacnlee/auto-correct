# coding: utf-8
require "yaml"
require "auto-correct/dicts"
Dir[File.join(File.dirname(__FILE__), 'auto_space/*.rb')].each { |f| require f }

module AutoCorrect
  module String
    def auto_space!
      stragories = YAML.load(File.read(File.expand_path('lib/auto-correct/enable.yml')))
      enabled_stragories =
        stragories.select do |key, value|
          value['Enabled']
        end.map do |key, value|
          names = key.split('/')
          constant = AutoCorrect
          names.each do |name|
            constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
          end
          constant
        end

      enabled_stragories.each do |klass|
        klass.auto_correct!(self)
      end
      self
    end

    def auto_correct!
      self.auto_space!

      self.gsub! /([\d\p{Han}：:]|\s|^)([a-zA-Z\d\-\_\.]+)([\d\p{Han},，。；]|\s|$)/u do
        key = "#$2".downcase
        if AutoCorrect::DICTS.has_key?(key)
          ["#$1",AutoCorrect::DICTS[key],"#$3"].join("")
        else
          "#$1#$2#$3"
        end
      end

      self
    end

  end
end
