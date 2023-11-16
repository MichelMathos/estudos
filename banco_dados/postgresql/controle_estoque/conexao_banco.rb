require 'pg'
require_relative 'criar_banco'


module ConexaoBanco
  DB_CONFIG = {
    dbname: 'controle_estoque',
    user: 'postgres',
    password: 'Trainee1@',
    host: 'localhost',
    port: 5432
  }.freeze

  def self.conectar 
    PG.connect(DB_CONFIG)
  end
end
