#Verificando se é um panagrama ou não, considerando o alfabeto inglês.

def panagram?(str) #Define uma função chamada 'panagram?' que recebe uma string 'str' como argumento.

    alphabet = ('a'..'z').to_a #Criamos um array chamado 'alphabet' que contém todas as letras do alfabeto
    #inglês

    cleaned_str = str.downcase.gsub(/[^a-z]/,'')

    unique_chars = cleaned_str.chars.uniq

    return unique_chars.sort == alphabet

end

#Exemplo de uso

input_str = "The boy brown fox jumps over the lazy dog."

if panagram?(input_str)
    puts "A string é um pangrama."
else
    puts "A string não é umpangrama."
end