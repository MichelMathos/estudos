require_relative 'conexao_banco'

class ItemVenda
    attr_accessor :id_item_venda, :id_venda, :id_produto, :quantidade, :preco_unitario, :valor_total

    def initialize(id_item, id_venda, id_produto, quantidade, preco_unitario, valor_total)
        @id_item = id_item
        @id_venda = id_venda
        @id_produto = id_produto
        @quantidade = quantidade
        @preco_unitario = preco_unitario
        @valor_total = valor_total
    end

    def self.inserir(conn, id_venda, id_produto, quantidade, preco_unitario, valor_total)
        conn.exec_params("INSERT INTO itens_venda (id_venda, id_produto, quantiodade, preco_unitario, valor_total)
        VALUES ($1, $2, $3, $4, $5)
        RETURNING id_item_venda" [id_venda, id_produto, quantidade, preco_unitario, valor_total])
    end
end
