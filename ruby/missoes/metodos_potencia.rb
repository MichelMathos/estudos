def potencia(base, expoente)
    p = base**expoente
    return puts "O produto da potência é #{p}."
end

print "Informe o valor da base: "
b = gets.chomp.to_i

print "\Informe o valor do expoente: "
e = gets.chomp.to_i

potencia(b,e)