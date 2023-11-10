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
