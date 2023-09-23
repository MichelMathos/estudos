# Acessando a classe mysql2 (gem mysql2)
require 'mysql2'

# Fazendo a conexão com o banco de dados onde db é a variável
# responsável por fazer a conexão
db = Mysql2::Client.new(:host => "localhost",
                        :username => "unifeg",
                        :password => "unifeg123",
                        :database => "unifeg_dsv")

# Utilizando a variável rs como um vetor que buscará os registros com 
# o método .query, seguido do comando SQL
rs = db.query("select * from client")

# Utilizamos o método .each para carregar o vetor rs com os registros,
# no qual row é a linha da tabela client.
rs.each do |row|
    puts row
end

puts ".. | fimn da aplicação"
