require 'pg'

# Conexão com o banco de dados
conn = PG.connect(dbname: 'controle_estoque', user: 'postgres', password: 'Trainee1@')

class UsuariosController
    def initialize(conn)
        @conn = conn
    end

    def criar_usuario(nome, email)
        @conn.exec_params("INSERT INTO usuario (nome, email) VALUES ($1, $2)", [nome, email])
    end

    def listar_usuarios
        result = @conn.exec_params("SELECT * FROM usuarios")
        result.map { |row| { id: row['id'].to_i, nome: row['nome'], email: row['email']}}
    end

    def encontrar_usuario_por_id(id)
        result = @conn.exec_params("SELECT * FROM usuarios WHERE id = $1", ['id'])
        return nil if result.num_tuples.zero?

        row = result[0]
        { id: row['id'].to_i, nome:['nome'], email: row['email']}
    end

    def atualizar_usuario(id, nome, email)
        @conn.exec_params("UPDATE usuarios SET nome = $1, email = $2 WHERE id = $3 ", [nome, email, id])
    end

    def excluir_usuario(id)
        @conn.exec_params("DELETE FROM usuarios WHERE id = $1", [id])
    end
end



