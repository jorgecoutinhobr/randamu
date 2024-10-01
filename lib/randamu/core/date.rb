module Randamu
  class Date
    DATE_FORMAT = '%d/%m/%Y'.freeze
    START_DATE = '01/01/1950'.freeze
    PRESENT_DATE = ::Date.today.strftime(DATE_FORMAT).freeze
    FUTURE_DATE =  (::Date.today + (365 * rand(1..100))).strftime(DATE_FORMAT).freeze

    class << self
      def date(start_date: START_DATE, end_date: PRESENT_DATE, as_string: false)
        generate_date(start_date, end_date, as_string)
      end

      def future_date(start_date: PRESENT_DATE, end_date: FUTURE_DATE, as_string: false)
        generate_date(start_date, end_date, as_string)
      end

      private
        def generate_date(start_date, end_date, as_string)
          start_date = string_to_date(start_date)
          end_date = string_to_date(end_date)
          random_date = rand(start_date..end_date)

          return date_to_string(random_date) if as_string
          random_date
        end
        def string_to_date(string)
          ::Date.strptime(string, DATE_FORMAT)
        end

        def date_to_string(date)
          date.strftime(DATE_FORMAT)
        end
    end
  end
end