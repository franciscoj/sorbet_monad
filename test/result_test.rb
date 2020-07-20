# typed: true

require "test_helper"
require "sorbet-runtime"

class RTest < Minitest::Test
  extend T::Sig

  def test_ok
    ok = R.ok("foo")

    T.let(ok.value, String)
    assert ok.value == "foo"
  end
end
