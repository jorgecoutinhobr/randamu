# frozen_string_literal: true

module Randamu
  class Map < Base
    class << self
      def full_address(state: nil)
        city_name, state_name = state ? address_with_state(state.upcase) : address_without_state
        "#{street}, #{rand(1..9999)}, #{city_name}, #{state_name} - #{zip_code}"
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
        Dictionary::STATES[state_acronym.to_sym]
      end

      def city(state: nil)
        return load_data("map.states.#{state.upcase}").sample if state

        load_data("map.states.#{Dictionary::STATES.keys.sample}").sample
      end

      def country
        load_data('map.countries').sample
      end

      private
        def address_with_state(state)
          city_name = city(state: state)
          state_name = Dictionary::STATES[state]
          [city_name, state_name]
        end

        def address_without_state
          region = Dictionary::REGIONS.keys.sample
          state_acronym = Dictionary::REGIONS[region].sample
          city_name = city(state: state_acronym)
          state_name = Dictionary::STATES[state_acronym.to_sym]
          [city_name, state_name]
        end
    end
  end
end
