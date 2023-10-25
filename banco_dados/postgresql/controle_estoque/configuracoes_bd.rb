require 'acrive_record'

# Configurações da conexão com o banco de dados
ActiveRecord::Base.establish_connection(
    adapter: 'postgresql'
    host: 'localhost'
    username: 'postgresql'
    password: 'Trainee1@'
    database: 'controle_estoque'
)