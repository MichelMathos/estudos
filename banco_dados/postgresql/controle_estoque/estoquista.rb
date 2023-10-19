require_relative 'usuario'

class Estoquista < Usuario
    def initialize(id, usuario, codigo, senha, nome, cpf, endereco, telefone, email)
        super(id_usuario, codigo, senha, nome, cpf, endereco, telefone, email)
    end

    # Método específico para estoquista: Adicionar produto ao estoque
    def adicionar_produto_ao_estoque(id_protudo, quantidade)
        produto = SistemaControleEstoque.instance.encontrar_produto_por_id(id_produto)

        if produto
            produto.quantidade_em_estoque += quantidade
            puts "#{quantidade} unidades do produto #{produto.nome} adicionada ao estoque."
        else
            puts "Produto não encontrado."
        end
    end
    




end
