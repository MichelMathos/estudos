require 'conexao_banco'

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
        conn = ConexaoBanco.conectar

        begin
            result = conn.exec_params("SELECT * FROM usuarios WHERE codigo = $1 AND senha = $2", [codigo, senha])
        
            if result.num_tuples.zero?
                nil
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
    ensure
        conn&.close
    end
end

