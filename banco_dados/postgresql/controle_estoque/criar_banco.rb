require 'pg'

def criar_banco_de_dados(dbname, user, password, host, port)
    begin
        conn = PG.connect(dbname: 'postgres', user: 'user', password: 'password', host: 'host', port: 'port')
        conn.exec("CREATE DATABASE #{dbname}")
        puts "Banco de dados #{dbname} criado com sucesso."
    rescue PG::Erros => e
        puts "Erro ao criar o banco de dados #{dbname}: #{e.message}"
    ensure
        conn&.close
    end
end

def criar_tabelas(conn)
    begin
        conn.exec('
            CREATE TABLE IF NOT EXISTS usuarios (
                id SERIAL PRIMARY KEY,
                codigo VARCHAR(50) NOT NULL,
                senha VARCHAR(100) NOT NULL,
                nome VARCHAR(100) NOT NULL,
                cpf VARCHAR(14) NOT NULL,
                endereço TEXT,
                telefone VARCHAR(15),
                email VARCHAR(20) NOT NULL

            )')
