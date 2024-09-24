require_relative 'support/name'
require_relative 'support/date'
require_relative 'support/address'
require_relative 'support/document_generator'

module Randamu
  class  Person < Base
    extend Name
    extend Date
    extend DocumentGenerator
    # TODO add more methods to generate random data
    # - Add nickname - how?
    # - Add email - email in person?
    # - Add phone - phone in person?
    # Refactor the document -> inherit only cpf and id, how?
    class << self
      def age(min: 1, max: 65)
        rand(min..max)
      end

    end
  end
end
