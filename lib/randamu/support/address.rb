require_relative 'dictionary'

module Randamu
  module Address

    # TODO IMPLEMENTAR POR ESTADO  / SEPARAR ESTADOS POR REGIÃO

    # TODO COMO IMPLEMENTAR UM METODO UNICO DE LOADING DE DADOS

    def state
      data = load_data('map.state')
      data.map { |k, _| Dictionary::STATE[k] }.sample
    end

    def city(state: nil)
      load_teste(:state, state: state).sample
    end

    private

    def load_teste(key, state: nil)
      return load_data("map.#{key}.#{state}") if state
      load_data("map.#{key}.#{Dictionary::STATE.keys.sample}")
    end
  end
end
