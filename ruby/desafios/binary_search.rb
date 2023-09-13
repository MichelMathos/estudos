#Dado um array classificado de tamanho N e um inteiro K , encontre a posição (indexação
#baseada em 0) na qual K está presente no array usando pesquisa binária.

def binarysearch(arr, n, k) #Definimos uma função chamada 'binarysearch' que aceita três
                            #parâmetros: o array classificado 'arr', o tamanho 'n' do array e o inteiro 'k' que
                            #estamos procurando.
    left = 0 #Inicializamos a variável 'left' com 0, que será a posição mais à esquerda
            #noi array.
    right = n-1 #Iniciamos a variável 'right com 'n-1' que será a posição mais à direita
                 #do array.

    while left <= right #Iniciamos um loop 'wile' que continuará até 'left' seja menor ou
                        #igual a 'right'. Isso garante que o intervalo de busca seja válido.
        mid = left + (right - left) / 2 #Calculamos o índice do elemento do meio do intervalo
                                         #de busca usando a média enbtre 'left' e 'right'.

        if arr[mid] == k #Verificamos se o elemento índice 'mid' do array é igual a 'k'.
            return mid #se a condição for verdadeira, retornamos o valor de 'mid',  que é 
                        #a posição do elemento 'k' no array.
        elsif arr[mid] < k #Se o elemento bno índice 'mid' for menor que 'k', isso significa
                           #que 'k' pode estar na metade direita do intervalo.
            left = mid + 1 #Atualizamos o valor de 'left' para 'mid + 1', restringindo a busca
                            #à metade do intervalo de busca.
        else #se o elemento no índice 'mid' não for igual a 'k' nem menor que 'k', isso significa
            #que 'k'k deve etar na metade esquerda do ntervalo de busca.
            right = mid - 1 #Atualizamos o valor de 'right' para 'mid - 1', restringindo a busca
                           #à metade esquerda do intervalo. 
        end
    end

    return -1 #Se o loop 'while' terminar sem encontrar 'k', retornamos '-1' para indicar que 'k'
              #não foi encontrado no array.
end

#Exemplo de uso:

arr = [2, 4, 5, 8, 10, 12, 14, 16]
n = arr.length #Definimos o tamanho 'n' do array.
k = 6 #Definimos o valor de 'k' que estamos procurando.

posicao = binarysearch(arr, n, k) #Chamamos a função 'binarysearch()' com os parãmetros adequados e
                                #atribuímos o resultado à variável 'posicao'.

if posicao != -1 #Verificamos se a posição de 'k' é diferente de '-1', ou seja, se encontramos 'k' no
                  #array.
    puts "A posição do #{k} do array é #{posicao}." #Se encontramos 'k', imprimimos a posição.
else
    puts "#{k} não foi encontrado no array." #caso contrário, imprimimos uma mensagem indicando que 'k' não foi encontrado.
end


