class SistemaControleEstoque
    attr_reader :usuarios, :produtos

    def initialize
        @usuarios = []
        @produtos = []
    end
    
    def self.instance
        @instance ||= SistemaControleEstoque.new
    end

    # Métodos para o gerenciamento de usuários
    def adicionar_usuario(usuario)
        @usuarios << usuario
    end

    def encontrar_usuario_por_id(id_usuario)
        @usuarios.find { |usuario| usuario.id_usuario == id_usuario }
    end

    def remover_usuario(usuario)
        @usuarios.delete(usuario)
    end

    # Métodos para gerenciar produtos
    def adicionar_produto(produto)
        @produtos << produto
    end

    def encontrar_produto_por_id(id_produto)
        @produtos.find { |produto| produto.id_produto == id_produto }
    end

    def produtos_em_estoque 
        @produtos.select { |produto| produto.quantidade_em_estoque > 0 }
    end
end
