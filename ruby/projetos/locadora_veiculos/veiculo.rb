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

elsif choice == "M"
    motorcycle = Motorcycle.new("", "", "", 0)
    motorcycle.vehicleData
    puts "\n====| DADOS DO VEÍCULO LOCADO |===="
    puts "Veículo: Moto"
    motorcycle.display
else
    puts "Opção inválida!"
end