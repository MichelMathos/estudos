class Mercado
    def initialize(produto) #O construtor 'initialize' recebe um objeto 'produto' como parâmetro e o armazena em uma instência da classe 'Mercado' para que possa
        #ser utilizado posteriormente.
        @produto = produto #@produto é uma variável de instância que atribui o valor do parâmetro 'produto'
    end

    def comprar
        puts "Você comprou o produto #{@produto.nome} no valor de #{@produto.preco}."
    end
end