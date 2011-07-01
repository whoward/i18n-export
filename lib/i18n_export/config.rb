require 'yaml'

module I18nExport
  class Config
    class FileDefinition < Struct.new(:filename, :filters)
    end
    
    def initialize(filename=I18nExport.config_file)
      # lets make sure the file exists
      raise Errno::ENOENT unless File.file?(filename)

      @filename = filename
    end

    def file_definitions
      (config["translations"] || []).map do |defn|
        FileDefinition.new(defn["file"], defn["only"])
      end
    end

  private
    def config
      @config ||= YAML.load_file(@filename)
    end

  end
end