# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'packlink_lite/version'

Gem::Specification.new do |spec|
  spec.name          = 'packlink_lite'
  spec.version       = PacklinkLite::VERSION
  spec.authors       = ['Laurynas Butkus']
  spec.email         = ['laurynas.butkus@gmail.com']

  spec.summary       = %q{Packlink.com API client}
  spec.description   = %q{Client to access packlink.com shipping API}
  spec.homepage      = 'https://github.com/laurynas/packlink_lite'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client', '~> 1.8'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'dotenv', '~> 2.1'
  spec.add_development_dependency 'webmock', '~> 1.24'
end
