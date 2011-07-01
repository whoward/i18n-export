require "rubygems"
require "test/unit"

require File.expand_path("../lib/i18n_export.rb", File.dirname(__FILE__))

class Test::Unit::TestCase

  def setup
    # assign the configuration file
    I18nExport.config_file = fixture_filename("config.yml")
  end

  def teardown
    # remove temp files from the test/tmp directory
    Dir.glob(tempfile("*")).each do |filename|
      File.delete(filename)
    end
  end

protected

  def fixture(file)
    File.read(fixture_filename(file))
  end

  def fixture_filename(file)
    File.expand_path("fixture/#{file}", File.dirname(__FILE__))
  end

  def tempfile(filename)
    File.expand_path("tmp/#{filename}", File.dirname(__FILE__))
  end

end