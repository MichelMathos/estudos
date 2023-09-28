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
#rs = db.query("select * from client")

# Utilizamos o método .each para carregar o vetor rs com os registros,
# no qual row é a linha da tabela client.
#rs.each do |row|
#    puts row
#end
#
#ou o código abaixo
#
#db.query("select * client").each do |row|
#    puts row
#end
#
#ou se preferir que os registros saiam com suas labels, faça:
db.query("select * from client").each do |row|
    puts "O nome #{row["first_name"]} #{row["last_name"]} tem #{row["age"]} anos."
end

# Inserindo registros no tabela Clients
#db.query("insert into client (first_name, last_name, age) values ('João', 'Silva', 34) ")
#db.query("insert into client (first_name, last_name, age) values ('Flávia', 'Maria', 12) ")
#
# Pode inserire desta forma. que é mais adequada:
v_nome  = 'Paulo'
v_snome = 'Silva'
v_age   = 34

#db.query("insert into client (first_name, last_name, age) values ('#{v_nome}', '#{v_snome}', #{v_age}) ")
puts ".. | fim da aplicação"

# Atualizando os registros com UPDATE

v_id  = 8
v_age = 41

db.query("update client set age = #{v_age} where id = #{v_id}")

db.query("select * from client").each do |row|
    puts "O nome #{row["first_name"]} #{row["last_name"]} tem #{row["age"]} anos."
end