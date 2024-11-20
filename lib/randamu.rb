# frozen_string_literal: true

require 'yaml'
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
    end
  end
end

Dir.glob(File.join(File.dirname(__FILE__), 'randamu', '/support/*.rb')).sort.each { |file| require file }
Dir.glob(File.join(File.dirname(__FILE__), 'randamu', '/generators/*.rb')).sort.each { |file| require file }
Dir.glob(File.join(File.dirname(__FILE__), 'randamu', '/core/*.rb')).sort.each { |file| require file }
