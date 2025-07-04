# -*- encoding: utf-8 -*-
# stub: prawn-table 0.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "prawn-table".freeze
  s.version = "0.2.2".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Gregory Brown".freeze, "Brad Ediger".freeze, "Daniel Nelson".freeze, "Jonathan Greenberg".freeze, "James Healy".freeze, "Hartwig Brandl".freeze]
  s.date = "2015-07-16"
  s.description = "  Prawn::Table provides tables for the Prawn PDF toolkit\n".freeze
  s.email = ["gregory.t.brown@gmail.com".freeze, "brad@bradediger.com".freeze, "dnelson@bluejade.com".freeze, "greenberg@entryway.net".freeze, "jimmy@deefa.com".freeze, "mail@hartwigbrandl.at".freeze]
  s.homepage = "https://github.com/prawnpdf/prawn-table".freeze
  s.licenses = ["RUBY".freeze, "GPL-2".freeze, "GPL-3".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "2.4.5".freeze
  s.summary = "Provides tables for PrawnPDF".freeze

  s.installed_by_version = "3.6.7".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<prawn>.freeze, [">= 1.3.0".freeze, "< 3.0.0".freeze])
  s.add_development_dependency(%q<pdf-inspector>.freeze, ["~> 1.1.0".freeze])
  s.add_development_dependency(%q<yard>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["= 2.14.1".freeze])
  s.add_development_dependency(%q<mocha>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<prawn-manual_builder>.freeze, [">= 0.2.0".freeze])
  s.add_development_dependency(%q<pdf-reader>.freeze, ["~> 1.2".freeze])
end
