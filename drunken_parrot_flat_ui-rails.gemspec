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

  spec.add_dependency 'less-rails-bootstrap',    '>= 3.2.0'
  spec.add_dependency 'jquery-rails',            '>= 3.1.1'
  spec.add_dependency 'jquery-ui-rails',         '>= 5.0.0'
  spec.post_install_message = "" \
  "**********************************************\n\n" \
  "Run `rails generate drunken:install <Licensed Drunken Parrot Flat UI directory>` to copy licensed files to this gem.\n" \
  "Run `rails generate drunken:demo` to install demo page to your rails app\n\n" \
  "**********************************************"
end