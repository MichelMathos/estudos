5.times {puts "Exec the blocks"} #Irá executar 5 vezes a instrução que estiver dentro dos colchetes.

#ou receber parâmetros
puts "blocks com parâmetros:"
sum = 0
numbers = [5, 10, 5]
numbers.each { |number| sum += number } 
puts sum

#ou utilizar blocks em múltiplas linhas
puts "blocks em múltiplas linhas:"
foo = {2 => 3, 4 => 5} #criado um hash

foo.each do |key, value|
    puts "key = #{key}"
    puts "value = #{value}"
    puts "key * value = #{key * value}"
    puts '---'
end

#um blocks também pode ser passado como argumento implícito de um método.
#depois, para chamar dentro do método o bloco que foi passado utilize o comando 'yield'
puts "passando blocks como argumento implícito"
def foo
    # Call the block
    yield
    yield
end

foo { puts "Exec the block"} #esta linha não precisa ser declarada em 'def foo', pois o comando 'yield' fará a chamada
