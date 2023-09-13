# A herança é a caracteristica que faz com que uma classe herde os mesmos atributos de outras classe
# Essa relação se dá de uma classe pai (super classe) para uma classe filha
class Animal
    attr_reader :nome # attr_reader ermite apenas a escrita no atributo :nome
    def initialize(nome) # initialize obriga que ao ser instânciada o parâmetro nome seja acessado e escrito
        @nome = nome
    end

    def comunicar # Aqui tem o conceito de polimorfismo
        puts "Olá, eu sou a classe mẽ ou a super classe, como você preferir."
    end
end

#Nosso objetivo é criar uma classe filha que herde atributos da classe pai (superclasse)

class Cachorro < Animal # o sinal < significa que Cachorro é uma classe filha da classe Animal
    attr_reader :raca

    def initialize(nome, raca) # aqui estamos criando o conceito de extends, ou seja, acrescentando o atributo raca, que não estava pŕesente na class Animal
        super(nome) #super indica que nome é um atributo da super classe
        @raca = raca
    end

    def comunicar # Aqui tem o conceito de polimorfismo
        puts "Au, au, au! = Eu sou a classe filha de Animal"
    end
end
# O conceito de polimorfismo está em sobre escrever uma função definida pela superclasse
bob = Cachorro.new("Bob", "Poodle")
puts bob.nome
puts bob.raca
bob.comunicar # por polimorfismo, tom sobreescreve o metodo comunicar
