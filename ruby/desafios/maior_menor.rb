#O usuário deverá informar 10 números, e ao final o sistema deverá imporimir na tela o mairo e o menor entre eles.
menor = 0
menor = 0

for i in 1..10
    print "Digite o #{i} numero inteiro: "
    numero = gets.chomp.to_i

    if numero < menor
    end

    if numero > maior
        maior = numero
    end
end

puts "O maior valor informadop é #{maior}."
puts "O menor valor informado é #{menor}."

