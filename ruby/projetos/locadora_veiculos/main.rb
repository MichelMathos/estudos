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

print "\nÉ Carro 'C' ou Moto 'M'? "
categoria = gets.chomp.strip.upcase
print "Digite a marca do veículo: "
marca = gets.chomp
print "Digite a cor do veículo: "
cor = gets.chomp
print "Digite o ano do veículo: "
ano = gets.chomp_i

veiculo = nill

if categoria == "C"
  print "Digite a quantidade de portas do carro: "
  portas = gets.chomp_i

  veiculo = Carro.new( categoria, marca, cor, cor ano, portas )
elsif categoria == "M"
  veiculo = Moto.new( categoria, marca, cor, ano)

else
  puts "\nCategoria de veículo inválida"
  exit
end

# Seção das informações sobre a forma de pagamento
puts "\n====================| Pagamento |===================="
puts "\nEscolha a forma de pagamento: \n1. Débito \n2. Crédito (até 6X com juros de 2% a.m) \n3. Dinheiro"
pagamento_escolha = gets.chomp.to_i

pagamento = nill

case pagamento_escolha
when 1
  pagamento = PagamentoComCartaoDeDebito.new( veiculo.valor_diaria )
when 2
  print "Número de parcelas (até 6X): "
  parcelas = gets.chomp_i
  pagamento = PagamentoComCartaoDeCredito.new( veiculo.valor_diaria, parcelas )
when 3
  pagamento = PagamentoEmDinheiro.new( veiculo.valor_diaria )
else
  puts "Opção de pagamento inválida!"
  exit
end

# Seção de coleta das informações sobre datas e calculos das diárias
puts "\n====================| Detalhes da Locação |===================="
print "\nDigite a data de retirada (DD/MM/AAAA): "
data_retirada = gets.chomp


