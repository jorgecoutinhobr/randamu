module BusinessDocumentsGenerator
  def cnpj(valid: true)
    return generate_valid_cnpj if valid

    generate_invalid_cnpj
  end

  def mei; end

  private
    def generate_valid_cnpj
      cnpj = Array.new(12) { rand(0..9) }
      cnpj << calculate_check_digit_cnpj(cnpj)
      cnpj << calculate_check_digit_cnpj(cnpj)
      cnpj.join
    end

    def generate_invalid_cnpj
      cnpj = generate_valid_cnpj
      last_digit = cnpj[-1]

      while last_digit == cnpj[-1]
        new_digit = rand(0..9).to_s
        cnpj[-1] = new_digit
      end

      cnpj
    end

    def calculate_check_digit_cnpj(cnpj)
      weights = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]

      sum = cnpj.each_with_index.reduce(0) do |acc, (digit, index)|
        acc + digit * weights[index + (weights.size - cnpj.size)]
      end

      remainder = sum % 11
      remainder < 2 ? 0 : 11 - remainder
    end
end