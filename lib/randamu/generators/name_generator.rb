module NameGenerator
  GENDER = %w(male female).freeze

  def first_name(gender: nil)
    return load_db(gender).sample if !gender.nil? && GENDER.include?(gender.to_s)

    gender = GENDER.sample
    load_db(gender).sample
  end

  def last_name
    load_db(:last).sample
  end

  def full_name(gender: nil)
    "#{first_name(gender: gender)} #{last_name}"
  end

  def custom_name(length: 3, gender: nil)
    generate_custom_name(first_name(gender: gender), length)
  end

  private
    def load_db(type)
      return load_data("names.#{type}_name") unless type.nil?
      type = GENDER.sample
      load_data("names.#{type}_name")
    end

    def generate_custom_name(initial_name, length)
      return initial_name if length <= 1

      (length - 1).times do
        initial_name += " #{last_name}"
      end

      initial_name
    end

    # Improved method to normalize names
    def normalize(n)
      n.gsub(/[^a-zA-Z]/, 'a')
    end
end
