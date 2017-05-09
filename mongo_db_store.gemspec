# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongo_db_store/version'

Gem::Specification.new do |spec|
  spec.name          = 'mongo_db_store'
  spec.version       = MongoDbStore::VERSION
  spec.authors       = ['Erich Quintero']
  spec.email         = ['qbantek@gmail.com']

  spec.summary       = 'Rails-compatible cache store for MongoDB using Mongoid.'
  spec.homepage      = 'https://github.com/qbantek/mongo_db_store'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) {|f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'mongoid', '~> 6.1'
  spec.add_runtime_dependency 'activesupport', '~> 5.1'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
