class Vehicle
    attr_reader :brand :model :color :year

    def initialize(category, brand, model, color, year)
        @category = category
        @brand = brand
        @model = model
        @color = color
        @year = year
    end

    def display
        puts "Dados do veículo:"
        puts "Categoria: #{category}"
        puts "Marca: #{@brand}"
        puts "Modelo: #{@model}"
        puts "Cor: #{color}"
        puts "Ano: #{year}"
    end
end

class Car
    attr_reader :doors

    def initialize(category, brand, model, color, year, doors)
        super(category, brand, model, color, year)
        @door = doors
    end

    def display
        super
        puts "Portas: #{doors}"
    end
end

class motorcycle
    def initialize(category, brand, model, color, year)
        super(category, brand, model, color, year)
    end

    def display
        super
    end
end

    puts "\nPREENCHA O FORMULÁRIO COM OS DADOS DO VEÍCULO:\n"
    
    puts "Categoria: "
    category = gets.chomp

    puts "Marca: "
    brand = gets.chomp

    puts "Modelo: "
    model = gets.chomp

    puts "Cor: "
    color = gets.chomp

    puts "Ano: "
    year = gets.chomp

    choice = nill

    while choice != "C" && choice != "M"
        puts "O tipo de veículo é carro (C) ou moto (M)?"
        choice = gets.chomp.strip.upcase

        if choice != "C" && choice != "M"
            puts "Opção inválida! Insira 'C' para Carro ou 'M' para Moto."
        end
    end

    if choice == "C"
        print "Quantas portas?"
        doors = gets.chomp

        car = Car.new(category, brand, model, color, year)
        car.display
    elsif choice == "M"
        motorcycle = Motorcycle.new(category, brand, model, color, year)
        motorcycle.display

    else
        puts "Opção inválida!"
    end

