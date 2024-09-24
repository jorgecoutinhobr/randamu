module Randamu
  module DocumentGenerator
    def cpf(valid: true)
      return generate_valid_cpf if valid

      Array.new(11) { rand(0..9) }.join
    end

    def rg; end

    def cnh; end

    def cnpj; end

    def mei; end

    private
      def generate_valid_cpf
        cpf = Array.new(9) { rand(0..9) }
        cpf << calculate_check_digit(cpf)
        cpf << calculate_check_digit(cpf)
        cpf.join
      end

      def calculate_check_digit(cpf)
        sum = 0
        cpf.each_with_index do |digit, index|
          sum += digit * (cpf.size + 1 - index)
        end
        remainder = sum % 11
        remainder < 2 ? 0 : 11 - remainder
      end
  end
end