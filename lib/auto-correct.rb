require "auto-correct/strategery"
require "auto-correct/base"
require "auto-correct/format"
require "auto-correct/html"
require "auto-correct/string"
require "auto-correct/version"

class AutoCorrect
end

String.send :include, AutoCorrect::String