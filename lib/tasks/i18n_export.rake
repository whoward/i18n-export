namespace :i18n do
  desc "exports all i18n translations according to configuration"
  task :export do
    I18nExport.export!
  end
end