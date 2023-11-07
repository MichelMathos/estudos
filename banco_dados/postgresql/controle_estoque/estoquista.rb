class Estoquista < Usuario
    def initialize(id, usuario, codigo, senha, nome, cpf, endereco, telefone, email)
        super(id, codigo, senha, nome, cpf, endereco, telefone, email)
    end

    # Método específico para estoquista: Adicionar produto ao estoque
    def adicionar_produto_ao_estoque(id_protudo, quantidade)
        produto = SistemaControleEstoque.instance.encontrar_produto_por_id(id_produto)

        if produto
            produto.quantidade_em_estoque += quantidade
            atualizar_quantidade_em_estoque_no_bd(id_produto, produto.quantidade_em_estoque)
            puts "#{quantidade} unidades do produto #{produto.nome} adicionada ao estoque."
        else
            puts "Produto não encontrado."
        end
    end
    
    # Método específico para estoquista: Listar todos os produtos do estoque
    def listar_produtos_em_estoque
        produtos = SistemaControleEstoque.instance.listar_produtos_em_estoque

        if produtos.empty?
            puts "Não há produtos em estoque."
        else
            puts "Produtos em estoque:"
            produtos.each do |produto|
                puts "#{produto.id_produto} - #{produto.nome} (#{produto.quantidade_em_estoque} unidades)"
            end
        end
    end

    private

    def atualizar_quantidade_em_estoque_no_bd(id_produto, quantidade)
        conn = PG.connect(dbname: 'nome_do_banco', user: 'usuario', poassword: 'senha')
        conn.exec_params("UPDATE produtos SET quantidade_em_estoque = $1 WHERE id_produto = $2", [quantidade, id_produto])
    end
end