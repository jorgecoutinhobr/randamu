module Randamu
  class Address < Base
    class << self
      def city
        load_data('address.city').sample
      end

      def state
        load_data('address.state').sample
      end

      def street
        load_data('address.street').sample
      end

      def zip_code
        load_data('address.zip_code').sample
      end

      def full_address
        "#{street}, #{city}, #{state}, #{zip_code}"
      end
    end
  end
end