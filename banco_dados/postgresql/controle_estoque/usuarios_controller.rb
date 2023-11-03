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
