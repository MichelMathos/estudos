class Animal
    def pular
        puts 'Toing! tóim! bóim! póim!'
    end

    def dormir
        puts "ZzZzZzZzzz!"
    end
end

class Cachorro < Animal
    def latir
        puts 'Au au'
    end
end

cachorro = Cachorro.new
cachorro.pular
cachorro.dormir