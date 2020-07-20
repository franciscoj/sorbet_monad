# typed: true

require "sorbet-runtime"

module R
  class Ok
    extend T::Sig
    extend T::Generic

    Elem = type_member

    sig { params(value: Elem).void }
    def initialize(value)
      @value = value
    end

    sig { returns(Elem) }
    attr_reader :value
  end
end
