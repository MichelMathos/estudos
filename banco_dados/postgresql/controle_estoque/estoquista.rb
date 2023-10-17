require_relative 'usuario'
class Estoquista < Usuario
    def initialize(id, usuario, codigo, senha, nome, cpf, endereco, telefone, email)
        super(id_usuario, codigo, senha, nome, cpf, endereco, telefone, email)
    end

end
