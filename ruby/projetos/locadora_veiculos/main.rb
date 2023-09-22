require 'date'
require_relative 'locador'
require_relative 'veiculo'
require_relative 'pagamento'
require_relative 'locacao'

puts "\n====================== Locação de Veículos ======================"

# Coleta de informações do Locador (Pessoa Física ou Jurídica)
print "\nDigite seu nome: "
nome = gets.chomp
print "Digite seu endereço: "
endereco = gets.chomp
print "Digite seu telefone: "
telefone = gets.chomp
print "Digite seu e-mail: "
email = gets.chomp

escolha = nil

while escolha != "F" && escolha != "J"
  puts "\nVocê é uma Pessoa Física (F) ou Jurídica (J)?"
  escolha = gets.chomp.strip.upcase

  if escolha != "F" && escolha != "J"
    puts "\nOpção inválida. Insira 'F' para Pessoa Física ou 'J' para Pessoa Jurídica."
  end
end

if escolha == "F"
  print "Digite seu CPF: "
  cpf = gets.chomp

  locador = PessoaFisica.new(nome, endereco, telefone, email, cpf)
elsif escolha == "J"
  print "Digite seu CNPJ: "
  cnpj = gets.chomp

  locador = PessoaJuridica.new(nome, endereco, telefone, email, cnpj)
end

puts "\n====================== Dados do Veículo ======================"

# Coleta de informações do Veículo (Carro ou Moto)
print "\nDigite a categoria do veículo (carro/moto): "
categoria = gets.chomp
print "Digite a marca do veículo: "
marca = gets.chomp
print "Digite a cor do veículo: "
cor = gets.chomp
print "Digite o ano do veículo: "
ano = gets.chomp.to_i

veiculo = nil

if categoria.downcase == "carro"
  print "Digite a quantidade de portas do carro: "
  doors = gets.chomp.to_i

  veiculo = Carro.new(categoria, marca, cor, ano, doors)
elsif categoria.downcase == "moto"
  veiculo = Moto.new(categoria, marca, cor, ano)
else
  puts "\nCategoria de veículo inválida!"
  exit
end

puts "\n====================== Pagamento ======================"

# Escolha da forma de pagamento
puts "\nEscolha a forma de pagamento:"
puts "1. Débito"
puts "2. Crédito (até 6x com juros)"
puts "3. Dinheiro"
pagamento_escolha = gets.chomp.to_i

pagamento = nil

case pagamento_escolha
when 1
  pagamento = PagamentoComCartaoDeDebito.new(veiculo.valor_diaria)
when 2
  print "Número de parcelas (até 6x): "
  parcelas = gets.chomp.to_i
  pagamento = PagamentoComCartaoDeCredito.new(veiculo.valor_diaria, parcelas)
when 3
  pagamento = PagamentoEmDinheiro.new(veiculo.valor_diaria)
else
  puts "Opção de pagamento inválida!"
  exit
end

puts "\n====================== Detalhes da Locação ======================"

# Coleta de informações da locação
print "\nDigite a data de retirada (DD/MM/AAAA): "
data_retirada = gets.chomp
print "Digite a data de devolução (DD/MM/AAAA): "
data_devolucao = gets.chomp
print "Digite o valor inicial da locação: "
valor_inicial_locacao = gets.chomp.to_f

# Calcular o número de dias de locação
data_retirada = Date.strptime(data_retirada, "%d/%m/%Y")
data_devolucao = Date.strptime(data_devolucao, "%d/%m/%Y")
dias_de_locacao = (data_devolucao - data_retirada).to_i

# Calcular o valor total da locação
valor_total_locacao = valor_inicial_locacao + (dias_de_locacao * veiculo.valor_diaria)

# Aplicar juros no pagamento em crédito
if pagamento_escolha == 2
  valor_total_locacao += pagamento.calcula_juros
end

# Exibir os detalhes da locação
puts "\n====================== Resumo da Locação ======================"
puts "Locador:"
locador.exibir
puts "\nVeículo Locado:"
veiculo.exibir
puts "\nPagamento:"
pagamento.exibir
puts "\nData de Retirada: #{data_retirada.strftime("%d/%m/%Y")}"
puts "Data de Devolução: #{data_devolucao.strftime("%d/%m/%Y")}"
puts "Número de Dias de Locação: #{dias_de_locacao}"
puts "Valor Total da Locação: R$ #{valor_total_locacao}"
puts ""
