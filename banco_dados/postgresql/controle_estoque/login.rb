require 'pg'
require_relative 'sistema_controle_estoque'

# Configurações do banco de dados
dbname = 'controle_estoque'
user = 'postgresql'
password = 'Trainee1@'
host = 'localhost'
port = 5432

# Tenta conectar ao banco de dados

begin
    conn = PG.connect(dbname: dbname, user: user, password: password, host: host)
    puts "Conectado ao banco de dados #{dbname}."
rescue PG::ConectionBad
    # Se a conexão falhar, o banco de dados pode não existir
    puts "Banco de dados não encontrado. Criando o banco de dados..."

    
rescue => exception
    
end

class ControleEstoque
    def initialize
        @sistema = SistemaControleEstoque.new
    end

    def iniciar
        puts "Bem-vindo ao Sistema de Controle de Estoque"
        loop do
            puts "Por favor, selecione seu papel (admin, vendedor, estoquista) ou 'sair' para sair: "
            papel = gets.chomp.downcase

            case papel
            when 'admin'
                admin_login
            when 'vendedor'
                vendedor_login
            when 'estoquista'
                estoquista_login
            when 'sair'
                puts "Saindo do sistema..."
                break
            else
                puts "Papel inválido. Tente novamente. "
            end
        end
    end

    private

    def admin_login
        # Lógica de login para o administrador
        puts "Digite o código de administrador: "
        codigo = gets.chomp
        puts "Digite a senha do administrador: "
        senha = gets.chomp

        # Verifica as credenciais do administrador
        if verificar_credenciais_admin(codigo, senha)
            administrador = Administrador.new("admin_id", codigo, senha, "Administrador", "123456789", "Endereço", "123-456-7890", "admin@admin.com")
            administrador.exibir_dashboard
        else
            puts "Credenciais inválidas."
        end
    end

    def vendedor_login
        # Lógica de login para o vendedor
        puts "Digite seu código de vendedor: "
        codigo = gets.chomp
        puts "Digite sua senha de vendedor: "
        senha = gets.chomp

        # Verifica as credenciais do vendedor
        if verificar_credenciais_vendedor(codigo, senha)
            vendedor = Vendedor.new("vendedor_id", codigo, senha, "Vendedor", "987654321", "Endereco", "987-654-3210", "vendedor@vendedor.com")
            vendedor.exibir_dashboard
        else
            puts "Credenciais de vendedor inválidas."
        end
    end

    # Funções que verificam as credenciais de usuário e administrador
    def verificar_credenciais_admin(codigo, senha)
        result = @conn.exec_params("SELECT * FROM usuarios WHERE codigo = $1 AND senha = $2 AND papel = 'admin'", [codigo, senha])
        return !resulkt.num_tuples.zero?
    end

    def verificar_credenciais_vendedor(codigo, senha)
        result = @conn.exec_params("SELECT * FROM usuarios where codigo = $1 AND senha = $2 AND papel = 'vendedor'", [codigo, senha])
        return !result.num_tuples.zero?
    end
end

# Inicializar o controle de estoque
controle_estoque= ControleEstoque.new
controle_estoque.iniciar

    