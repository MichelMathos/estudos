require 'usuario'

class Administrador < Usuario
    def initialize(id_usuario, codigo, senha, nome, cpf, endereco, telefone, email)
        super(id_usuario, codigo, senha, nome, cpf, endereco, telefone, email)
    end

end
