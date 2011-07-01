require File.expand_path("i18n_export/config", File.dirname(__FILE__))
require "active_support"

module I18nExport

  require "i18n_export/railtie" if defined?(Rails) and Rails.version >= "3.0"

  def self.config_file=(file)
    @@config_file = file
  end

  def self.config_file
    @@config_file ||= "config/i18n-export.yml"
  end

  def self.configuration
    I18nExport::Config.new(config_file)
  end

  def self.export!
    configuration.file_definitions.each {|definition| export_file(definition) }
  end

private
  def self.export_file(definition)
    open(definition.filename, "w+") do |f|
      f.print "var I18n = I18n || {};\n"
      f.print "I18n.translations = "
      f.print ActiveSupport::JSON.encode(generate_output(definition.filters))
      f.print ";"
    end
  end

  def self.generate_output(filters)
    result = {}

    result
  end

  def self.lookup(key)
    I18n.translate(key, :raise => true)
  end

end