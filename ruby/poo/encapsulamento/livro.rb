# A ideia do projeto é deixar o método 'dar_desconto' privado para que não seja chamado por qualquer método/classe externo a classe 'Livro'

class Livro
    attr_reader :nome, :ano, :preco # Declara os atributos de leitura (getter) nome, ano e preco. Isso permite que você acesse esses atributos
                                        #fora da classe usando métodos de acesso automáticos.

    def initialize(nome, ano, preco) # Define o construtor da classe Livro. O construtor é chamado quando você cria uma nova instância da classe Livro. 
                                        # Ele aceita três parâmetros: nome, ano, e preco.
        @nome = nome
        @ano = ano
        @preco = dar_desconto(preco) # Inicializa os atributos de instância @nome, @ano e @preco com os valores passados como argumentos para o construtor. 
                                        # Além disso, ele calcula o preço com desconto chamando o método dar_desconto e armazena o resultado em @preco.
    end

    def mostrar_dados # Define um método público chamado mostrar_dados. Este método imprime informações sobre o livro, incluindo o nome, ano de lançamento 
                        # e preço com desconto.
        puts "Livro: #{@nome}, Ano de Lançamento: #{@ano}, Preço: R$#{@preco}." # Este comando dentro do método mostrar_dados imprime os detalhes do livro no console, 
                                                                                 # usando os valores dos atributos @nome, @ano e @preco.
    end

    private # Marca a seção de métodos subsequentes como privados. Isso significa que os métodos definidos abaixo desta linha não podem ser chamados diretamente 
                # de fora da classe Livro.
    def dar_desconto(preco) # Define um método privado chamado dar_desconto, que aceita um parâmetro preco. Este método verifica o ano de lançamento do livro e 
                            # aplica um desconto de 10% ao preço se o ano for anterior a 2000. Caso contrário, retorna o preço original sem desconto.
        if @ano < 2000
           preco * 0.9            
        else
            preco            
        end
    end

end

li = Livro.new("O Senhor dos Anéis", 1999, 50.00)
#li.dar_desconto # Este método é público. Ocasionará em erro.
li.mostrar_dados # é um método privado e não pode ser chamado diretamente a partir de fora da classe Livro. Se você tentar descomentar esta linha, 
                 # isso resultará em um erro.