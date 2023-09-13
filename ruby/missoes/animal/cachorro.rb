#Aqui, a classe 'cachorro' está herdando os métodos da classe 'Animal'
#no entanto, só irá funcionar sem erro se na hora de ser requerida, a classe pai já estiver
#sendo requerida no programa de chamada de classes.
class Cachorro < Animal
    def latir
        puts 'Au au'
    end
end
