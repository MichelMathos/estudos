#Selecionar o maior valor deste hash e no final imprimir a key e o valor
number = {A: 10, B: 302, C:20 , D: 25, E: 15}

ultimo  = number.values.sort.last
 number.each do |value|
  if number.values == ultimo
    puts "#{key}, #{value}"
 end
end
