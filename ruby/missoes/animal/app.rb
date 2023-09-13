#o reqiure abaixo só faz a chamada local, ou seja, chama o arquivo que estiver na mesma pasta.
#require './animal.rb'

require_relative 'animal' #neste caso, o require_relative busca o arquivo no local que ele estiver
require_relative 'cachorro'

#Não pode inverter a ordem das classes 'animal' e 'cachorro', pois ao colocar cachorro primeiro dará erro
#pois não tem como ele importar os métodos da classe 'animal' sem que essa seja anteriormente carrega
#requerida. 'cachorro' é uma classe que está importando os métodos da classe 'animal' de forma indireta.

puts '--Animal--'
animal = Animal.new
animal.pular

puts""

puts '--Cachorro--'
cachorro = Cachorro.new
cachorro.pular
cachorro.latir

