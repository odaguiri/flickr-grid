# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flickr/grid/version'

Gem::Specification.new do |spec|
  spec.name          = "flickr-grid"
  spec.version       = Flickr::Grid::VERSION
  spec.authors       = ["Raul Odaguiri"]
  spec.email         = ["raulodaguiri@gmail.com"]

  spec.summary       = %q{Get 10 images and set a collage grid}
  spec.description   = %q{Get 10 images and set a collage grid}
  spec.homepage      = "https://github.com/odaguiri/flickr-grid"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = ["flickr-grid"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "flickraw", "~> 0.9.9"
  spec.add_runtime_dependency "rmagick", "~> 2.16.0"
  spec.add_runtime_dependency "rmagick-screwdrivers", "~> 0.2.0"
  spec.add_runtime_dependency "thor", "~> 0.19.4"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
