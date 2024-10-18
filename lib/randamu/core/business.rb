module Randamu
  class Business < Base
    class << self
      def company_name
        "#{load_data('people.last_name').sample} #{load_data('business.company_name.activity_area').sample} #{load_data('business.company_name.suffix').sample}"
      end

      def subscription
        %w(Mensal Semestral Anual).sample
      end
    end
  end
end
