# typed: true

require "test_helper"
require "sorbet-runtime"

class Dummy
  extend T::Sig
  Result = T.type_alias { T.any(::R::Ok[String], ::R::Err) }

  sig { returns(Result) }
  def call
    R::Ok.new("foo")
  end

  # sig { returns(Result) }
  # def fail
  #   R::Ok[Integer].new(1)
  # end
end

class RTest < Minitest::Test
  extend T::Sig

  def test_unwrap_ok
    ok = R::Ok.new("foo")
    value = R.unwrap_or(ok, "foo")

    assert value == "foo"
  end

  def test_unwrap_err
    err = R::Err.new(failure: ["Some err msg"])

    assert_raises(R::UnwrapException) do
      R.unwrap!(err)
    end
  end

  def test_dummy_class
    res = Dummy.new.call
    # The type for this is "foo" instead of `String` if you
    # do T.reveal_type(R.unwrap!(res))
    require 'byebug'; byebug
    value = T.let(R.unwrap!(res), String)

    assert R.unwrap!(res) != "foo"
  end
end
