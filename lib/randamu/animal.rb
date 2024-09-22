module Randamu
  class Animal < Base
    class << self
      ANIMAL_TYPES = %w(mammal bird fish amphibian reptile insect)
      def mammal
        animal_type(:mammal).sample
      end

      def bird
        animal_type(:bird).sample
      end

      def fish
        animal_type(:fish).sample
      end

      def amphibian
        animal_type(:amphibian).sample
      end

      def reptile
        animal_type(:reptile).sample
      end

      def insect
        animal_type(:insect).sample
      end

      def random_animal
        animal_type(:random).sample
      end

      private
      def animal_type(type)
        type == :random ? all_animals : load_data("animals.#{type}s")
      end

      def all_animals
        ANIMAL_TYPES.map { |type| load_data("animals.#{type}s") }.flatten
      end
    end
  end
end


