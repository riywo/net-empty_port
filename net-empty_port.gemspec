# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'net/empty_port/version'

Gem::Specification.new do |spec|
  spec.name          = "net-empty_port"
  spec.version       = Net::EmptyPort::VERSION
  spec.authors       = ["Ryosuke IWANAGA"]
  spec.email         = ["riywo.jp@gmail.com"]
  spec.description   = %q{An empty port for TCP/UDP}
  spec.summary       = %q{This module can find, check and wait an empty TCP/UDP port.}
  spec.homepage      = "https://github.com/riywo/net-empty_port"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
