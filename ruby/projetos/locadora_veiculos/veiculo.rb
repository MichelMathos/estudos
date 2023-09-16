class Vehicle
    attr_reader :brand :model :color :year

    def initialize(brand, model, color, year)
        @brand = brand
        @model = model
        @color = color
        @year = year
    end

    def display
        puts "Dados do veículo:"
        puts "Marca: #{@brand}"
        puts "Modelo: #{@model}"
        puts "Cor: #{color}"
        puts "Ano: #{year}"
    end
end

class Car
    attr_reader :category :door