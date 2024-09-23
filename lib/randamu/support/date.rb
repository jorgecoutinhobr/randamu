module Randamu
  module Date
    def date(min: 0, max: 365)
      ::Date.today - rand(min..max)
    end

    def date_between(start_date: ::Date.today - 365, end_date: ::Date.today)
      rand(start_date..end_date)
    end

    def date_of_birth(min: 1, max: 65)
      ::Date.today - (rand(min..max) * 365)
    end
  end
end