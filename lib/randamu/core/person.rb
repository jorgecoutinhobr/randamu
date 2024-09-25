module Randamu
  class  Person < Base
    extend NameGenerator
    extend DocumentGenerator
    extend AcademicDataGenerator
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

