require 'date'
require_relative 'locador'
require_relative 'veiculo'
require_relative 'pagamento'
require_relative 'locacao'

# Seção de coleta das informações do Locador (Pessoa Física ou Jurídica)
puts "\n====================| LOCAÇÃO DE VEÍCULOS |===================="

print "\nInforme o nome do locador: "
nome = gets.chomp
print "Digite o endereço: "
endereco = gets.chomp
print "Digite o telefone (xx xxxxxxxxx): "
telefone = gets.chomp
print "Digite o e-mail: "
email = gets.chomp

escolha = nill

# Loop que ficará rodando enquanto não for inrformado se o locador é Pessoa Física ou Jurídica
while escolha != "F" && escolha != "J"
  puts "\n É uma pessoa Física (F) ou Jurídica (J)? "
  escolha = gets.chomp.strip.upcase

  if escolha != "F" && escolha != "J"
    puts"\nOpção inválida! Insira 'F' para Pessoa Física ou 'J'para Pessoa Jurídica."
  end
end

if escolha == "F"
  print "Digite o CPF: "
  cpf = gets.chomp

  locador = PessoaFisica.new( nome, endereco, telefone, email, cpf )
elsif escolha == "J"
  print "Digite o CNPJ: "
  cnpj = gets.chomp

  locador  = PessoaJuridica.new( nome, endereco, telefone, email, cnpj )
end

# Seção de coleta das informações do veículo (Carro ou Moto)
puts "\n====================| Dados do Veículo |===================="
