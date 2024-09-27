module Randamu
  class Boolean < Base
    # TODO: Implemment number.rb of boolean values to return
    class << self
      def boolean
        [true, false].sample
      end
    end
  end
end