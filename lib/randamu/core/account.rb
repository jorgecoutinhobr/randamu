module Randamu
  class Account < Base
    extend NameGenerator
    ALPHABET = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    NUMERIC = '0123456789'
    SPEACIAL = '!@#$%&*()_+'
    class << self
      def username(type: :funnies)
        load_data("usernames.#{type}").sample
      end

      # TODO - Implement password generation number of numeric, number of special characters, only numeric? only special characters?
      def password(length: 8, special: true, numeric: true)
        generate_password(length, special, numeric)
      end

      def email
        "#{normalize(first_name.downcase)}#{generate_connection_symbol}#{last_name.downcase}@#{load_data('emails.domains').sample}"
      end

      private
        def generate_password(length, special, numeric)
          password = ALPHABET
          password += SPEACIAL if special
          password += NUMERIC if numeric
          password.split('').shuffle[0..length].join
        end

        def generate_connection_symbol
          ['-', '_', '.'].sample
        end
    end
  end
end