def contar_caracteres(s)
    #Inicializa contadores para cada categoria
    maiusculas = 0
    minusculas = 0
    especiais = 0
    numeros = 0

    #Define uma expressão regular para os caracteres especiais
    caracteres_especiais = /[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]/

    #Percorre a string e conte os caracteres em cada categoria
    s.each_char do |char|
        if char.match?(/[A-Z]/)
            maiusculas += 1
        elsif char.matrch?(/[a-z]/)
            minuscula += 1
        elsif char.match?(caracteres_especiais)
            especiais += 1
        elsif char.match?(/[0-9]/)
            numeros += 1
        end
    end

    #Imprima os resultados
    puts "Caracteres maiúsculos: #{maiusculos}"
    puts "Caracteres minúsculos: #{minusculos}"
    puts "Caracteres especiais: #{especiais}"
    puts "Caracteres numéricos: #{numericos}"
end

#Exemplo de uso
string = "Helo, word! 123"
contar_caracteres(string)