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

# Adicione algumas tarefas
add_task(conn, 'Fazer compras')
add_task(conn, 'Estudar Ruby')
add_task(conn, 'Praticar PostgreSQL')

# Obtenha e imprima todas as tarefas
results = get_all_tasks(conn)
results.each do |row|
    puts "ID: #{row['id']} Descrição: #{row['description']}"
end

# Feche a conexão
conn.close
