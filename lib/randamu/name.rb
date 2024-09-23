module Randamu
  class Name < Base
    class << self
      def first_name
        male_first_names = load_data('names.male_first_name')
        female_first_names = load_data('names.female_first_name')
        (male_first_names + female_first_names).sample
      end

      def last_name
        load_data('names.last_name').sample
      end

      def full_name
        "#{first_name} #{last_name}"
      end

      def custom_name(length: 0, gender: nil)
        case gender
        when 'male'
          custom_male_name(length)
        when 'female'
          custom_female_name(length)
        else
          custom_unisex_name(length)
        end
      end

      def male_name
        load_data('names.male_first_name').sample
      end

      def female_name
        load_data('names.female_first_name').sample
      end

      private
        def custom_male_name(length)
          generate_custom_name(male_name, length)
        end

        def custom_female_name(length)
          generate_custom_name(female_name, length)
        end

        def custom_unisex_name(length)
          generate_custom_name(first_name, length)
        end

        def generate_custom_name(initial_name, length)
          return initial_name if length < 1

          (length - 1).times do
            initial_name += " #{last_name}"
          end

          initial_name
        end
    end
  end
end
