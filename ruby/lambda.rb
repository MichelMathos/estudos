first_lambda = lambda { puts "my first lambda"}
first_lambda.call
first_lambda.call

#ou poderá substituir o método 'lambda' por -> , que é uma sintaxe mais agradável

primer_lambda = -> {puts "my primer lambda"}
primer_lambda.call
primer_lambda.call

#Uma lambda também pode receber parâmetros
new_lambda = -> (names) {names.each {|name| puts name}}
names = ["João", "Maria", "Pedro"]
new_lambda.call(names)

#É possível uma lambda com multiplas linhas
my_lambda = lambda do |numbers|
    index = 0
    puts 'Número atual + proximo número.'
    numbers.each do |numbers|
        return if numbers[index] == numbers.last
        puts "( #{numbers[index]}) + (#{numbers[index + 1]})"
        index += 1
    end
end
numbers = [1, 2, 3, 4]
my_lambda.call(numbers)

#É possível passar mais de um lambda como parâmetro normal
def foo (one_lambda, two_lambda)
    one_lambda.call
    two_lambda.call
end
one_lambda = -> {puts "my first lambda"}
two_lambda = -> {puts "mai second lambda"}

foo(one_lambda, two_lambda)