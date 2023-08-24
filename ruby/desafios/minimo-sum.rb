def min_sum_after_operations(array)
    #total_sum = 0

    array.sort! #Ordenar o array inicial em ordem crescente
    

    while array.length > 1
        #sum = array[0] + array[1]
        #selecionar os dois primeiros elementos e somar o menor deles ao total
        #total_sum += sum

        #substituir os dois primeiros elementos pelo menor valor
        #array[0] = sum
        #array.shift #remover o segundo elemento
        
        #encontra o indice do menor elemento entre o primeiro e o segundo
        min_index = array[0] < array[1] ? 0 : 1
        sum = array[min_index] + array[min_index ^1] # ^é o operador XOR
        total_sum += sum

        #Remove os dois elementos utilizados na soma e insere o resultado
        array[min_index]
        array.delete_at(min_index ^1)    
    end

    #total_sum += array[0] if array.length == 1 #se houver um elemento restantante, adicionálo

    total_sum
end

#exemplo de entrada: [4, 3, 5, 10, 11]
array_A = [3, 6, 2, 8, 7, 5]
result = min_sum_after_operations(array_A)
puts "A soma total mínima do array B é: #{result}"
