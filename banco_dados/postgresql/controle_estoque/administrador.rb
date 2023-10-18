require 'usuario'

class Administrador < Usuario
    def initialize(id_usuario, codigo, senha, nome, cpf, endereco, telefone, email)
        super(id_usuario, codigo, senha, nome, cpf, endereco, telefone, email)
    end

    # Método específico para administrador: Adicionar um novo usuário
    def adicionar_usuario(codigo, senha, nome, cpf, endereco, telefone, email)
        novo_usuario = Usuario.new(codigo, senha, nome, cpf, endereco, telefone, email)
        SistemaControleEstoque.instance.adicinar_usuario(novo_usuario)
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

    

end
