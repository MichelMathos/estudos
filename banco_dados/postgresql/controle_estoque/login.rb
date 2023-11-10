require 'pg'
require_relative 'sistema_controle_estoque'

# Configurações do banco de dados
DB_CONFIG ={
    dbname: 'controle_estoque',
    user: 'postgres',
    password: 'Trainee1@',
    host: 'localhost',
    port: 5432
}.freeze

conn = nil
# Tenta conectar ao banco de dados
begin
    conn = PG.connect(DB_CONFIG)
    puts "Conectado ao banco de dados #{DB_CONFIG[:dbname]}."
rescue PG::ConnectionBad
    puts "Banco de dados não encontrado. Criando o banco de dados..."
    conn = PG.connect(dbname: 'postgres', user: user, password: password, host: host, port: port)
    conn.close
    criar_banco_de_dados(conn, DB_CONFIG[:dbname])
    conn = PG.connect(BD_CONFIG)
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
        return !result.num_tuples.zero?
    end

    def verificar_credenciais_vendedor(codigo, senha)
        result = @conn.exec_params("SELECT * FROM usuarios WHERE codigo = $1 AND senha = $2 AND papel = 'vendedor'", [codigo, senha])
        return !result.num_tuples.zero?
    end
end

def criar_banco_de_dados(conn,dbname)
    begin
        conn.exec("CREATE DATABASE #{dbname}")
        puts "Banco de dados #{dbname} criado com sucesso."
    rescue PG::ERROR => e
        puts "Erro ao criar o banco de dados #{dbname}: #{e.message}"
    end
end

# Inicializar o controle de estoque
controle_estoque = ControleEstoque.new
controle_estoque.iniciar
