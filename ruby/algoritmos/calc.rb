#print -> imprime na tela em linha única
print "Digite o primeiro número: "
#gets -> recebe a entrada do teclado
#.to_i converte string para inteiro
number1 = gets.chomp.to_i
print "Digite o segundo número: "
number2 = gets.chomp.to_i
addition = number1 + number2
#puts -> imprime na tela inserindo o cactere especial "enter"
puts "O resultado da adição é #{addition}."