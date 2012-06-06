# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "envie"

Gem::Specification.new do |s|
  s.name        = "envie"
  s.version     = Envie::VERSION
  s.authors     = ["Guilherme Silveira"]
  s.email       = ["caelum@github.com"]
  s.homepage    = "https://github.com/caelum/envie"
  s.summary     = %q{Simple api on feature toggle}
  s.description = %q{Simple api on feature toggle}

  s.rubyforge_project = "envie"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec", "~> 2.3.0"
  s.add_development_dependency "bundler", "~> 1.0.0"
  s.add_development_dependency "jeweler", "~> 1.5.2"
  s.add_development_dependency "rcov", ">= 0"
end
