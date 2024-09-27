module Randamu
  class Business < Base
    class << self
      def company_name ; end
      def profession ; end

      # CRIAR CLASSE SUBSCRIPTION
      def sub(*options)
        load_data('map.states.RJ').sample
      end
    end
  end
end