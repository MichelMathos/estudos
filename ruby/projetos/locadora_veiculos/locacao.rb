require_relative 'locador'
require_relative 'veiculo'
require_relative 'pagamento'

class Locacao
    attr_reader :locador, :veiculo, :data_retirada. :data_devolucao, :valor_locacao, :tipo_pagamento

    def initialize(locador, veiculo, data_retirada, data_devolucao, valor_locacao, tipo_pagamento)
        @locador = locador
        @veiculo = veiculo
        @data_retirada = data_retirada
        @data_devolucao = data_devolucao
        @tipo_pagamento = tipo_pagamento
    end

    def exibir_detalhes
        puts "Detalhes da Locação: "
        puts