# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'podcasts/version'

Gem::Specification.new do |spec|
  spec.name          = "podcasts"
  spec.version       = Podcasts::VERSION
  spec.authors       = ["Adam Stevenson"]
  spec.email         = ["adamstevenson121@gmail.com"]
  
  spec.summary       = %q{Extract podcast and episode information from iTunes podcast feeds}
  spec.homepage      = "https://github.com/stevensona/podcasts.rb"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  
  spec.add_runtime_dependency 'nokogiri', '~> 1.6'
  spec.add_runtime_dependency 'httparty', '~> 0.13'
  
end
