module DocumentGenerator
  def cpf(valid: true)
    return generate_valid_cpf if valid

    genereate_invalid_cpf
  end

  def rg
    Array.new(9) { rand(0..9) }.join
  end

  def voter_registration
    Array.new(12) { rand(0..9) }.join
  end

  def cnh
    Array.new(9) { rand(0..9) }.join
  end

  #orgao emissor
  def issuing_authority(full_name: false)
    keys = load_data("doc.issuing_authority").keys
    key = keys.sample

    return "#{key} - #{load_data("doc.issuing_authority.#{key}")}" if full_name
    key
  end

  def cnpj(valid: true)
    return generate_valid_cnpj if valid

    generate_invalid_cnpj
  end

  private
    def generate_valid_cpf
      cpf = Array.new(9) { rand(0..9) }
      cpf << calculate_check_digit_cpf(cpf)
      cpf << calculate_check_digit_cpf(cpf)
      cpf.join
    end

    def genereate_invalid_cpf
      cpf = generate_valid_cpf
      last_digit = cpf[-1]

      while last_digit == cpf[-1]
        new_digit = rand(0..9).to_s
        cpf[-1] = new_digit
      end

      cpf
    end

    def calculate_check_digit_cpf(cpf)
      sum = 0
      cpf.each_with_index do |digit, index|
        sum += digit * (cpf.size + 1 - index)
      end

      remainder = sum % 11
      remainder < 2 ? 0 : 11 - remainder
    end

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
