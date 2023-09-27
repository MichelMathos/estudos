class Veiculo
    attr_reader :categoria, :marca, :cor, :ano
  
    def initialize(categoria, marca, cor, ano)
      @categoria = categoria
      @marca = marca
      @cor = cor
      @ano = ano
    end
  
    def valor_diaria
      case categoria.downcase
      when "c"
        200.0 # Valor da diária para carros
      when "M"
        50.0 # Valor da diária para motos
      else
        0.0 # Categoria inválida
      end
    end
  
    def taxa_juros
      0.02 # Taxa de juros para pagamento com cartão de crédito (2%)
    end
  
    def exibir
      puts "Categoria: #{@categoria}"
      puts "Marca: #{@marca}"
      puts "Cor: #{@cor}"
      puts "Ano: #{@ano}"
    end
  end
  
  class Carro < Veiculo
    attr_reader :portas
  
    def initialize(categoria, marca, cor, ano, portas)
      super(categoria, marca, cor, ano)
      @portas = portas
    end
  
    def exibir
      super
      puts "Quantidade de portas: #{@portas}"
    end
  end
  
  class Moto < Veiculo
  end
  