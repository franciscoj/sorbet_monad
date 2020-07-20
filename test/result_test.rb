# typed: true

require "test_helper"
require "sorbet-runtime"

class RTest < Minitest::Test
  extend T::Sig

  def test_unwrap_ok
    ok = R::Ok.new("foo")
    value = R.unwrap!(ok)

    assert  value == "foo"
  end

  def test_unwrap_err
    err = R::Err.new(failure: ['Some err msg'])

    assert_raises(R::UnwrapException) do
      R.unwrap!(err)
    end
  end
end
