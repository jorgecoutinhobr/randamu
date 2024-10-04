module Randamu
  class Account < Base
    extend NameGenerator

    ALPHABET = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    NUMERIC = '0123456789'
    SPEACIAL = '!@#$%&*()_+'
    USERNAME_TYPES = %i[default funny]
    class << self
      def username(type: :default)
        return load_data("names.usernames.#{type}").sample if USERNAME_TYPES.include?(type)

        load_data('names.usernames.default').sample
      end

      def password(length: 8, special: true, numeric: true, alphabet: true)
        generate_password(length, special, numeric, alphabet)
      end

      def email
        "#{normalize(first_name.downcase)}#{generate_connection_symbol}#{normalize(last_name.downcase)}@#{load_data('emails.domains').sample}"
      end

      def phone(state: Dictionary::STATES.keys.sample, country_code: false)
        base_phone_number = "(#{load_data("phone.ddd.#{state.upcase}").sample}) " + phone_number
        country_code ? "+55 #{base_phone_number}" : base_phone_number
      end

      def phone_only_numbers(state: Dictionary::STATES.keys.sample, country_code: false)
        base_phone_number = load_data("phone.ddd.#{state.upcase}").sample.to_s + phone_number
        country_code ? "55#{base_phone_number}" : base_phone_number
      end

      private
        def generate_password(length, special, numeric, alphabet)
          password = ''
          password += ALPHABET if alphabet
          password += SPEACIAL if special
          password += NUMERIC if numeric
          password.split('').shuffle[1..length].join
        end

        def generate_connection_symbol
          ['-', '_', '.'].sample
        end

        def phone_number
          '9' + rand(10000000..99999999).to_s
        end
    end

    # private methods from NameGenerator
    private_class_method :first_name, :last_name, :full_name
  end
end
