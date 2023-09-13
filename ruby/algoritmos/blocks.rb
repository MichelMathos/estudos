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

#Conferindo se um metodo possui parametros do tipo bloco com a função 'block_given'?
puts "Conferindo se um método possui parametros do tipo bloco com a função 'block_given'?
"
def foo
    if block_given?
        #Call the block
        yield
    else
        puts "Sem parâmetros d tipo bloco."
    end
end

foo

foo { puts "Com parâmetros do tipo bloco." }

#Só é possível pasar um parâmetro por bloco
puts "Apenas um parâmetro bloco"
def foo (name, &block)
    @name = name
    block.call
end

foo ('Michel') { puts "Hellow #{@name}"}

#Também é possível um bloco ocupando várias linhas como parâmetro
puts "Bloco com várias linhas como parâmetro"
def foo (numbers, &block)
    if block_given?
        numbers.each do |key, value|
            block.call
        end
    end
end

numbers = [2 => 2, 3 => 3, 4 => 4]

foo(numbers) do |key, value|
    puts " #{key} * #{value} = #{key * value}."
    puts " #{key} + #{value} = #{key + value}."
    puts "---"
end


