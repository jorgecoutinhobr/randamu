require_relative 'number'

module Randamu
  class Date
    FUTURE_DATE =  (::Date.today + (365 * Number.number(min: 1))).strftime('%d/%m/%Y').freeze
    PRESENT_DATE = ::Date.today.strftime('%d/%m/%Y').freeze
    class << self
      def date(start_date: '01/01/1937', end_date: PRESENT_DATE, as_string: false)
        start_date = string_to_date(start_date)
        end_date = string_to_date(end_date)
        random_date = rand(start_date..end_date)

        return date_to_string(random_date) if as_string
        random_date
      end

      def future_date(start_date: PRESENT_DATE, end_date: FUTURE_DATE, string: false)
        start_date = string_to_date(start_date)
        end_date = string_to_date(end_date)
        random_date = rand(start_date..end_date)

        return date_to_string(random_date) if string
        random_date
      end

      private
        def string_to_date(string)
          ::Date.strptime(string, '%d/%m/%Y')
        end

        def date_to_string(date)
          date.strftime('%d/%m/%Y')
        end
    end
  end
end