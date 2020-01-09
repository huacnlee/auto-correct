require "test_helper"

class StringTest < ActiveSupport::TestCase
  test "auto_space!" do
    str = "升级了macOS 10.9附遇到的Bug概率有0.1%或更少"
    str.auto_space!
    assert_equal "升级了 macOS 10.9 附遇到的 Bug 概率有 0.1% 或更少", str
  end

  test "auto_correct!" do
    str = "升级了macOS 10.9附遇到的Bug概率有0.1%或更少"
    str.auto_correct!
    assert_equal "升级了 macOS 10.9 附遇到的 Bug 概率有 0.1% 或更少", str
  end
end