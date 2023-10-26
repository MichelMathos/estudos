class Usuario
    attr_acessor :id_usuario, :codigo, :senha, :nome, :cpf, :endereco, :telefone, :email
    
    def initialize(id_usuario, codigo, senha, nome, cpf, endereco, telefone, email)
        @id_usuario = id_usuario
        @codigo = codigo
        @senha = senha
        @nome = nome
        @cpf = cpf
        @endereco = endereco
        @telefone = telefone
        @email = email
    end
end
