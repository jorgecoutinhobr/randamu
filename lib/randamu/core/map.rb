module Randamu
  class Map < Base
    class << self
      def full_address
        "#{street}, #{rand(1..9999)}, #{city}, #{state} - #{zip_code}"
      end

      def street
        load_data('map.streets').sample
      end

      def additional_address_data
        load_data('map.additional_address_data').sample
      end

      def zip_code
        load_data('map.zip_codes').sample
      end

      def state(region: nil, acronym: false)
        state_acronym = region ? Dictionary::REGIONS[region].sample : Dictionary::STATES.keys.sample
        return state_acronym if acronym

        Dictionary::STATES[state_acronym]
      end

      def city(state: nil)
        return load_data("map.states.#{state}").sample if state
        load_data("map.states.#{Dictionary::STATES.keys.sample}").sample
      end

      def country
        load_data('map.countries').sample
      end
    end
  end
end
