# Define a lambda que capitaliza o nome
capitalizar_lambda = ->(nome) { puts nome.capitalize }

# Define o método capitalize_nome que chama a lambda
def capitalize_nome(lambda)
  lambda.call
end

# Chama o método capitalize_nome passando a lambda como argumento
capitalize_nome(-> {
  nomes = ["joão", "maria"]
  nomes.each { |nome| capitalizar_lambda.call(nome) }
})