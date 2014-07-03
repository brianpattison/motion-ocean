# -*- encoding: utf-8 -*-
require File.expand_path("../lib/motion-ocean/version", __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "motion-ocean"
  spec.version       = MotionOcean::VERSION
  spec.authors       = ["Brian Pattison"]
  spec.email         = ["brian@brianpattison.com"]
  spec.description   = "A RubyMotion wrapper for the http://digitalocean.com API v2.0"
  spec.summary       = "MotionOcean is a RubyMotion wrapper for the Digital Ocean API v2.0"
  spec.homepage      = "https://github.com/brianpattison/motion-ocean"
  spec.license       = "MIT"

  files = []
  files << "README.md"
  files.concat(Dir.glob("lib/**/*.rb"))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "motion-cocoapods", "~> 1.5"
  spec.add_development_dependency "rake"
end
