=begin
    Dados dois arrays a[] e b[] do mesmo tamanho.
    tarefa é encontrar a soma mínima de dois elementos de forma que eles pertençam a arrays 
    diferentes e não estejam no mesmo índice em seus arrays.
=end

def minSum(a, b)
    #Ordena os arrays a e b em ordem crescente
    a.sort!
    b.sort!
  
    #inicializa a soma mínima como infinito
    min_sum = Float::INFINITY
  
    #Percorre os arrays a e b
    (0...a.length).each do |i|
      (0...b.length).each do |j|
        # Se os elementos não estão no mesmo índice, calcula a soma
        if i != j
          current_sum = a[i] + b[j]

          #Atualiza a soma mínma se a soma atual for menor
          min_sum = [min_sum, current_sum].min
        end
      end
    end
  
    return min_sum
  end
  
  # Exemplo de uso:
  a = [5, 4, 13, 2, 1]
  b = [2, 3, 4, 6, 5]
  
  resultado = minSum(a, b)
  puts resultado # Saída: 4
  
