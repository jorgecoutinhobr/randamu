# frozen_string_literal: true

module Randamu
  class Academic < Base
    class << self
      def education_level
        load_data('academic.education_levels').sample
      end

      def course
        load_data('academic.courses').sample
      end

      def school
        load_data('academic.schools').sample
      end

      def university
        load_data('academic.universities').sample
      end

      def degree
        load_data('academic.degrees').sample
      end

      alias college university
    end
  end
end
