# Definindo a superclasse Vehicle e abaixo seus atributos e funções
class Vehicle
    attr_reader :category, :brand, :color, :year

    def initialize(category, brand, color, year)
        @category = category
        @brand = brand
        @color = color
        @year = year
    end

    # Esta função tem o objetivo de coletar as informações do usuário
    def vehicleData
        print "Categoria: "
        @category = gets.chomp

        print "Marca: "
        @brand = gets.chomp

        print "Cor: "
        @color = gets.chomp

        print "Ano: "
        @year = gets.chomp.to_i
    end

    # Esta função tem o papel de mostrar na tela as informações coletadas
    def display
        puts "Categoria: #{@category}"
        puts "Marca: #{@brand}"
        puts "Cor: #{@color}"
        puts "Ano: #{@year}"
    end
end

# Definindo a classe Car como herdeira da superclasse Vehicle, acrescentando o atributo @doors
class Car < Vehicle
    attr_reader :doors

    def initialize(category, brand, color, year, doors)
        super(category, brand, color, year)
        @doors = doors
    end

    def display
        super 
        puts "Quantidade de portas: #{@doors}"
    end
end

# Definindo a classe Motorcycle como herdeira da superclasse Vehicle
class Motorcycle < Vehicle
    def initialize(category, brand, color, year)
        super(category, brand, color, year)
    end
end

# Definindo a variável daily_rate para torná-la acessível
daily_rate = case choice
            when "C" then 200.0
            when "M" then 50.0
            else 0.0
            end

puts "\nPREENCHA O FORMULÁRIO COM OS DADOS DO VEÍCULO:\n"

choice = nil

# Enquanto choice receber dados diferentes de C ou M, imprimir na tela a orientação correta
while choice != "C" && choice != "M"
    puts "O tipo de veículo é carro (C) ou moto (M)?"
    choice = gets.chomp.strip.upcase # Se acaso o usuário digite a letra em minúsculo, essa automatiocamente será convertidda em maiúsculo com a função .upcase

    if choice != "C" && choice != "M"
        puts "Opção inválida! Insira 'C' para Carro ou 'M' para Moto."
    end
end

# Se o usuário informou corretamente as letras C ou M, será possível digitar os demaios dados do veículo
# e posteriormente será impresso na tela as informações inseridas pelo usuário.
if choice == "C"
    print "Quantas portas? "
    doors = gets.chomp.to_i
    car = Car.new("", "", "", 0, doors)
    car.vehicleData
    puts "\n====| DADOS DO VEÍCULO LOCADO |===="
    puts "Veículo: Carro"
    car.display

    # Criando um objeto de pagamento em dinheiro para carro
    payment = Cash.new(choice)
    payment.display

     # Escolhendo a forma de pagamento
     puts "\nEscolha a forma de pagamento:"
     puts "1. Débito"
     puts "2. Crédito (até 6x com juros)"
     puts "3. Dinheiro"
     payment_choice = gets.chomp.to_i
 
     case payment_choice
     when 1
         payment = DebitCard.new(choice)
     when 2
         print "Número de parcelas até 6x): "
         installments = gets.chomp.to_i
         payment = CreditCard.new(choice, installments)
     when 3
         payment = Cash.new(choice)
     else
         puts "Opção de pagamento inválida!"
         return
     end
 
     payment.display

elsif choice == "M"
    motorcycle = Motorcycle.new("", "", "", 0)
    motorcycle.vehicleData
    puts "\n====| DADOS DO VEÍCULO LOCADO |===="
    puts "Veículo: Moto"
    motorcycle.display

    # Criando um objeto de pagamento em dinheiro para carro
    payment = Cash.new(choice)
    payment.display

   
     # Escolhendo a forma de pagamento
     puts "\nEscolha a forma de pagamento:"
     puts "1. Débito"
     puts "2. Crédito (até 6x com juros)"
     puts "3. Dinheiro"
     payment_choice = gets.chomp.to_i
 
     case payment_choice
     when 1
         payment = DebitCard.new(choice)
     when 2
         print "Número de parcelas até 6x): "
         installments = gets.chomp.to_i
         payment = CreditCard.new(choice, installments)
     when 3
         payment = Cash.new(choice)
     else
         puts "Opção de pagamento inválida!"
         return
     end
 
     payment.display
else
    puts "Opção inválida!"
end