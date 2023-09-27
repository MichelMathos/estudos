#O usuário deverá informar 10 números, e ao final o sistema deverá imporimir na tela o mairo e o menor entre eles.
menor = Float::INFINITY
maior = -Float::INFINITY

for i in (1..10)
    print "Digite o #{i}º numero inteiro: "
    numero = gets.chomp.to_i

    if numero < menor
        menor = numero
    end

    if numero > maior
        maior = numero
    end
end

puts "O maior valor informadop é #{maior}."
puts "O menor valor informado é #{menor}."

