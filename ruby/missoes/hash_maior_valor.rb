#Selecionar o maior valor deste hash e no final imprimir a key e o valor
a = 0
number = {A: 10, B: 302, C:20 , D: 25, E: 15}

  number.each do |key, value| #percorrendo a hash
    b = key
    if b > a 
        print key, value
    end
  end