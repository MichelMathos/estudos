class Dog
    def name
        @name
    end

    def name= name #O sinal '=' tem de estar colado
        @name = name
    end
end

dog = Dog.new
dog.name = 'Marlon'
puts dog.name


