def min_sum_after_operations(array) #definindo o inicio da função 'min_sum_after_operations, que recebe o parametro 'array'
    min_val = array.min #min_val é a variável que receberá o valor mínimo encontrado no array A[]
    total_sum = min_val *(array.length - 1) #total_sum recebe o cáculo do menor valor do array A[], multiplicado pela quantidade de elementos existentes após excluir um.
    total_sum #tem a finalidade de retorno da função
end

#exemplo 1: [3,4]
array_1 = [3,4]
result_1 = min_sum_after_operations(array_1)
puts "A soma total mínima do array B[] é: #{result_1}"

#exemplo 2: [2, 4, 1, 3]
array_2 = [2, 4, 1, 3]
result_2 = min_sum_after_operations(array_2)
puts "A soma total mínima do array B[] é: #{result_2}"

#example 3: [3, 6, 2, 8, 7, 5]
array_3 = [3, 6, 2, 8, 7, 5]
result_3 = min_sum_after_operations(array_3)
puts "A soma total mínima do array B[] é: #{result_3}"