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

# Conecte-se ao banco de dados
conn = PG.connect(dbname: 'create_task_table', user: 'postgres', password: 'Trainee1@', host: 'localhost')

# Crie ou atualize a tabela de tarefas
create_or_update_tasks_table(conn)

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
    rescue ArgumentError => e
        puts "Erro ao adiconar tarefa: #{e.message}"
        puts "Certifique-se de digitar a data no formato correto (DD-MM-YYYY)."
    rescue PG::Error => e
        puts "Erro ao adicionar tarefa no lista de tarefas: #{e.message}"
    end
end

# Obtenha e imprima todas as tarefas
begin
    results = get_all_tasks(conn)
    results.each do |row|
        puts "ID: #{row['id']} Descrição: #{row['description']} Data: #{row['date']}"
    end
rescue PG::Error => e
    puts "Erro ao obter tarefas: #{e.message}"
end

# Feche a conexão
conn.close
