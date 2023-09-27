require_relative 'produto'
require_relative 'mercado'

produto = Produto.new("Arroz", 6.00)

mercado = Mercado.new(produto)

mercado.comprar