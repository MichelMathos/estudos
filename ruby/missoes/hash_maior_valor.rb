#Selecionar o maior valor deste hash e no final imprimir a key e o valor
#A hash number foi inicializada já com os valores
number = {A: 10, B: 302, C:20 , D: 400, E: 15}

#Inicializando as variáveis para armazenar o maior valor e sua chave
#nil é um valor nulo, ou seja, as variáveis inicializarão com valor nulo
maior_valor = nil
chave_maior_valor = nil

#Interando pelo hash para encontrar o maior valor e sua chave
#O método .each irá iterar sobre cada par chave-valor no hash 'number'
#Para cada iteração, as variáveis 'chave' e 'valor' recebem a chave e o
#valor, respectivamente.

number.each do |chave, valor|
  #Dentro do bloco de loop, há uma estrutura condicional.
  #A linha de comando '  if maior_valor.nil? || valor > maior_valor' verifica
  #se a variável 'maior_valor  é nula (ou seja, ainda não encontramos um maior valor)
  #ou se o valor atual ('valor') é maior que o valor armazenado em '1maior_valor'.
  #Se a condição for verdadeira, o bloco do 'if' é executado, atuaçizando as variáveis
  #maior_valor' e 'chave_maior_valor' com os valores da iteração atual,
  #pois encontramos um novo valor maior valor.
  if maior_valor.nil? || valor > maior_valor
    maior_valor = valor
    chave_maior_valor = chave
  end
end

#Imprimindo a chave e o valor do maior número
puts "Chave do maior valor: #{chave_maior_valor}"
puts "Maior valor: #{maior_valor}"
