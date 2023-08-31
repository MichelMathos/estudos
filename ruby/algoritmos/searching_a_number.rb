#Dado um array Arr de N elementos e um inteiro K. Sua tarefa é retornar a posição
#é retornar a posição da primeira ocorrência de k no array fornecido.

def primeira_ocorrencia(arr, k)
    for i in 0..arr.length
      if arr[i] == k
        return i  # Retorna a posição da primeira ocorrência
      end
    end
    return -1  # Retorna -1 se não encontrar a ocorrência de K no array
  end
  
  # Exemplo de uso
  arr = [5, 8, 12, 8, 10, 6]
  k = 10
  posicao = primeira_ocorrencia(arr, k)
  
  if posicao != -1
    puts "A primeira ocorrência de #{k} está na posição #{posicao}."
  else
    puts "#{k} não foi encontrado no array."
  end