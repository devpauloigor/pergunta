# -*- encoding: utf-8 -*-
# stub: yomu 0.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "yomu"
  s.version = "0.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Erol Fornoles"]
  s.date = "2013-02-10"
  s.description = "Read text and metadata from files and documents (.doc, .docx, .pages, .odt, .rtf, .pdf)"
  s.email = ["erol.fornoles@gmail.com"]
  s.homepage = "http://erol.github.com/yomu"
  s.rubygems_version = "2.4.5"
  s.summary = "Read text and metadata from files and documents (.doc, .docx, .pages, .odt, .rtf, .pdf)"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, [">= 0"])
    else
      s.add_dependency(%q<minitest>, [">= 0"])
    end
  else
    s.add_dependency(%q<minitest>, [">= 0"])
  end
end
