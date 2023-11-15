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

            );
            
            CREATE TABLE IF NOT EXISTS produtos (
                id SERIAL PRIMARY KEY,
                nome VARCHAR(100) NOT NULL,
                marca VARCHAR(50),
                preco DECIMAL(10,2) NOT NULL,
                quantidade INTEGER NOT NULL
            );

            CREATE TABLE IF NOT EXISTS vendas (
                id SERIAL PRIMARY KEY,
                data_venda TIMESTAMP NOT NULL,
                id_vendedor INTEGER REFERENCES usuarios(id),
                valor_total DECIMAL(10,2) NOT NULL
            );

            CREATE TABLE IF NOT EXISTS itens_venda (
                id SERIAL PRIMARY KEY,
                id_venda INTEGER REFERENCES vendas(id),
                id_produto INTEGER NOT NULL,
                quantidade INTEGER NOT NULL,
                preco_unitario DECIMAL(10,2) NOT NULL,
                valor_total DECIMAL(10,2) NOT NULL
            );

            CREATE TABLE IF NOT EXISTS usuarios (
                id SERIAL PRIMARY KEY,
                nome VARCHAR(100) NOT NULL,
                email VARCHAR(100) NOT NULL
              );
        ')
        puts "Tabela criada com sucesso."
    rescue PG::ERROR => e
        puts "ERRO ao criar as tabelas #{e.message}"
    end
end

# Configurações do banco de dados
dbname = 'controle_estoque'
user = 'postgres'
password = 'Trainee1@'
host = 'localhost'
por = 5432

# Criar banco de dados
criar_banco_de_dados(dbname, user, password, host, port)

# Conectar ao banco de dados recém criado
conn = PG.connect(dbname: dbname, user: user, password: password, host: host, port: port)

# Criar tabelas
criar_tabelas(conn)

# Fechar a conexão com o banco de dados
conn&.close