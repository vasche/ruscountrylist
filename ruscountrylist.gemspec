# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruscountrylist/version'

Gem::Specification.new do |gem|
  gem.name          = "ruscountrylist"
  gem.version       = Ruscountrylist::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["vasche"]
  gem.email         = ["cho.vasche@gmail.com"]
  gem.description   = %q{Create russian country list table}
  gem.summary       = %q{Create russian country list table}
  gem.homepage      = "https://github.com/vasche"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.rubyforge_project = "ruscountrylist"
  
  gem.add_development_dependency 'rake'
end
