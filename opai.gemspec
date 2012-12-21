# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'opai/version'

Gem::Specification.new do |gem|
  gem.name          = "opai"
  gem.version       = Opai::VERSION
  gem.authors       = ["Sergio Morales"]
  gem.email         = ["i.serge23@gmail.com"]
  gem.description   = %q{Rails template application aiming to become a powerful, flexible, CLI based skeleton generator.}
  gem.summary       = %q{Rails template application aiming to become a powerful, flexible, CLI based skeleton generator.}
  gem.homepage      = "https://github.com/e-serge/opai"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
