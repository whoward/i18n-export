require 'rails'

module I18nExport
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load "tasks/i18n_export.rake"
    end

    # Used for development
    config.to_prepare do
      I18nExport.export!
    end

    # Used for production
    config.after_initialize do
      I18nExport.export!
    end
  end
end