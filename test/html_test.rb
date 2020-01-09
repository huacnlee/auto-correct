require "test_helper"

class FormatHTMLTest < ActiveSupport::TestCase
  test "format_html" do
    expected = read_file("example.expected.txt")
    out = AutoCorrect.format_html(read_file("example.txt"))

    assert_html_equal expected, out
  end
end
