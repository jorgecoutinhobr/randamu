require 'yaml'
require 'pry'
require 'date'

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

      def load_keys(master_key)
        keys = master_key.split('.')
        keys.reduce(DATA) { |data, k| data[k] }.keys
      end
    end
  end
end

Dir.glob(File.join(File.dirname(__FILE__), 'randamu', '/support/*.rb')).each { |file| require file }
Dir.glob(File.join(File.dirname(__FILE__), 'randamu', '/generators/*.rb')).each { |file| require file }
Dir.glob(File.join(File.dirname(__FILE__), 'randamu', '/core/*.rb')).each { |file| require file }