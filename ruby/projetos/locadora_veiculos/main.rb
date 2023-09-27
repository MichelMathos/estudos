require 'date'
require_relative 'locador'
require_relative 'veiculo'
require_relative 'pagamento'
require_relative 'locacao'

# Função para coletar e validar a categoria do veículo
def obter_categoria_veiculo
  categoria = nil
  loop do
    print "\nÉ Carro 'C' ou Moto 'M'? "
    categoria = gets.chomp.strip.upcase
    break if categoria == 'C' || categoria == 'M'
    puts "Categoria de veículo inválida. Escolha 'C' para Carro ou 'M' para Moto."
  end
  categoria
end

# Função para coletar e validar a forma de pagamento
def obter_forma_pagamento
  forma_pagamento = nil
  loop do
    puts "\nEscolha a forma de pagamento: "
    puts "1. Débito"
    puts "2. Crédito (até 6X com juros de 2% a.m)"
    puts "3. Dinheiro"
    forma_pagamento = gets.chomp.to_i
    break if [1, 2, 3].include?(forma_pagamento)
    puts "Opção inválida! Escolha 1 para Débito, 2 para Crédito ou 3 para Dinheiro."
  end
  forma_pagamento
end

# Função para coletar e validar o número de parcelas para pagamento com cartão de crédito
def obter_numero_parcelas
  parcelas = 1
  loop do
    print "Número de parcelas (até 6X): "
    parcelas = gets.chomp.to_i
    break if (1..6).include?(parcelas)
    puts "Número de parcelas inválido! Escolha um número de 1 a 6."
  end
  parcelas
end

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

escolha = nil

# Loop que ficará rodando enquanto não for informado se o locador é Pessoa Física ou Jurídica
while escolha != "F" && escolha != "J"
  print "\nÉ uma pessoa Física (F) ou Jurídica (J)? "
  escolha = gets.chomp.strip.upcase

  if escolha != "F" && escolha != "J"
    puts "\nOpção inválida! Insira 'F' para Pessoa Física ou 'J' para Pessoa Jurídica."
  end
end

if escolha == "F"
  print "Digite o CPF: "
  cpf = gets.chomp

  locador = PessoaFisica.new(nome, endereco, telefone, email, cpf)
elsif escolha == "J"
  print "Digite o CNPJ: "
  cnpj = gets.chomp

  locador = PessoaJuridica.new(nome, endereco, telefone, email, cnpj)
end

# Seção de coleta das informações do veículo (Carro ou Moto)
puts "\n====================| Dados do Veículo |===================="
categoria = obter_categoria_veiculo
print "Digite a marca do veículo: "
marca = gets.chomp
print "Digite a cor do veículo: "
cor = gets.chomp
print "Digite o ano do veículo: "
ano = gets.chomp.to_i

veiculo = nil

if categoria == "C"
  print "Digite a quantidade de portas do carro: "
  portas = gets.chomp.to_i

  veiculo = Carro.new(categoria, marca, cor, ano, portas)
elsif categoria == "M"
  veiculo = Moto.new(categoria, marca, cor, ano)
else
  puts "\nCategoria de veículo inválida"
  exit
end

# Seção das informações sobre a forma de pagamento
forma_pagamento = obter_forma_pagamento

# Cálculo do valor total da locação
valor_inicial_locacao = veiculo.valor_diaria
parcelas = obter_numero_parcelas

if forma_pagamento == 2
  pagamento = PagamentoComCartaoDeCredito.new(veiculo.valor_diaria, parcelas)
else
  pagamento = forma_pagamento == 1 ? PagamentoComCartaoDeDebito.new(veiculo.valor_diaria) : PagamentoEmDinheiro.new(veiculo.valor_diaria)
end

# Seção de coleta das informações sobre datas e cálculos das diárias
puts "\n====================| Detalhes da Locação |===================="
print "\nDigite a data de retirada (DD/MM/AAAA): "
data_retirada = gets.chomp
print "\Digite a data de devolução (DD/MM/AAAA): "
data_devolucao = gets.chomp

# Cálculo de quantos dias serão locados
data_retirada = Date.strptime(data_retirada, "%d/%m/%Y")
data_devolucao = Date.strptime(data_devolucao, "%d/%m/%Y")
dias_de_locacao = (data_devolucao - data_retirada).to_i

# Cálculo do valor total da locação
valor_total_locacao = valor_inicial_locacao * dias_de_locacao

# Aplicando os juros no pagamento se for pagamento com cartão de crédito
if forma_pagamento == 2
  valor_total_locacao += pagamento.calcula_juros(dias_de_locacao)
end

# Relatório da locação
system("clear") || system("cls")
puts ""
puts "\n====================| Resumo da Locação |===================="
puts "Locador:"
locador.exibir
puts "\nVeículo Locado:"
veiculo.exibir
puts "\nPagamento:"
pagamento.exibir
puts "\nData de Retirada: #{data_retirada.strftime("%d/%m/%Y")}"
puts "Data de Devolução: #{data_devolucao.strftime("%d/%m/%Y")}"
puts "Número de Dias de Locação: #{dias_de_locacao}"
puts "Valor Total da Locação: R$#{valor_total_locacao}"
puts ""
