# autocorrect: false
require "test_helper"

class FormatTest < ActiveSupport::TestCase
  test "format" do
    assert_equal AutoCorrect.format("Hello你好!"), "Hello 你好！"
  end

  test "format_html" do
    assert_equal AutoCorrect.format_html("<span>Hello你好!</span>"), "<span>Hello 你好！</span>"
  end
end
