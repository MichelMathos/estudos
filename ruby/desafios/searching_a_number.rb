#Dado um array Arr de N elementos e um inteiro K. Sua tarefa é retornar a posição
#é retornar a posição da primeira ocorrência de k no array fornecido.

def primeira_ocorrencia(arr, k) #def primeira_ocorrencia(arr,k) - define uma função chamada 'primeira_ocorrencia'
                                #que aceitra dois argumentos: 'arr' (o array em si) e 'k' (o valor que estamos procurando)
    for i in 0..arr.length #aqui inicia um loop 'for', onde 'i' é uma variável que assume os valores de 0 até
                           #o tamanho do array menos 1. Isso significa que 'i' representa as posições no array
      if arr[i] == k #Isso verifica se o elemento no índice 'i' do array 'arr' é igual ao valor 'k' que estamos 
                      #procurando.
        return i  #Se a condição do 'if' for verdadeira (ou seja, encontrarmos a primeira ocorrência de 'k'), a
                   #função retorna o valor de 'i', que é a posição da primeira ocorrência no array.
      end
    end
    return -1  #Se o loop 'for' for concluído e nenhum valor 'k' for encontrado no array, a função retorna -1 para
               #indicar que a ocorrência não foi encontrada.
  end
  
  # Exemplo de uso
  arr = [5, 8, 12, 8, 10, 6]
  k = 10

  posicao = primeira_ocorrencia(arr, k) #Isso chama a função 'primeira_ocorrencia' com o array 'arr' e o valor 'k',
                                         #e atribui resultado a variável 'posição'.
  
  if posicao != -1 #este bloco verifica se a posição retornada pela função não é igual a -1, ou seja, se encontramos
                   #a ocorrência de 'k'.
    puts "A primeira ocorrência de #{k} está na posição #{posicao}." #Se a posição não for -1, isso imprime a mensagem
                                                                     #a mensagem com a posição da primeira ocorrência.
  else
    puts "#{k} não foi encontrado no array." #Caso contrário, isso impriome a mensagem indicando o valor 'k' não foi
                                             #encontrado no array.
  end