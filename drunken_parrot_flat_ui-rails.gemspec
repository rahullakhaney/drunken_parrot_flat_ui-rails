# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'drunken_parrot_flat_ui/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "drunken_parrot_flat_ui-rails"
  spec.version       = DrunkenParrotFlatUi::Rails::VERSION
  spec.authors       = ["Tim"]
  spec.email         = ["timshingyu@gmail.com"]
  spec.summary       = %q{Drunken Parrot Flat UI For Rails 3.1 Asset Pipeline.}
  spec.description   = %q{This gem provides Drunken Parrot Flat UI for your Rails 3.1+ application.}
  spec.homepage      = "https://github.com/timshingyu/drunken_parrot_flat_ui-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency     'less-rails-bootstrap', '~> 3.3.1'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
