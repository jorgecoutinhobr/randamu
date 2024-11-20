# frozen_string_literal: true

module Randamu
  class Person < Base
    extend NameGenerator

    class << self
      def profession
        load_data('academic.professions').sample
      end

      def blood_type
        load_data('people.blood_types').sample
      end

      def gender
        load_data('people.genders').sample
      end

      def marital_status
        load_data('people.marital_status').sample
      end

      def religion(adjective: true)
        return load_data('people.religions_adjectives').sample if adjective

        load_data('people.religions').sample
      end
    end
  end
end
