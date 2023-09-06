require 'cpf_cnpj' #Após a instalação da gem cpf_cnpj, fazemos a importação para o programa

def cpf_valido?(cpf) #Definimos uma função chamada 'cpf_valido?' que aceita um argumento 'cpf

    cpf = CPF.new(cpf) #Dentro da função, criamos um objeto 'CPF usando a classe fornecida pela gem 'cpf_cnpj'. 
    #Isso nos permite manipular o número 

    return cpf.valid?
end

puts "Digite um número de CPF (apenas números):"
cpf_digitado = gets.chomp

if cpf_valido?(cpf_digitado)
    puts "O CPF #{cpf_digitado} é válido."
else
    puts "O CPF #{cpf_digitado} não é válido."
end

