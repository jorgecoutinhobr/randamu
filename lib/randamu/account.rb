require_relative 'support/name'

module Randamu
  class Account < Base
    extend Name
    PASSWORD = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
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
      # TODO - SPECIAL CHARACTERS WILL BE ALLOWED IN EMAILS?
      def email
        "#{first_name.downcase}.#{last_name.downcase}@#{load_data('emails.domains').sample}"
      end

      private
        def generate_password(length, special, numeric)
          password = PASSWORD
          password += SPEACIAL if special
          password += NUMERIC if numeric
          password.split('').shuffle[0..length].join
        end
    end
  end
end