module Randamu
  class Account < Base
    extend NameGenerator
    ALPHABET = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    NUMERIC = '0123456789'
    SPEACIAL = '!@#$%&*()_+'

    class << self
      def username(type: :default)
        load_data("names.usernames.#{type}").sample
      end

      def password(length: 8, special: true, numeric: true, alphabet: true)
        generate_password(length, special, numeric, alphabet)
      end

      def email
        "#{normalize(first_name.downcase)}#{generate_connection_symbol}#{last_name.downcase}@#{load_data('emails.domains').sample}"
      end

      def phone(state: Dictionary::STATES.keys.sample, country_code: false)
        return "+55 (#{load_data("phone.ddd.#{state}").sample}) " + '9' + rand(10000000..99999999).to_s if country_code
        "(#{load_data("phone.ddd.#{state}").sample}) " + '9' + rand(10000000..99999999).to_s
      end

      def phone_only_numbers(state: Dictionary::STATES.keys.sample, country_code: false)
        return "55#{load_data("phone.ddd.#{state}").sample}" + '9' + rand(10000000..99999999).to_s if country_code
        "#{load_data("phone.ddd.#{state}").sample}" + '9' + rand(10000000..99999999).to_s
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
    end
  end
end
