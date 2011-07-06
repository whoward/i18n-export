require File.expand_path("i18n_export/config", File.dirname(__FILE__))
require "active_support"

module I18nExport

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
    FileUtils.mkdir_p File.dirname(definition.filename)

    open(definition.filename, "w+") do |f|
      f.print "var I18n = I18n || {};\n"
      f.print "I18n.translations = "
      f.print ActiveSupport::JSON.encode(generate_output(definition.filters))
      f.print ";"
    end
  end

  def self.generate_output(filters)
    result = {}

    I18n.available_locales.each do |locale|
      if filters.nil? or filters.empty?
        result[locale] = I18n.t('.', :locale => locale)
      else
        result[locale] ||= {}

        filters.each do |filter|
          insert_data(I18n.t(filter, :locale => locale), filter.split("."), result[locale])
        end
      end
    end

    result
  end

  def self.insert_data(data, path, result)
    component = path.shift

    if path.empty?
      result[component] = data
    else
      result[component] ||= {}
      insert_data(data, path, result[component])
    end
  end

end


require File.expand_path("i18n_export/railtie", File.dirname(__FILE__)) if defined?(Rails) and Rails.version >= "3.0.0"