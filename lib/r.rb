# typed: true
require "r/ok"
require "r/err"
require "sorbet-runtime"

module R
  extend T::Sig

  Error = Class.new(StandardError)
  UnwrapException = Class.new(Error)

  sig do
    type_parameters(:U)
      .params(value: T.type_parameter(:U))
      .returns(::R::Ok[T.type_parameter(:U)])
  end
  def self.ok(value)
    R::Ok[T.type_parameter(:U)].new(value)
  end

  sig do
    type_parameters(:U)
      .params(
        result: T.any(
          ::R::Ok[T.type_parameter(:U)],
          ::R::Err
        )
      ).returns(T.type_parameter(:U))
  end
  def self.unwrap!(result)
    case result
    when ::R::Err
      raise R::UnwrapException, result.errors
    when ::R::Ok
      result.value
    else
      T.absurd(result)
    end
  end

  sig do
    type_parameters(:U)
      .params(
        result: T.any(
          ::R::Ok[T.type_parameter(:U)],
          ::R::Err
        ),
        default: T.type_parameter(:U)
      ).returns(T.type_parameter(:U))
  end
  def self.unwrap_or(result, default)
    case result
    when ::R::Ok
      result.value
    when ::R::Err
      default
    else
      T.absurd(result)
    end
  end
end
