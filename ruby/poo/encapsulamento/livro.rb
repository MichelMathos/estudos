class Livro
    attr_reader :nome, :ano, :preco

    def initialize(nome, ano, preco)
        @nome = nome
        @ano = ano
        @preco = preco
    end

    def mostrar_dados
        puts "Livro: #{@nome}, Ano de Lançamento: #{@ano}, Preço: R$#{@preco}."
    end

    def dar_desconto
        if @ano < 2000
           @preco = @preco * 0.9            
        else
            @preco            
        end
    end

end

li = Livro.new("O Senhor dos Anéis", 19899, 50.00)
li.dar_desconto
li.mostrar_dados