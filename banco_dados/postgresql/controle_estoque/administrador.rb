class Administrador < Usuario
    def initialize(id_usuario, codigo, senha, nome, cpf, endereco, telefone, email)
        super(id, codigo, senha, nome, cpf, endereco, telefone, email)
    end

    # Método específico para administrador: Adicionar um novo usuário
    def adicionar_usuario(codigo, senha, nome, cpf, endereco, telefone, email)
        @conn = PG.connect(dbname: 'controle_estoque', user: 'postgres', password: 'Trainee1@')
        conn.exec_params(
            "INSERT INTO usuarios (codigo, senha, nome, cpf, endereco, telefone, email, papel) VALUES (#$1, $2, $3, $4, $5, $6, $7, $8)",
            [codigo, senha, nome, cpf, endereco, telefone, email, 'admin']
        )
        conn.close 
    end

    # Método específico para admnistrador: Listar todos os usuários
    def listar_usuarios
        usuarios.each do |usuario|
            puts "#{usuario.id_usuario} - #{usuario.nome} (#{usuario.class})"
        end
    end

    # Método específico para administrador: Adicionar novo produto
    def adicionar_produto(nome, descricao, prec_unitario, fornecedor)
        novo_produto = Produto.new(nome, descricao, preco_unitario, fornecedor)
        SistemaControleEstoque.instance.adicinar_protudo(novo_produto)
    end

    # Método específico para administrador: Listar todos os produtos
    def listar_produtos
        produtos = SistemaControleEstoque.instance.produtosprodutos.each do |produto|
            puts "#{produto.id_usuario} - #{produto.nome} (#{produto.descricao})"
        end
    end

    # Método específico para administrador: Exibir dashboard
    def exibir_dashboard
        loop do
            puts "Bem-vindo, Administrador #{nome}!"
            puts "1. Adicioonar Usuário"
            puts "2. Listar Usuários"
            puts "3. Atualizar Usuário"
            puts "4. Deletar Usuário"
            puts "5. Adicionar Produto"
            puts "6. Listar Produtos"
            puts "7. Atualizar Produto"
            puts "8. Deletar Produto"
            puts "0 . Sair"

            escolha = gets.chomp.to_i

            case escolha
            when 1
                adicionar_usuario_dashboard
            when 2
                listar_usuarios
            when 3
                puts "Digite o ID do usuário a ser atualizado: "
                id_usuario = gets.chomp.to_i 
                atualizar_usuario(id_usuario)
            when 4
                puts "Digite o ID do usuário a ser deletado: "
                id_usuario = gets.chomp.to_i 
                deletar_usuario(id_usuario)
            when 5
                adicionar_produto_daschboard
            when 6
                listar_produtos
            when 7
                puts "Digite o ID do produto a ser atualizado: "
                id_produto = gets.chomp.to_i 
                atualizar_produto(id_produto)
            when 8
                puts "Digite o iD do produto a ser deletado"
                id_produto = gets.chomp.to_i
                deletar_produto(id_produto)
            when 0
                puts "Saindo do sistema"
                break
            when
                puts "Opção inválida. Tente novamente"
            end
        end
    end
end
