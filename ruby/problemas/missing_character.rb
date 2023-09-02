#Verificando se é um panagrama ou não, considerando o alfabeto inglês.

def panagram?(str) #Define uma função chamada 'panagram?' que recebe uma string 'str' como argumento.

    alphabet = ('a'..'z').to_a #Criamos um array chamado 'alphabet' que contém todas as letras do alfabeto
    #inglês, de 'a' a 'z'.

    cleaned_str = str.downcase.gsub(/[^a-z]/,'') #Usamos o método 'downcase' para converter toda a string 'str'
    # para minúscula, tornando-a case-sensitive. Em seguida, usamos 'gsub' com a expressão regular '/[^a-z]/'
    #para remover todos os caracteres que não são letras do alfabeto inglês. I(sso resulta em 'cleaned_str',
    #que é a string original, mas sem caracteres não-alfabéticos e em minúscuas.

    unique_chars = cleaned_str.chars.uniq #Transformamos a string 'cleaned_str' em um array de caracteres únicos
    #'chars' para dividir a string em caracteres individuais e 'uniq' para remover caracteres duplicados.

    return unique_chars.sort == alphabet #Agora, comparamos se o array de caracteres únicos 'unique_chars' é igual
    #ao array 'alphabet' que contém todas as letras do alfabeto. Se todos os caracteres do alfabeto estiverem
    #presentes no array de caracteres únicos, isso significa que a string é um pangrama.
end

#Exemplo de uso

input_str = "The boy brown fox jumps over the lazy dog."

if panagram?(input_str)
    puts "A string é um pangrama."
else
    puts "A string não é um pangrama."
end