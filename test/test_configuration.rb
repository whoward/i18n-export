require File.expand_path('helper', File.dirname(__FILE__))

class TestConfiguration < Test::Unit::TestCase

  def test_configured_filename
    I18nExport.config_file = nil # defaults to config/i18n-export.yml

    assert_raise(Errno::ENOENT) { I18nExport::Config.new }

    I18nExport.config_file = fixture_filename("config.yml")

    assert_nothing_raised { I18nExport::Config.new }
  end

  def test_manually_configured_filename
    I18nExport.config_file = nil

    assert_raise(Errno::ENOENT) { I18nExport::Config.new }
    assert_nothing_raised { I18nExport::Config.new(fixture_filename "config.yml") }
  end

  def test_values
    config = I18nExport::Config.new

    assert_equal 3, config.file_definitions.length

    assert_equal "test/tmp/app.js", config.file_definitions.first.filename
    assert_equal ["app"], config.file_definitions.first.filters
  end

end