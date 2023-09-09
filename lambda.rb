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
