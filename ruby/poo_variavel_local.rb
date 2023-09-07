def foo
    # Pode ser definida como local ou _local

    local = "Local é acessada apenas dentro deste método \n"
    print local
end

foo

puts "o valor da variável local 1: "
puts local #é possível que o sistma acuse que a variável 'local' não exista ou não imprima nada.
#Isso acontece por que a variável 'local' não existe fora da função 'foo'.
#No entanto, quando 'foo' for chamada será impresso na tela o seu valor.
