# -*- encoding: utf-8 -*-
require File.expand_path("lib/i18n_export/version", File.dirname(__FILE__))

Gem::Specification.new do |s|
  s.name        = "i18n-export"
  s.version     = I18nExport::Version::STRING
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["William Howard"]
  s.email       = ["whoward.tke@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/i18n-export"
  s.summary     = "Export I18n translations in multiple formats"
  s.description = "Provides exporting functionality for subtrees of I18n translations.  Includes Railtie for Rails 3 integration."

  s.files         = [
    "lib/i18n_export.rb",
    "lib/i18n_export/version.rb",
    "lib/i18n_export/railtie.rb"
  ]

  s.test_files    = Dir.glob("test/**/*.rb")
  s.require_paths = ["lib"]
  s.homepage = %q{http://github.com/whoward/i18n-export}

  s.add_dependency "i18n"
  s.add_dependency "activesupport", "~> 3.0.0"
  s.add_development_dependency "rake"
end
