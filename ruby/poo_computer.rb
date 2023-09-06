#Classes
class Computer #classe começa com letra maiúscula
    def turn_on
        'turn on the computer'
    end

    def shutdown
        'shutdown the computer'
    end
end

#A classe por sí só não faz nada. É preciso criar um objeto que faça uso desa classe.

computer = Computer.new #É criado um novo objeto chamado 'computer' que poderá fazer uso dos métodos da classe Computer.
puts computer.turn_on #utilizando o método 'turn_on' da classe Computer
