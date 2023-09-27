#class Calculadora
#    def somar (x, y)
#        return x + y
#    end
#end
#
#cl = Calculadora.new
#resultado = cl.somar(5,5)
#puts resultado
#
# No exemplo acima, a calculadora faz a soma apenas de dois números
# Não é possível fazer a soma de quantos numeros quiser.
# Então se faz de acordo com o código abaixo:

#Nesse caso estamos falando da sobrecarga, que é a passagem de vários argumentos sobre um método já existente.
class Calculadora
    def somar(*args)
        lista = []
        lista.push(*args)
        lista.inject(:+)
    end
end

cl = Calculadora.new
resultado = cl.somar(5 , 5 , 11, 10, 5)
puts resultado

puts "-------------"

class Aluno
    def somar (*args)
        notas = []
        notas.push(*args)
        notas.inject(:+)
    end
end

a1 = Calculadora.new
notas_a1 = a1.somar(10 , 6.5 ,9, 7.5)
puts notas_a1
