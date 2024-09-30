module Randamu
  class  Person < Base
    extend NameGenerator
    class << self
      def profession
        load_data('academic.professions').sample
      end
      def blood_type
        %w(A+ A- B+ B- AB+ AB- O+ O-).sample
      end
      def gender
        %w(male female other).sample
      end
    end
  end
end

