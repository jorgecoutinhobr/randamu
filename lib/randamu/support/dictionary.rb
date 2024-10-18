# frozen_string_literal: true

module Dictionary
  STATES = {
    AC: 'ACRE',
    AL: 'ALAGOAS',
    AP: 'AMAPÁ',
    AM: 'AMAZONAS',
    BA: 'BAHIA',
    CE: 'CEARÁ',
    DF: 'DISTRITO FEDERAL',
    ES: 'ESPÍRITO SANTO',
    GO: 'GOIÁS',
    MA: 'MARANHÃO',
    MT: 'MATO GROSSO',
    MS: 'MATO GROSSO DO SUL',
    MG: 'MINAS GERAIS',
    PA: 'PARÁ',
    PB: 'PARAÍBA',
    PR: 'PARANÁ',
    PE: 'PERNAMBUCO',
    PI: 'PIAUÍ',
    RJ: 'RIO DE JANEIRO',
    RN: 'RIO GRANDE DO NORTE',
    RS: 'RIO GRANDE DO SUL',
    RO: 'RONDÔNIA',
    RR: 'RORAIMA',
    SC: 'SANTA CATARINA',
    SP: 'SÃO PAULO',
    SE: 'SERGIPE',
    TO: 'TOCANTINS'
  }.freeze

  REGIONS = {
    sudeste: %w[SP RJ MG ES],
    sul: %w[RS SC PR],
    centro_oeste: %w[GO MT MS DF],
    norte: %w[AM RR AP PA TO RO AC],
    nordeste: %w[MA PI CE RN PB PE AL SE BA]
  }.freeze
end
