Gem::Specification.new do |spec|
  spec.name          = "hash_extensions"
  spec.version       = "0.0.1"
  spec.authors       = ["Kevin Buchanan"]
  spec.summary       = "Some useful hash methods"

  spec.files         = Dir['lib/**/*.rb']
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rspec', '~> 3.0.0'
end
