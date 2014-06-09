# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fake_elasticache/version'

Gem::Specification.new do |spec|
  spec.name          = "fake_elasticache"
  spec.version       = FakeElasticache::VERSION
  spec.authors       = ["Steven Jack"]
  spec.email         = ["stevenmajack@gmail.com"]
  spec.summary       = %q{Creates an endpoint that mimics an elasticache cluster}
  spec.description   = %q{This gem is best suited to dev environments where you need to connect to a local memcached server but using the elasticache config endpoint.}
  spec.homepage      = "https://www.github.com/stevenjack/fake_elasticache"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "eventmachine"

end
