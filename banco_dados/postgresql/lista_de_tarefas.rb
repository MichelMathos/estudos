# 'require' tem a finalidade de fazer a ligação entre a aplicação e as classes da biblioteca requerida
# 'pg' é uma biblioteca para trabalhar com PostgreSQL no Ruby
# 'date' é uma biblioteca para manipular objetos com datas
# 'io/console' é uma biblioteca de sistema que interage com o console
# 'dotenv/load' é a biblioteca responsável pra o tratamento de dados sensíveis da conexão com o banco de dados
require 'pg'
require 'yaml'
require 'date'
require 'io/console'
require 'dotenv/load'

# Carrega as configurações do arquivo externo
config = YAML.load_file('config.yml')

# Estabelecendo a conexão com o banco de dados Postgresql
conn = PG.connect(
  dbname: ENV['DB_NAME'],
  user: ENV['DB_USER'],
  password: ENV['DB_PASSWORD'],
  host: ENV['DB_HOST']
)

# Método para criar ou modificar a tabela de tarefas
# 'conn' é a variável responsável por carregar a tabela de lista de tarefas
def create_or_update_tasks_table(conn)
  conn.exec('
    CREATE TABLE IF NOT EXISTS tasks (
      id SERIAL PRIMARY KEY,
      description TEXT,
      date DATE,
      time TIME
    );
    ALTER TABLE tasks ADD COLUMN IF NOT EXISTS time TIME;
  ')

  puts 'Tabela de tarefas criada ou atualizada com sucesso.'
end

# Método para adicionar uma tarefa
def add_task(conn, description, date, time)
  conn.exec_params('INSERT INTO tasks (description, date, time) VALUES ($1, $2, $3);', [description, date, time])
end

# Método para alterar/atualizar uma tarefa pela ID
def update_task(conn, id)
  puts "Digite a nova descrição da trefa: "
  new_description = gets.chomp

  begin
    puts "Digite a nova data da tarefa (no formato DD-MM-YYYY): "
    new_date_input = gets.chomp
    new_date = Date.strptime(new_date_input, '%d-%m-%Y').strftime('%y-%m-%d')
    
    puts "Digite o novo horário da tarefa (no formato HH:MM): "
    new_time = gets.chomp
    
    # 'rescue' é responsável pelo tratamento dos erros em conjunto com 'ArgumentError'
    conn.exec_params('UPDATE tasks SET description = $1, date = $2, time = $3 WHERE id = $4;', [new_description, new_date, new_time, id])
    puts "Tarefa atualizada com sucesso!"
  rescue ArgumentError => e
    puts "Erro ao atualizar tarefa: #{e.message}"
    puts "Certifique-se de digitar a data no formato correto (DD-MM-YYYY) e o horário no formato correto (HH:MM)."
  rescue PG::Error => e
    puts "Erro ao atualizar tarefa: #{e.message}"
  end
end

# Método para excluir um registro informando o ID
def delete_task(conn, id)
  conn.exec_params('DELETE FROM tasks WHERE id = $1;',[id])
  puts "Tarefa removida com sucesso!"
  conn.exec("COMMIT;") # Certifica que todas as alterações sejam confirmadas
rescue PG::Error => e
  puts "Erro ao remover tarefa: #{e.message}"
end

# Método para limpar o console de forma multiplataforma - 'io/console'
def clear_terminal
  if Gem.win_platform?
    system 'cls' # para Windows
  else
    system 'clear' # Código de escape ANSI para limpar terminal Linux/Mac
  end
end

# Método para obter todas as tarefas
def get_all_tasks(conn)
  clear_terminal
  puts "===== Tarefas Agendadas"
  conn.exec('SELECT * FROM tasks;')
end

# Método da chamada do menu
  # Solicita ao usuário escolher opções
  def show_menu
    puts""
    puts 'Escolha uma opção:'
    puts '1. Adicionar nova tarefa'
    puts '2. Alterar tarefa existente'
    puts '3. Deletar tarefa'
    puts '4. Sair'
  end

# Método que cria o menu interativo após limpar a tela com 'clear_terminal'
def main_menu(conn)
  loop do
    clear_terminal

    begin
      results = get_all_tasks(conn)
      results.each do |row|
        puts "Id: #{row['id']} Descrição: #{row['description']} Data: #{row['date']} Horário: #{row['time']}"
      end
    rescue PG::Error => e
        puts "Erro ao obter tarefas: #{e.message}"
    end

    show_menu
      
    choice = gets.chomp.to_i

    case choice
    when 1
      # Solicita ao usuário inserir a descrição da tarefa
      puts 'Digite uma tarefa (ou digite "exit" para sair): '
      description = gets.chomp

      if description.downcase =='exit'
        exit
      end

      # Solicita ao usuário inserir a data da tarefa (com tratamento de erros)
      begin
        puts 'Digite a data da tarefa (no formato DD-MM-YYYY): '
        date_input = gets.chomp

        # Converta a data para o formato YYY-MM-DD (formato do PostgreSQL)
        date = Date.strptime(date_input, '%d-%m-%Y').strftime('%Y-%m-%d')

        # Solicita ao usuário informar o horário da tarefa
        puts "Digite o horárop da tarefa (no formato HH:MM): "
        time = gets.chomp

        # Adicione a tarefa ao banco de dados
        add_task(conn, description, date, time)
        puts "===== Adicionada nova tarefa!"
      rescue ArgumentError => e
        puts "Erro ao adicionar tarefa: #{e.message}"
        puts "Certifique-se de digitar a data no formato correto (DD-MM-YYYY)."
      rescue PG::Error => e
        puts "Erro ao adicionar tarefa à lista de tarefas: #{e.message}"
      end

    when 2
      puts 'Digite o ID da tarefa que deseja alterar: '
      task_id_to_update = gets.chomp.to_i
      update_task(conn, task_id_to_update)

    when 3
      puts 'Digite o ID da tarefa que deseja remover: '
      task_id_to_delete = gets.chomp.to_i
      delete_task(conn, task_id_to_delete)

    when 4
      puts 'Saindo do programa.'
      exit

    else
      puts 'Opção inválida.'
    end
  end
end



# Obtendo todas as tarefas do banco de dados e imprimindo na tela
begin
  results = get_all_tasks(conn)
  results.each do |row|
    puts "ID: #{row['id']} Descrição: #{row['description']} Data: #{row['date']} Horário: #{row['time']}"
  end
rescue PG::Error => e
  puts "Erro ao obter tarefas: #{e.message}"
end

main_menu(conn)

# Fechando a conexão
conn.close
