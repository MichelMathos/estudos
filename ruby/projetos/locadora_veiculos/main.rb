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

escolha = nil

# Loop que ficará rodando enquanto não for inrformado se o locador é Pessoa Física ou Jurídica
while escolha != "F" && escolha != "J"
  print "\nÉ uma pessoa Física (F) ou Jurídica (J)? "
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
ano = gets.chomp.to_i

veiculo = nil

if categoria == "C"
  print "Digite a quantidade de portas do carro: "
  portas = gets.chomp.to_i

  veiculo = Carro.new( categoria, marca, cor, ano, portas )
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

pagamento = nil

while pagamento_escolha != 1 && pagamento_escolha !=2 && pagamento_escolha != 3
  puts "Opção inválida! Escolha uma das alternativas: n1. Débito \n2. Crédito (até 6X com juros de 2% a.m) \n3. Dinheiro"
  pagamento_escolha = gets.chomp.to_i
end

  case pagamento_escolha
when 1
  pagamento = PagamentoComCartaoDeDebito.new( veiculo.valor_diaria )
when 2
  print "Número de parcelas (até 6X): "
  parcelas = gets.chomp.to_i
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
print "\Digite a data de devolução (DD/MM/AAAA): "
data_devolucao = gets.chomp
print "\Digite o valor inicial da diária de locação: "
valor_inicial_locacao = gets.chomp.to_f

# Calculo de quantos dias serão locados
data_retirada  =Date.strptime( data_retirada, "%d/%m/%Y" )
data_devolucao = Date.strptime( data_devolucao, "%d/%m/%Y" )
dias_de_locacao = ( data_devolucao - data_retirada ).to_i

# Cálculo do valor total da locação
valor_total_locacao = valor_inicial_locacao + ( dias_de_locacao * veiculo.valor_diaria )

# Aplicando os juros no pagamento se crédito
if pagamento_escolha == 2
  valor_total_locacao += pagamento.calcula_juros
end

# Relatório da locação
puts "\n====================| Resumo da Locação |===================="
puts "Locador:"
locador.exibir
puts "\nVeículo Locado:"
veiculo.exibir
puts "\nPagamento:"
pagamento.exibir
puts "\nData de Retirada: #{ data_retirada.strftime( "%d/%m/%Y" )}"
puts "Data de Devolução: #{ data_devolucao.strftime( "%d/%m/%Y" )}"
puts "Número de Dias de Locação: #{ dias_de_locacao }"
puts ""

