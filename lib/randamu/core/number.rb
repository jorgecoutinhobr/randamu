module Randamu
  class Number < Base
    class << self
      def number(min: 0, max: 100)
        rand(min..max)
        # '.2f' % rand(min..max) -> to get a float number with 2 decimal places but return a string
      end
    end
  end
end