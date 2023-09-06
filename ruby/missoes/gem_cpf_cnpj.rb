require 'cpf_cnpj' #Após a instalação da gem cpf_cnpj, fazemos a importação para o programa

def cpf_valido?(cpf) #Definimos uma função chamada 'cpf_valido?' que aceita um argumento 'cpf

    cpf = CPF.new(cpf) #Dentro da função, criamos um objeto 'CPF usando a classe fornecida pela gem 'cpf_cnpj'. 
    #Isso nos permite manipular o número de CPF e verificar sua validade.

    return cpf.valid? #Utilizamos o método 'valid' do objeto 'cpf' para verificar se o número de CPF é válido.
    #Essa função retorna 'true' se o CPF for válido e 'false' se não for.
end

puts "Digite um número de CPF (apenas números):"
cpf_digitado = gets.chomp #não utilizamos o método '.to_i', pois esse desconsidera os números iniciados com 0

if cpf_valido?(cpf_digitado) #chamamos a função 'cpf_valido? passando o número digitado pelo usuário como argumento.
    puts "O CPF #{cpf_digitado} é válido."
else
    puts "O CPF #{cpf_digitado} não é válido."
end

