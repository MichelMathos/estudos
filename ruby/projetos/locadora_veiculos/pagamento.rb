class Pagamento
    attr_reader :valor
  
    def initialize(valor)
      @valor = valor
    end
  end
  
  class PagamentoEmDinheiro < Pagamento
    def exibir
      puts "Pagamento em dinheiro - valor da diária: R$#{@valor}"
    end
  end
  
  class PagamentoComCartaoDeDebito < Pagamento
    def exibir
      puts "Pagamento com cartão de débito - Valor da diária: R$#{@valor}"
    end
  end
  
  class PagamentoComCartaoDeCredito < Pagamento
    attr_reader :parcelas
  
    def initialize(valor, parcelas)
      super(valor)
      @parcelas = parcelas
    end
  
    def calcula_juros
      if parcelas > 1
        juros = valor * 0.02 # Taxa de juros mensal de 2%
        return juros * parcelas
      end
      0
    end 
  
    def exibir
      puts "Pagamento com cartão de crédito - Valor da diária: R$#{@valor} (#{@parcelas}x)"
    end
  end