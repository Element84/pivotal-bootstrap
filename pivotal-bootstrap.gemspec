# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pivotal-bootstrap/version'

Gem::Specification.new do |gem|
  gem.name          = "pivotal-bootstrap"
  gem.version       = Pivotal::Bootstrap::VERSION
  gem.authors       = ["Patrick Quinn"]
  gem.email         = ["patrick@element84.com"]
  gem.description   = %q{Imports stories in a YAML file into Pivotal Tracker}
  gem.summary       = <<-EOS
This gem provides a command-line application, "pivotal-bootstrap", which
imports stories from one or more YAML files into Pivotal Tracker.

The command makes it easy to bootstrap new projects with a common set of
pre-canned stories or to quickly capture stories in a text file for later
import.

YAML files contain grouped stories, allowing you to choose which groups to import.
This is useful when bootstrapping a new Pivotal project with common stories,
since every group of stories may not be applicable to every type of project
(see the example stories.yml for an instance of this).
EOS

  gem.homepage      = ""

  gem.license = 'MIT'
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
