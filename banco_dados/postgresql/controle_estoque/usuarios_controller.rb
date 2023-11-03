require 'pg'

# Conexão com o banco de dados
conn = PG.connect(dbname: 'controle_estoque', user: 'postgresql', password: 'Trainee1@')

# Criando a tabela "usuarios" no banco de dados
conn.exec(<<-SQL)
    CREATE TABLE IF NOT EXISTS usuarios (
        id SERIAL PROMARY KEY,
        nome VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL
    )
SQL

class UsuariosController
    def initialize(conn)
        @conn = conn
    end

    def criar_usuario(nome, email)
        @con.exec_params("INSERT INTO usuario (nome, email) VALUES ($1, $2)", [nome, email])
    end

    def listar_usuarios
        result = @conn.exec_params("SELECT * FROM usuarios")
        result.map { |row| { id: row['id'].to_i, nome: row['nome'], email: row['email']}}
    end

    