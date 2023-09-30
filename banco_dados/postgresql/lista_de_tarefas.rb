require 'pg'

# Método para criar a tabela de tarefas
def create_tasks_table(conn)
    conn.exec('CREATE TABLE IF NOT EXISTS tasks (id SERIAL PRIMARY KEY, description TEXT);')
end

# Método para adicionar uma tarefa
def add_task(conn, description)
    conn.exec_params('INSERT INTO tasks (description) VALUES ($1);', [description])
end

# Método para obter todas as tarefas
def get_all_tasks(conn)
    conn.exec('SELECT * FROM tasks;')
end

# Conecte-se ao banco de dados
conn = PG.connect(dbname: 'create_task_table', user: 'postgres', password: 'Trainee1@', host: 'localhost')

# Crie a tabela de tarefas se não existir
create_tasks_table(conn)

# Solicite ao usuário inserir tarefas

loop do
    puts 'Digite uma tarefa (ou digite "exit" para sair): '
    description = gets.chomp

    break if description.downcase == 'exit'

    # Adicione a tarefa ao banco de dados
    begin
        add_task(conn, description)
    rescue PG::Error => e
        puts "Erro ao adiconar tarefa: #{e.message}"
    end
end


# Obtenha e imprima todas as tarefas
begin
    results = get_all_tasks(conn)
    results.each do |row|
        puts "ID: #{row['id']} Descrição: #{row['description']}"
    end
rescue PG::Error => e
    puts "Erro ao obter tarefas: #{e.message}"
end

# Feche a conexão
conn.close
