#### AULÃO SOBRE ARRAYS ####

#Estrutura básica -> nome_do_array = [elementos]
#quando se trata de elemento em forma de texto utiliza-se os elementos entre aspas simples.
#quando se tratra de números, não utiliza-se os elementos entre aspas.

estados = []
#para IMPRIMIR um array, basta digitar o comando para impressão e o nome_do_array
#no exemplo abaixo nada imprimirá em tela por não haver nenhum elemento dentro do array.
puts estados

estados = ['Bahia',"Pará"]
print estados #imprime de forma literal os valores atribuídos ao array estados
print "\n"
puts estados #imprime os elementos enfileirados, pois o puts já imprime o \n de forma oculta ao final de cada elemento.

#para INSERIR ELEMENTOS, utilizamos o comando .push()
#observe que o elemento 'Espirito Santo' será inserido ao final da fila
estados.push('Espirito Santo')
puts estados

#agora, observe que os elementos 'Minas Gerais', 'Rio de Janeiro', 'São Paulo' serão inseridos após o elemento 'Espírito Santo'
#isso ocorre por que o comando .push() sempre insere elemento no final da fila
estados.push('Minas Gerais', 'Rio de Janeiro', 'São Paulo')
puts estados

#também é possível DEFINIR A POSIÇÃO de onde se quer inserir o elemento, bastando informar o índice do array para o comando .insert()
#Os elementos 'Acre', 'Amapá' serão inserido a partir da primeira posição do array.
#Lembre-se que a primeira posição do array em ruby é o índice 0.
#nesse caso, os demais elementos serão "empurrados" para os próximos índices.
estados.insert(0, 'Acre', 'Amapá')
puts estados

#estaremos inserindo o elemento 'Ceará" no índice 2, que é a terceira posição do array a contar do 0.
#o elemento que estava no índice 2 será "empurrado" para o índice 3, quarta posição do array.
estados.insert(2, 'Ceará')
puts estados

#para acessarmos um ELEMENTO ESPECÍFICO, informamos o índice ocupado elo elemento.
#deverá imprimir 'Pará'
puts estados[4]

#para ALTERAR um elemento específico, informamos o índice do elemento e posteriormente o novo elemento.
#certamente estaremos substituindo o elemento 'Pará' pelo elemento 'Rio Grande do Norte'
estados[4] = "Rio Grande do Norte"
puts estados

#para imprimir INTERVALOS, informamos o índice inicial e o índice final.
puts estados [1..2]
puts estados [0..2]

