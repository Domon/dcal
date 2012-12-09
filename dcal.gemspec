# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dcal/version'

Gem::Specification.new do |gem|
  gem.name          = "dcal"
  gem.version       = DCal::VERSION
  gem.authors       = ["Chun-wei Kuo"]
  gem.email         = ["Dendoh@gmail.com"]
  gem.description   = %q{Just a stupid cal.}
  gem.summary       = %q{Just a stupid cal.}
  gem.homepage      = "https://github.com/Domon/dcal"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^test/})
  gem.require_paths = ["lib"]
end
