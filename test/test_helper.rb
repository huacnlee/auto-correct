require "minitest/autorun"
require "active_support"
require "auto-correct"

Minitest.backtrace_filter = Minitest::BacktraceFilter.new

class ActiveSupport::TestCase
  def assert_format_cases(cases)
    cases.each_key do |source|
      actual = AutoCorrect.format(source.to_s)
      assert_equal cases[source], actual
    end
  end
end
