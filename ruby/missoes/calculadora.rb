puts "## CALCULADORA ##"

print "Informe o primeiro número: "
n1 = gets.chomp.to_f()

print "informe o segundo número: "
n2 = gets.chomp.to_f()

puts "Selecione a operação: "
puts "[1] - Adição \n[2] - Subtração \n[3] - Multiplicação \n[4] - Divisão \n[0]Sair"

op = gets.chomp.to_i()

case op
    when 1
        resultado = n1 + n2
        puts "A soma entre o número #{n1} e #{n2} é: %.2f" % resultado
    when 2
        resultado = n1 - n2
        puts "Subtraindo #{n1} de #{n2}, temos: %.2f" % resultado
    when 3
        resultado = n1 * n2
        puts "O protudo de #{n1} multiplicado por #{n2} é: %.2f" % resultado
    when 4
        resultado = (n1*0.1) / (n2*0.1) #a forma que encontrei para imprimir os números decimais, caso contrário acrescenta 00 após o ponto flutuante
        resto = n1 % n2
        puts "O quociente de #{n1} por #{n2} é %.1f" % resultado + ", e o resto é igual a #{resto}."

    when 5
        print "O programa será encerrado."        
    else
        puts "Não foi possível reconhecer a opção. Refaça-a novamente."
        puts "Selecione a operação: "
        puts "[1] - Adição \n[2] - Subtração \n[3] - Multiplicação \n[4] - Divisão \n[0]Sair"
    end
