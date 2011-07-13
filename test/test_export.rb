require File.expand_path('helper', File.dirname(__FILE__))
require 'yaml'

class TestExport < Test::Unit::TestCase

  def setup
    super

    I18n.available_locales = nil

    translations = YAML::load_file(fixture_filename("translations.yml"))

    translations.each do |locale, translations|
      I18n.backend.store_translations(locale, translations)
    end
  end

  def teardown
    super
    I18n.available_locales = nil
  end

  def test_configuration
    assert I18nExport.configuration.is_a?(I18nExport::Config)
  end

  def test_file_created
    assert_equal false, File.file?(tempfile("app.js"))
    
    I18nExport.export!

    assert_equal true, File.file?(tempfile("app.js"))
  end

  def test_nested_directory
    I18nExport.config_file = fixture_filename("config-with-nested-directory.yml")

    assert_nothing_thrown do
      I18nExport.export!
    end
  end

  def test_full_export
    I18nExport.export!

    assert_equal fixture("all.js"), File.read(tempfile "all.js")
  end

  def test_partial_export
    I18nExport.export!

    assert_equal fixture("app.js"), File.read(tempfile "app.js")
    assert_equal fixture("client.js"), File.read(tempfile "client.js")
  end


end