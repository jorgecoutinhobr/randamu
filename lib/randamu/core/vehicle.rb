# frozen_string_literal: true

module Randamu
  class Vehicle < Base
    class << self
      def brand
        brands.keys.sample.capitalize
      end

      def car(brand: nil)
        vehicles_by_type(brand, 'cars')
      end

      def motorcycle(brand: nil)
        vehicles_by_type(brand, 'motorcycles')
      end

      private
        def brands
          load_data('vehicles.brands')
        end

        def vehicles_by_type(brand, type)
          return brands[brand.to_s][type].sample if brand

          brands.map { |_, v| v[type] }.compact.flatten.sample
        end
    end
  end
end
