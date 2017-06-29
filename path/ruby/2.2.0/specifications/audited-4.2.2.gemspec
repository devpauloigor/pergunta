# -*- encoding: utf-8 -*-
# stub: audited 4.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "audited"
  s.version = "4.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Brandon Keepers", "Kenneth Kalmer", "Daniel Morrison", "Brian Ryckbost", "Steve Richert", "Ryan Glover"]
  s.date = "2016-08-01"
  s.description = "Log all changes to your models"
  s.email = "info@collectiveidea.com"
  s.homepage = "https://github.com/collectiveidea/audited"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Log all changes to your models"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails-observers>, ["~> 0.1.2"])
      s.add_development_dependency(%q<protected_attributes>, [">= 0"])
      s.add_development_dependency(%q<appraisal>, ["~> 1.0.0"])
      s.add_development_dependency(%q<mongo_mapper>, ["~> 0.13.0.beta2"])
      s.add_development_dependency(%q<rails>, ["~> 4.2.0"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 3.0"])
    else
      s.add_dependency(%q<rails-observers>, ["~> 0.1.2"])
      s.add_dependency(%q<protected_attributes>, [">= 0"])
      s.add_dependency(%q<appraisal>, ["~> 1.0.0"])
      s.add_dependency(%q<mongo_mapper>, ["~> 0.13.0.beta2"])
      s.add_dependency(%q<rails>, ["~> 4.2.0"])
      s.add_dependency(%q<rspec-rails>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<rails-observers>, ["~> 0.1.2"])
    s.add_dependency(%q<protected_attributes>, [">= 0"])
    s.add_dependency(%q<appraisal>, ["~> 1.0.0"])
    s.add_dependency(%q<mongo_mapper>, ["~> 0.13.0.beta2"])
    s.add_dependency(%q<rails>, ["~> 4.2.0"])
    s.add_dependency(%q<rspec-rails>, ["~> 3.0"])
  end
end
