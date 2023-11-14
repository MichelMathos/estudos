require 'pg'

def conectar_banco(dbname, user, password, host, port)
    PG.connect(dbname: dbname, user: user, password: password, host: host, port: port)
end