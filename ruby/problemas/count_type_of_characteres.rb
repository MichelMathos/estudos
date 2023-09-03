def contar_caracteres(s) #Define uma função chamada 'contar_caracteres' que aceita uma string 's'
    #como argumento.
    #Inicializa 4 contadores para cada categoria
    maiusculas = 0
    minusculas = 0
    especiais = 0
    numeros = 0

    #Define uma expressão regular para os caracteres especiais
    caracteres_especiais = /[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]/

    #Percorre a string e conte os caracteres em cada categoria -loop
    s.each_char do |char|
        if char.match?(/[A-Z]/) #Verifica se o caractere é uma letra maiúscula uasndo uma expressão regular
            maiusculas += 1 #se encontrar uma letra maiuscula, incrementa o contador 'maiusculas'
        elsif char.match?(/[a-z]/) #Verifica se o caractere é uma letra minúscula usando uma expressão regular
            minusculas += 1 #se encontrar uma letra minuscula, incrementa o contadort 'minusculas'
        elsif char.match?(caracteres_especiais) #Verifica se o caractere é um carantere especial
            especiais += 1
        elsif char.match?(/[0-9]/) #Verifica se o caractere é um número
            numeros += 1
        end
    end

    #Imprima os resultados
    puts "Caracteres maiúsculos: #{maiusculas}"
    puts "Caracteres minúsculos: #{minusculas}"
    puts "Caracteres especiais: #{especiais}"
    puts "Caracteres numéricos: #{numeros}"
end

#Exemplo de uso
string = "Helo, word! 123"
contar_caracteres(string) #chamada da função