# typed: true

require "test_helper"
require "sorbet-runtime"

class R::ErrTest < Minitest::Test
  extend T::Sig

  def test_it_has_only_errors
    err = R::Err.new(fail: ["foo"])

    assert err.errors == {fail: ["foo"]}
  end
end
