require 'conexão_banco'
require_relative 'sistema_controle_estoque'

class ControleEstoque
    def initialize
        @sistema = SistemaControleEstoque.new
        @conn = ConexaoBanco.conectar 
        puts "Conectado ao Banco de dados #{ConexaoBanco::DB_CONFIG[:dbname]}"
    rescue PG::ConnectionBad
        puts "Banco de dados não encontrado. Criando banco de dados..."
        criar_banco_de_dados
        retry
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
    end

    def verificar_credenciais_admin(codigo, senha)
        result = @conn.exec_params("SELECT * FROM usuarios WHERE codigo = $1 AND senha = $2 AND papel = 'admin'", [codigo, senha])
        !result.num_tuples.zero?
      end
    
      def verificar_credenciais_vendedor(codigo, senha)
        result = @conn.exec_params("SELECT * FROM usuarios WHERE codigo = $1 AND senha = $2 AND papel = 'vendedor'", [codigo, senha])
        !result.num_tuples.zero?
      end
    
      def criar_banco_de_dados
        begin
          conn = PG.connect(dbname: 'postgres', user: ConexaoBanco::DB_CONFIG[:user], password: ConexaoBanco::DB_CONFIG[:password], host: ConexaoBanco::DB_CONFIG[:host], port: ConexaoBanco::DB_CONFIG[:port])
          conn.exec("CREATE DATABASE #{ConexaoBanco::DB_CONFIG[:dbname]}")
          puts "Banco de dados #{ConexaoBanco::DB_CONFIG[:dbname]} criado com sucesso."
        rescue PG::Error => e
          puts "Erro ao criar o banco de dados #{ConexaoBanco::DB_CONFIG[:dbname]}: #{e.message}"
        ensure
          conn&.close
        end
      end
    end
    
    # Inicializar o controle de estoque
    controle_estoque = ControleEstoque.new
    controle_estoque.iniciar
