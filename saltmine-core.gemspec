# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'saltmine/core/version'

Gem::Specification.new do |spec|
  spec.name          = 'saltmine-core'
  spec.version       = Saltmine::Core::VERSION
  spec.authors       = ['Florian Kraft']
  spec.email         = ['FlorianKraft@gmx.de']

  spec.summary       = 'Core entities and processes for Saltmine'
  spec.homepage      = 'https://github.com/floriank/saltmine-core'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rom-sql', '~> 0.5'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.3'
  spec.add_development_dependency 'rubocop', '~> 0.32'
end
