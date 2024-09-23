require 'yaml'

module Randamu
  DATA_DIR = File.join(__dir__, 'data')
  DATA = Dir.glob(File.join(DATA_DIR, '**', '*.yml')).each_with_object({}) do |file, data|
    data.merge!(YAML.load_file(file))
  end

  class Base
    class << self
      def load_data(key)
        keys = key.split('.')
        keys.reduce(DATA) { |data, k| data[k] }
      end
    end
  end
end

Dir.glob(File.join(File.dirname(__FILE__), 'randamu', '/**/*.rb')).each { |file| require file }