class Produto
    attr_accessor :nome, :preco #'att_accessor' é utilizado para criar getter e setters para os atributos ':nome' e ':preco' permitindo que eles sejam
    #lidos e modificados de fora da classe

    def initialize(nome, preco) #construtor (método 'initialize') que permite definir esses parâmetros quando uma instância da classe 'Produto' é criada.
        @nome = nome #@nome é uma variável de instância que atribui o valor do parâmetro 'nome'
        @preco = preco
    end
end

