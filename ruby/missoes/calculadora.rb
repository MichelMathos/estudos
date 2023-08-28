puts "## CALCULADORA ##"

print "Informe o primeiro número: "
n1 = gets.chomp.to_i()

print "informe o segundo número: "
n2 = gets.chomp.to_i()

puts "Selecione a operação: "
puts "[1] - Adição \n[2] - Subtração \n[3] - Multiplicação \n[4] - Divisão \n[0]Sair"

op = gets.chomp.to_i()
#resultado = gets.to_f()

case op
    when 1
        resultado = n1 + n2
        puts "A soma entre o número #{n1} e #{n2} é #{resultado}."
    when 2
        resultado = n1 - n2
        puts "Subtraindo #{n1} de #{n2}, temos #{resultado}."
    when 3
        resultado = n1 * n2
        puts "O protudo de #{n1} multiplicado por #{n2} é #{resultado}."
    when 4
        resultado = n1 / n2
        resto = n1 % n2
        #puts "O quaociente de #{n1} por #{n2} é #{resultado.to_f 3}, e o resto é igual a #{resto}."
        puts "O quociente de #{n1} por #{n2} é %0.02f" % resultado.round(2) + ", e o resto é igual a #{resto}."




    when 5
        print "O programa será encerrado."        
    else
        puts "Não foi possível reconhecer a opção. Refaça-a novamente."
        puts "Selecione a operação: "
        puts "[1] - Adição \n[2] - Subtração \n[3] - Multiplicação \n[4] - Divisão \n[0]Sair"
    end
