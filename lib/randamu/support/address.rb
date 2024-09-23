module Randamu
  module Address
    def city
      load_data('addresses.city').sample
    end

    def state
      load_data('addresses.state').sample
    end

    def street
      load_data('addresses.street').sample
    end

    def zip_code
      load_data('addresses.zip_code').sample
    end

    def full_address
      "#{street}, #{city}, #{state}, #{zip_code}"
    end
  end
end
