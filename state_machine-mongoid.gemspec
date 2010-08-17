# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'state_machine-mongoid/version'

Gem::Specification.new do |s|
  s.name        = "state_machine-mongoid"
  s.version     = StateMachineMongoid::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Marcin Ciunelis"]
  s.email       = ["marcin.ciunelis@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/state_machine-mongoid"
  s.summary     = "Mongoid integration for pluginaweek state_machine"
  s.description = "Mongoid integration for pluginaweek state_machine via ActiveModel"
  
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "state_machine-mongoid"
  
  s.add_dependency "mongoid",        ">= 2.0.0.beta.16"
  s.add_dependency "state_machine",  ">= 0.9.4"
  
  s.add_development_dependency "bundler",  ">= 1.0.0.rc.5"
  s.add_development_dependency "rspec",    "= 1.3.0"
  s.add_development_dependency "bson_ext", "= 1.0.4"
  s.add_development_dependency "mongo",    "= 1.0.7"
  
  s.files        = Dir.glob("{lib}/**/*") + %w[LICENSE README.rdoc]
  s.require_path = 'lib'
end