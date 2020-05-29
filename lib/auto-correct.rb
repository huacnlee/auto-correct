require "auto-correct/strategery"
require "auto-correct/base"
require "auto-correct/format"
require "auto-correct/html"
require "auto-correct/string"
require "auto-correct/version"
require "ffi"

class AutoCorrect
  extend FFI::Library
  ffi_lib File.expand_path("libautocorrect.so", __dir__)
  attach_function :c_format, [:string], :string

  class << self
    def format(str)
      c_format(str).force_encoding("utf-8")
    end
  end
end

String.send :include, AutoCorrect::String
