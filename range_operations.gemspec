lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "range_operations/version"

Gem::Specification.new do |spec|
  spec.name          = "range_operations"
  spec.version       = RangeOperations::Version::STRING
  spec.authors       = ["Joe Yates"]
  spec.email         = ["j.yates@leanpanda.com"]

  spec.summary       = "Perform operations on arrays of ranges."
  spec.homepage      = "https://github.com/leanpanda-com/range_operations"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(spec)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.11"
  spec.add_development_dependency "rake", ">= 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.70"
  spec.add_development_dependency "rubocop-rspec", "~> 1.33"
end
