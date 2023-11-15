require 'pg'

module ConexaoBanco
    def self.conectar 
        PG.connect(dbname: dbname, user: user, password: password, host: host, port: port)
    end
end