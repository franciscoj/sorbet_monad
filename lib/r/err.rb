# typed: strict

require "sorbet-runtime"

module R
  class Err
    extend T::Sig
    extend T::Helpers

    Errors = T.type_alias { T::Hash[Symbol, T::Array[String]] }

    sig { params(errors: Errors).void }
    def initialize(errors)
      @errors = T.let(errors, Errors)
    end

    sig { returns(Errors) }
    attr_reader :errors
  end
end
