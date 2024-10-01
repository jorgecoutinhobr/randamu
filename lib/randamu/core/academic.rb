module Randamu
  class Academic
    class << self
      def education_level
        ['Educação infantil', 'Fundamental', 'Médio',
         'Superior', 'Pós-graduação', 'Mestrado', 'Doutorado'].sample
      end

      def course
        load_data('academic.courses').sample
      end

      def school_name
        load_data('academic.schools').sample
      end

      def university_name
        load_data('academic.universities').sample
      end

    end
  end
end
