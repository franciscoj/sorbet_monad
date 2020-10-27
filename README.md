# Hello monad!

I've been lately using [Sorbet][sorbet] a lot. Besides that I've been using
monads at work for some stuff. Specifically the `Result` monad.

I got specially inspired by the way it is implemented in [Rust][rust-result].
Some time ago, I started using it at work and it "resulted" in a very good
experience.

We even expanded it little by little with more functionalities like a `map`
method.

Unfortunately our initial implementation didn't take types into account and I
was recently curious, can sorbet do this?

What I wanted was:

- Simple interface
- Typed success case (carrying a value)
- Error case that carries only error names/msgs

After some trial/error I managed to get it working like this:

```ruby
ok = R::Ok.new("foo")
value = R.unwrap!(ok)
assert value == "foo"
T.reveal_type(value) # Revealed type: `R::Ok[String]`
R.unwrap_or(ok, "bar") # => "foo"

err = R::Err.new(fail: ["We broke it!"])
R.unwrap!(err) # raises R::UnwrapException
value = R.unwrap_or("baz")
assert value == "baz"
```

It can be easily used to type params and returns with sorbet


```ruby
class Dummy
  extend T::Sig
  Result = T.type_alias { T.any(R::Err, R::Ok[String]) }

  sig { returns(::Dummy::Result) }
  def call
    R::Ok.new("foo")
  end
end

```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sorbet_monad'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install sorbet_monad

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sorbet_monad. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/sorbet_monad/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SorbetMonad project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/sorbet_monad/blob/master/CODE_OF_CONDUCT.md).

[sorbet]: https://sorbet.org
[rust-result]: https://doc.rust-lang.org/std/result/enum.Result.html
