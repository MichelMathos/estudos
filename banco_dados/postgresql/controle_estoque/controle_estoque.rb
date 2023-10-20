require 'pg'
require 'date'
require 'dotenv'
require 'yaml'
require 'io/console'

require_relative 'sistema_controle_estoque'
require_relative 'usuario'
require_relative 'administrador'
require_relative 'vendedor'
require_relative 'estoquista'

class ControleEstoque
    def initialize
        @sistema = SistemaControleEstoque.instance
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
        # Lógica de login paar o administrador (verifica código e senha)
        puts "Digite o código de administrador: "
        codigo = gets.chompputs "Digite a senha do administrador: "
        senha = gets.chomp

        # Verifica as credenciais (simplificado)
        if codigo == 'admin' && senha == 'admin'
            administrador = Administrador.new("admin_id", "admin", "admin", "Administrador", "123456789", "Endereço", "123-456-7890", "admin@admin.com")
            administrador.exibir_dashboard
        else
            puts "Credenciais inválidas."
        end
    end