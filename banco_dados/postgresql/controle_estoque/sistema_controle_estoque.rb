require 'pg'

class SistemaControleEstoque
    attr_reader :usuarios, :produtos

    def initialize
        @usuarios = []
        @produtos = []
        @conn = PG.connect(dbname: 'controle_estoque', user: 'postgresql', password: 'Trainee1@')
    end
    
    def self.instance
        @instance ||= SistemaControleEstoque.new
    end

    # Métodos para o gerenciamento de usuários
    def adicionar_usuario(usuario)
        @usuarios << usuario
    end

    def encontrar_usuario_por_id(id_usuario)
        result = @conn.exec_params("SELECT * FROM usuarios WHERE id = $1", [id_usuarios] )
        return nil if result.num_tuples.zero?

        usuario_data = result[0]
        Usuario.new(
            usuario_data['id'].to_i,
            usuario_data['codigo'],
            usuario_data['senha'],
            usuario_data['nome'],
            usuario_data['cpf'],
            usuario_data['endereco'],
            usuario_data['telefone'],
            usuario_data['email']
        )
    end

    def remover_usuario(usuario)
        @usuarios.delete(usuario)
    end

    # Métodos para gerenciar produtos
    def adicionar_produto(produto)
        @produtos << produto
    end

    def encontrar_produto_por_id(id_produto)
       result = @conn.exec_params("SELECT * FROM produtos WHERE id = $1",[id_produto])
       return nil if result.num_tuples.zero?

       produto_data = result[0]
       Produto.new(
        produto_data['id'].to_i,
        produto_data['nome'],
        produto_data['descricao'],
        produto_data['preco'].to_f,
        produto_data['fornecedor']
       )
    end

    def produtos_em_estoque 
        @produtos.select { |produto| produto.quantidade_em_estoque > 0 }
    end
end
