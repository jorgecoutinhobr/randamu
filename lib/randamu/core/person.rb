module Randamu
  class  Person < Base
    extend NameGenerator
    class << self
      def profession ; end
      def blood_type ; end
      def gender ; end

    end
  end
end

