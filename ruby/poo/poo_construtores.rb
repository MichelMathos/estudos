class Person
    def initialize(name, age)
        @name = name
        @age = age
    end

    def check
        puts "Instância da classe iniciada com os valores:"
        puts "Name = #{@name}"
        puts "Idade = #{@age}"
    end
end

person = Person.new('João', 12) #seria necessario utilizar apenas o '.new' se não fossemos passar os parâmetros '"@name' e '@age'"
person.check