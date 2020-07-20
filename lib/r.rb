# typed: true
require "r/ok"
require "r/err"
require "sorbet-runtime"

module R
  extend T::Sig

  sig do
    type_parameters(:U)
      .params(value: T.type_parameter(:U))
      .returns(R::Ok[T.type_parameter(:U)])
  end
  def self.ok(value)
    Ok.new(value)
  end

  def self.err()
  end
end
