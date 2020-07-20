require_relative "lib/sorbet_monad/version"

Gem::Specification.new do |spec|
  spec.name = "sorbet_monad"
  spec.version = SorbetMonad::VERSION
  spec.authors = ["Fran Casas"]
  spec.email = ["nflamel@gmail.com"]

  spec.homepage = "https://github.com/franciscoj/sorbet_monad"
  spec.summary = "Typed monads for sorbet"
  spec.description = "Results, Maybes and all that stuff. But typed for using it with sorbet"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/franciscoj/sorbet_monad"
  spec.metadata["changelog_uri"] = "https://github.com/franciscoj/sorbet_monad/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
