require 'rails'

module I18nExport
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load "tasks/i18n_export.rake"
    end

    # Used for development
    config.to_prepare do
      is_running_rake = (File.basename($0) == "rake")
      
      unless is_running_rake
        I18nExport.export!
      end    
    end
  end
end