require_relative 'usuario'

class Vendedor < Usuario
    def initialize(id_usuario, codigo, senha, nome, cpf, endereco, telefone, email)
        super(id_usuario, codigo, senha, nome, cpf, endereco, email)
        @vendas =[] # Lista para armazenar as vendas realizads pelo vendedor
    end

    # Método específico para vendedor: Realizar venda
    def realizar_venda(id_produto, quantidade)
        produto = SistemaControleEstoque.instance.encontrar_produto_por_id(id_produto)

        if produto && produto.quantidade_em_estoque >= quantidade
            venda = { produto: produto, quantidade: quantidade, data: Time.now}
            @venda << venda

            # Atualiza a quantidade em estoque do produto
            produto.quantidade_em_estoque -= quantidade

            puts "Venda realizada com sucesso!"

        elsif produto.nil?
            puts "Protudo não encontrado."
        else
            puts "Quantidade em estoque insuficiente."
        end
    end

    # Método específico para vendedor: Listar suas vendas
    def listar_vendas
        if @vendas.empty?
            puts "Você ainda não realizou nenhuma venda."
        else
            puts "Suas vendas:"
            @vendas.each_with_index do |venda, index|
                puts "#{index + 1}. #{vendas[:produto].nome} - #{venda[:quantidade]} unidades - #{venda[:data]}"
            end
        end
    end
end


