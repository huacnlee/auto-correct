require "minitest/autorun"
require "active_support"
require "auto-correct"

Minitest.backtrace_filter = Minitest::BacktraceFilter.new

class ActiveSupport::TestCase
  def read_file(fname)
    load_file(fname).read.strip
  end

  def load_file(fname)
    File.open(File.join(__dir__, "fixtures", fname))
  end

  def assert_html_equal(excepted, html)
    assert_equal excepted.strip.gsub(/>\s+</, "><"), html.strip.gsub(/>\s+</, "><")
  end

  def assert_format_cases(cases)
    cases.each_key do |source|
      actual = AutoCorrect.format(source.to_s)
      assert_equal cases[source], actual
    end
  end
end
