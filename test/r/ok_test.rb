# typed: true

require "test_helper"
require "sorbet-runtime"

class R::OkTest < Minitest::Test
  extend T::Sig

  def test_it_has_a_value
    ok = R::Ok[String].new("foo")

    assert ok.value == "foo"
  end
end
