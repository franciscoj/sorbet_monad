# typed: true
require "test_helper"

class SorbetMonadTest < Minitest::Test
  def test_result_ok
    ok = R.ok("foo")

    assert ok.value == "foo"
  end
end
