class Usuario
    attr_accessor :id_usuario, :codigo, :senha, :nome, :cpf, :endereco, :telefone, :email
    
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
    
    def self.encontrar_por_codigo_e_senha(codigo, senha)
        conn = PG.connect(dbname: 'nome_do_banco', user: 'usuario', password: 'senha')
        result = conn.exec_params("SELECT * FROM usuarios WHERE codigo = $1 AND senha = $2", [codigo, senha])
        conn.close 

        if result.num_tuples.zero?
            nil?
        else
            usuario_data = result[0]
            Usuario.new(
                usuario_data['id'].to_i,
                usuario_data['codigo'],
                usuario_data['senha'],
                usuario_data['nome'],
                usuario_data['cpf'],
                usuario_data['endereco'],
                usuario_data['telefone'],
                usuario_data['email']
            )
        end
    end
end

