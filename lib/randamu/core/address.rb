module Randamu
  class Address < Base

    # TODO IMPLEMENTAR POR ESTADO  / SEPARAR ESTADOS POR REGIÃO

    # TODO COMO IMPLEMENTAR UM METODO UNICO DE LOADING DE DADOS
    class << self
      def full_address
        "#{street}, #{number}, #{city}, #{state} - #{zip_code}"
      end

      def street
        load_data('map.streets').sample
      end

      def additional_address_data
        load_data('map.additional_address_data').sample
      end

      def zip_code
        load_data('map.zip_codes').sample
      end

      def state
        data = load_data('map.states')
        data.map { |k, _| Dictionary::STATE[k] }.sample
      end

      def city(state: nil)
        load_teste(:states, state: state).sample
      end

      private
        def load_teste(key, state: nil)
          return load_data("map.#{key}.#{state}") if state
          load_data("map.#{key}.#{Dictionary::STATE.keys.sample}")
        end

        def number
          rand(1..9999)
        end
    end
  end
end
