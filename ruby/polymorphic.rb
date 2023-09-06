#Polimorfismo - poder utilizar o mesmo método da classe pai, porém de forma diferente.
class Instrumento
    def escrever
        puts 'Digitando'
    end
end

class Teclado < Instrumento
end

class Lapis < Instrumento
    def escrever
         puts 'Escrevendo à lápis'
         super #Irá forçar a chamar o método 'escrever' da classe 'Instrumento' sem ser sobrescrevida.
    end
end

class Caneta < Instrumento
    def escrever
        puts 'Escrevendo à caneta'
    end
end

teclado = Teclado.new
lapis = Lapis.new
caneta = Caneta.new

puts "lápis:"
lapis.escrever #Irá sobrescrever o metodo 'escrever' da classe 'Instrumento' que é a classe pai
puts "caneta:"
caneta.escrever #Irá sobrescrever o método 'escrever' da clase 'Instyrumento' que a classe pai
puts "teclado:"
teclado.escrever #Por não haver um método epecificado, irá imprimir exatamente o valor do método 
#da classe 'Instrumento', que é a classe pai.

