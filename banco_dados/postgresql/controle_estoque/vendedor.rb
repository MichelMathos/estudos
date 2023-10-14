require_relative 'usuario'

class Vendedor < Usuario
    def initialize(id_usuario, codigo, senha, nome, cpf, endereco, telefone, email)
        super(id_usuario, codigo, senha, nome, cpf, endereco, email)
    end

end

