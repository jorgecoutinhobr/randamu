module Randamu
  class Animal < Base
    class << self
      ANIMAL_TYPES = %w(mammal bird fish amphibian reptile insect random)

      def animal(type: :random)
        animal_type(type).sample
      end

      private
        def animal_type(type)
          return all_animals unless ANIMAL_TYPES.include?(type.to_s)
          type == :random ? all_animals : load_data("animals.#{type}s")
        end

        def all_animals
          ANIMAL_TYPES.map { |type| load_data("animals.#{type}s") }.flatten
        end
    end
  end
end
