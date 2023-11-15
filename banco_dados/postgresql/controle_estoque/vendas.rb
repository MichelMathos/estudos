require_relative 'conexao_banco'

class Venda
    attr_accessor :id_venda, :data_venda, :id_vendedor, :valor_total

    def initialize(id_venda, data_venda, id_vendedor, valor_total)
        @id_venda = id_venda
        @data_venda = data_venda
        @id_vendedor = id_vendedor
        @valor_total = valor_total
    end

    def self.inserir(conn, data_venda, id_vendedor, valor_total)
        conn.exec_params("INSERT INTO vendas (data_venda, id_Vendedor, valor_total)
        VALUES ($1, $2, $3)
        RETURNING id_venda", [data_venda, id_vendedor, valor_total])
    end
end
