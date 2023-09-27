class Esportistas
    def competir
        puts " - Participando de uma competição."
    end
end

class JogadorDeFutebol < Esportistas
    def correr
        puts " - Correndo atrás da bola!"
    end
end

class Maratonista < Esportistas
    def correr
        puts " - Percorrendo o percurso."
    end
end

jogador_fut = JogadorDeFutebol.new
puts "O que o jogador de futebol está fazendo?"
jogador_fut.competir
jogador_fut.correr
puts ""

maratonista = Maratonista.new
puts "O que o maratonista está fazendo?"
maratonista.competir
maratonista.correr
