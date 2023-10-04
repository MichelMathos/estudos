# 'require' importa a biblioteca de uma biblioteca
# 'pg' é uma biblioteca para trabalhar com PostgreSQL no Ruby
# 'date' é uma biblioteca para manipular objetos com datas
#  'io/console' é uma biblioteca de sistema que interage com o console
require 'pg'
require 'date'
require 'io/console'

# Método para criar ou modificar a tabela de tarefas
# 'conn' é a variável responsável por carregar a tabela de lista de tarefas
def create_or_update_tasks_table(conn)
  conn.exec('
    CREATE TABLE IF NOT EXISTS tasks (
      id SERIAL PRIMARY KEY,
      description TEXT,
      date DATE
    );
    ALTER TABLE tasks ADD COLUMN IF NOT EXISTS date DATE;
  ')

  puts 'Tabela de tarefas criada ou atualizada com sucesso.'
end

# Método para adicionar uma tarefa
def add_task(conn, description, date)
  conn.exec_params('INSERT INTO tasks (description, date) VALUES ($1, $2);', [description, date])
end

# Método para limpar o console de forma multiplataforma - 'io/console
def clear_terminal
  if Gem.win_platform?
    system 'cls' # para Windows
  else
    print "\e[2J\e[f" # Código de escape ANSI para limpar terminal Linux/Mac
  end
end

    # Método para obter todas as tarefas
def get_all_tasks(conn)
  clear_terminal
  puts "===== Tarefas Agendadas"
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

    # Converta a data para o formato YYY-MM-DD (formato do PostgreSQL)
    date = Date.strptime(date_input, '%d-%m-%Y').strftime('%Y-%m-%d')

    # Adicione a tarefa ao banco de dados
    add_task(conn, description, date)
    puts "===== Adicionada nova tarefa!"
  rescue ArgumentError => e
    puts "Erro ao adicionar tarefa: #{e.message}"
    puts "Certifique-se de digitar a data no formato correto (DD-MM-YYYY)."
  rescue PG::Error => e
    puts "Erro ao adicionar tarefa à lista de tarefas: #{e.message}"
  end
end

# Obtenha todas as tarefas do banco de dados e imprima na tela
begin
  results = get_all_tasks(conn)
  results.each do |row|
    puts "ID: #{row['id']} Descrição: #{row['description']} Data: #{row['date']}"
  end
rescue PG::Error => e
  puts "Erro ao obter tarefas: #{e.message}"
end

# Fechando a conexão
conn.close
