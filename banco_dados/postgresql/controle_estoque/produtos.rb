require_relative 'conexao_banco'

class Produto
    att_accessor :id_produto, :nome, :marca, :preco, :quantidade

    def initialize(id_produto, nome, marca, preco, quantidade)
        @id_produto = id_produto
        @nome = nome
        @marca = marca
        @preco = preco
        @quantidade = quantidade
    end

    def self.inserir(conn, nome, marca, preco, quantidade)
        conn.exec_params("INSERT INTO produtos (nome, marca, preco, quantidade)
        VALUES ($1, $2, $3, $4)
        RETURNING id_produto", [nome, marca, preco, quantidade])
    end
end