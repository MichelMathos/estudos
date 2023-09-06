
#Herança
class Animal
    def pular
        puts 'Toing! tóim! bóim! póim!'
    end

    def dormir
        puts "ZzZzZzZzzz!"
    end
end

class Cachorro < Animal #O símbolo '<' significa herança! Isso quer dizer que a classe Cachorro está recebendo
    #tudo o que a classe 'Animal' é capaz de fazer, possibilitando-a de utilizar os métodos 'pular' e 'dormir'.
   #Nesse caso, a classe 'Animal' é a classe pai.
    def latir
        puts 'Au au' #'Latir' É uma propriedade pertencente à classe Cachorro.
    end
end

class Gato < Animal #Aqui, a classe 'Gato' além de ter o atributo 'miar' também possuirá os atributos da classe 'Animal'
    #via herança, sinalizada pelo símbolo de '<'.
    def miar
        puts 'meow'
    end
end

cachorro = Cachorro.new #
cachorro.pular 
cachorro.dormir
cachorro.latir

gato = Gato.new
gato.miar
gato.dormir
