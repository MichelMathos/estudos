#Vamos criar uma classe chamada Alunos. O nome de uma classe deve ser sempre com inicial maiuscula.
#Todo classe inicia com class, o nome_da_class, seus atributos (bloco de códigos) e encerra com end.
#
#class Aluno
#   @nome
#    @idade
#end
#
#a1 = Aluno.new
#a1.nome = Michel
#a1.idade = 42
#puts a1.nome
#
# O código acima apresentará erro, poi não é possível acesar o atributo de uma classe de forma direta
# No ruby, os atributos são por padrão privados, ou seja, fora da classe não é possível acessá-los diretamente
# Para corrigir isso, é preciso criar uma função dentro da classe que permita fazer alterações em seus atributos
# Criaremos asfunções mudar_nome e mostra_nome
#class Aluno
#    @nome
#    @idade
#
#    def mudar_nme(nome) #seria o mesmo que o método set_nome
#       @nome = nome
#    end
#
#    def mostra_nome #seria o mesmo que get_nome
#        self.nome
#    end
#end
#
#a1 = Aluno.new
#a1.mudar_nome("Michel")
#a1.idade = 42
#puts a1.mostra_nome
#
# Podemos substituir o get e sets por acessores de atributos, que são três:
# attr_accessor :attributt_name - faz a leitura e a escrita nos atributos fora da classe
# attr_reader :attribute_name - faz apenas a escrita nos atributos fora da classe
# attr_writer :attribute_name - faz apenas a leitura dos valores dos atributos da classe
#
class Aluno
    attr_accessor :nome, :idade
    
    def initialize(nome, idade) #initialize é um método construtor que obriga a colocar informações quando se instancia o objeto 
        @nome = nome #@nome é o atrbuto :nome
        @idade = idade #@idade é o atributo :idade
    end

    def mostrar_dados
        puts "Nome: #{self.nome} \nIdade: #{@idade}" #tanto faz utilizar self. ou @
    end
end

a1 = Aluno.new("Michel", 42)
a1.mostrar_dados