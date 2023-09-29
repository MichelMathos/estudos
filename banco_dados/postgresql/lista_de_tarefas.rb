require 'pg'

# Método para criar a tabela de tarefas

def create_tasks_table(conn)
    conn.exec('CREATE TABLE IF NOT EXISTS tasks (id SERIAL PRIMARY, description TEXT);')
end

# Método para adicionar uma tarefa
def add_task(conn, descripton)
    conn.exec_params('INSERT INTO tasks (description) values ($1);', [description])
end

# Método para obter todas as tarefas
def get_all_task(conn)
    conn.exec('SELECT * FROM tasks;')
end



# Conecte-se ao banco de dados