# -*- encoding: utf-8 -*-
# stub: bson 1.12.5 ruby lib

Gem::Specification.new do |s|
  s.name = "bson"
  s.version = "1.12.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Emily Stolfo", "Durran Jordan", "Gary Murakami", "Tyler Brock", "Brandon Black"]
  s.date = "2015-12-01"
  s.description = "A Ruby BSON implementation for MongoDB. For more information about Mongo, see http://www.mongodb.org. For more information on BSON, see http://www.bsonspec.org."
  s.email = "mongodb-dev@googlegroups.com"
  s.executables = ["b2json", "j2bson"]
  s.files = ["bin/b2json", "bin/j2bson"]
  s.homepage = "http://www.mongodb.org"
  s.licenses = ["Apache License Version 2.0"]
  s.rubyforge_project = "bson"
  s.rubygems_version = "2.4.5"
  s.summary = "Ruby implementation of BSON"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version
end
