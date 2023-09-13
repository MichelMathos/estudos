class User
    def add(name)
        @name = name
        puts "User adicionados."
        hello
    end

    def hello
        puts "Seja bem vindo, #{@name}"
    end
end

user = User.new
user.add('João')
