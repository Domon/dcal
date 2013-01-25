# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dcal/version'

Gem::Specification.new do |gem|
  gem.name          = 'dcal'
  gem.version       = DCal::VERSION
  gem.summary       = 'Just a stupid cal.'
  gem.description   = 'Just a stupid cal.'

  gem.license       = 'MIT'

  gem.author        = 'Chun-wei Kuo'
  gem.email         = 'Dendoh@gmail.com'
  gem.homepage      = 'https://github.com/Domon/dcal'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^test/})
  gem.require_path  = 'lib'

  gem.add_development_dependency 'rake'
end
