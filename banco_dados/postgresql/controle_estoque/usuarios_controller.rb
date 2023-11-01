require 'pg'

# Conexão com o banco de dados
conn = PG.connect(dbname: 'controle_estoque', user: 'postgresql', password: 'Trainee1@')
