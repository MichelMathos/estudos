# 'require' importa a biblioteca de uma biblioteca
# 'pg' é uma biblioteca para trabalhar com PostgreSQL no Ruby
# 'date' é uma biblioteca para manipular objetos com datas

require 'pg'
require 'date'

# Método para criar ou modificar a tabela de tarefas

def create_or_update_tasks_table(conn)
    conn.exec('
      CREATE TABLE IF NOT EXISTS tasks (
        id SERIAL PRIMARY KEY,
        description TEXT,
        date DATE
      );
    ')
  end

# Método para adicionar uma tarefa
def add_task(conn, description, date)
    conn.exec_params('INSERT INTO tasks (description, date) VALUES ($1, $2);', [description, date])
end

# Método para obter todas as tarefas
def get_all_tasks(conn)
    conn.exec('SELECT * FROM tasks;')
end

# Estabelece uma conexão com o banco de dados PostgreSQL

conn = PG.connect(dbname: 'create_task_table', user: 'postgres', password: 'Trainee1@', host: 'localhost')

# Criação ou atualização da tabela de tarefas no PostgreSQL
create_or_update_tasks_table(conn)
puts "'Tabela de tarefas criada ou atualizada com sucesso."

# Solicite ao usuário inserir tarefas

loop do
    puts 'Digite uma tarefa (ou digite "exit" para sair): '
    description = gets.chomp

    break if description.downcase == 'exit'

    # solicite ao usuário inserir a data da tarefa (com tratamento de erros)
    begin
        puts 'Digite a data da tarefa (no formato DD-MM-YYYY): '
        date_input = gets.chomp
    
    # Converta a data para o formato YYY-MM-DD (formato do postresql)
        date = Date.strptime(date_input, '%d-%m-%Y').strftime('%Y-%m-%d')

    # Adicione a tarefa ao banco de dados
        add_task(conn, description, date)
        puts "===== Adicionada nova tarefa!"
    # Trata erros na conversão de data
    rescue ArgumentError => e
        puts "Erro ao adiconar tarefa: #{e.message}"
        puts "Certifique-se de digitar a data no formato correto (DD-MM-YYYY)."
    # Trata erros relacionados ao PostgreSQl
    rescue PG::Error => e
        puts "Erro ao adicionar tarefa no lista de tarefas: #{e.message}"
    end
end

# Obtenha todas as tarefas do banco de dados e imprime na tela
begin
    results = get_all_tasks(conn)
    results.each do |row|
        puts "ID: #{row['id']} Descrição: #{row['description']} Data: #{row['date']}"
    end
#Trata erros ao obter tarefas do banco de dados
rescue PG::Error => e
    puts "Erro ao obter tarefas: #{e.message}"
end

# Fechando a conexão
conn.close
