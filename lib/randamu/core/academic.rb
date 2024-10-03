module Randamu
  class Academic < Base
    class << self
      def education_level
        ['Educação infantil', 'Fundamental', 'Médio',
         'Superior', 'Pós-graduação', 'Mestrado', 'Doutorado'].sample
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

      alias :college :university
    end
  end
end
