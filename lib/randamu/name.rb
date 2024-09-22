module Randamu
  class Name < Base
    class << self
      def first_name
        male_first_names = load_data('name.male_first_name')
        female_first_names = load_data('name.female_first_name')
        (male_first_names + female_first_names).sample
      end

      def last_name
        load_data('name.last_name').sample
      end

      def full_name
        "#{first_name} #{last_name}"
      end

      def custom_name(length = 2)
        custom_name = first_name

        (length - 1).times do
          custom_name += " #{last_name}"
        end

        custom_name
      end

      def male_name
        load_data('name.male_first_name').sample
      end

      def female_name
        load_data('name.female_first_name').sample
      end
    end
  end
end
