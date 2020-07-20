# typed: strict

require "sorbet-runtime"

module R
  class Ok
    extend T::Sig
    extend T::Generic

    Elem = type_member

    sig { params(value: Elem).void }
    def initialize(value)
      @value = T.let(value, Elem)
    end

    sig { returns(Elem) }
    attr_reader :value
  end
end
