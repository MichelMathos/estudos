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
    