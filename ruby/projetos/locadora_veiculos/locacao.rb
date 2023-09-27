class Locacao
  attr_reader :locador, :veiculo, :data_retirada, :data_devolucao, :valor_locacao, :tipo_pagamento

  def initialize(locador, veiculo, data_retirada, data_devolucao, valor_locacao, tipo_pagamento)
    @locador = locador
    @veiculo = veiculo
    @data_retirada = data_retirada
    @data_devolucao = data_devolucao
    @valor_locacao = valor_locacao
    @tipo_pagamento = tipo_pagamento
  end

  def calcular_valor_total
    # Calculando o número de dias de locação
    dias_de_locacao = (Date.parse(data_devolucao) - Date.parse(data_retirada)).to_i

    # Obtendo os valores específicos do veículo e do pagamento
    valor_diaria = veiculo.valor_diaria
    valor_pagamento = tipo_pagamento.valor

    # Calculando o valor total com base no tipo de pagamento
    if valor_pagamento == "debito"
      valor_total = valor_diaria * dias_de_locacao
    elsif valor_pagamento == "credito"
      valor_total = (valor_diaria * dias_de_locacao) * veiculo.taxa_juros
    elsif valor_pagamento == "dinheiro"
      valor_total = valor_diaria * dias_de_locacao
    else
      raise "Tipo de pagamento inválido"
    end

    valor_total
  end

  def exibir_detalhes
    valor_total = calcular_valor_total
    dias_de_locacao = (Date.parse(data_devolucao) - Date.parse(data_retirada)).to_i

    puts "Detalhes da Locação: "
    puts "Locador: #{locador.exibir}"
    puts "Veículo: #{veiculo.exibir}"
    puts "Pagamento: #{tipo_pagamento.exibir}"
    puts "Data de retirada: #{data_retirada}"
    puts "Data de devolução: #{data_devolucao}"
    puts "Número de dias de locação: #{dias_de_locacao}"
    puts "Valor total: #{valor_total}"
  end
end
