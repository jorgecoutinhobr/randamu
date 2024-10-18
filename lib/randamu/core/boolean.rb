# frozen_string_literal: true

module Randamu
  class Boolean < Base
    class << self
      def boolean
        [true, false].sample
      end
    end
  end
end
