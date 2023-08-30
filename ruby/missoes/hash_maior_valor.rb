#Selecionar o maior valor deste hash e no final imprimir a key e o valor
number = {A: 10, B: 302, C:20 , D: 25, E: 15}
a = 0
  number.each do |key, value| #percorrendo a hash
    a = value
    if value > a
        b = a
     end
     puts b
  end
