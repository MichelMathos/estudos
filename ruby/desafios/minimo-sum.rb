def min_sum_after_operations(array)
    min_val = array.min
    total_sum = min_val * (array.length -1)
    total_sum
end

#example 1: [3,4]
array_1 = [3,4]
result_1 = min_sum_after_operations(array_1)
puts "The total sum os array B[] is: #{result_1}"

#example 2: [2, 4, 1, 3]
array_2 = [2, 4, 1, 3]
result_2 = min_sum_after_operations(array_2)
puts "The total sum of array B[] is: #{result_2}"
