
module I18nExport
  class Railtie < Rails::Railtie
    # rake_tasks do
    #   load File.expand_path("../../tasks/i18n_export.rake", File.dirname(__FILE__))
    # end

    # # Used for development
    # config.to_prepare do
    #   I18nExport.export!
    # end

    # # Used for production
    # config.after_initialize do
    #   I18nExport.export!
    # end
  end
end