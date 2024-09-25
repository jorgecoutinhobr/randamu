require_relative 'support/name'
require_relative 'support/document_generator'
require 'date'

module Randamu
  class  Person < Base
    extend Name
    extend DocumentGenerator
    class << self
      def age(min: 18, max: 80)
        rand(min..max)
      end

      # TODO IMPLEMENTAR DATAS FUTURAS
      def date(years_ago: 60)
        rand(Date.today - (365 * years_ago)..Date.today)
      end

    end
  end
end

