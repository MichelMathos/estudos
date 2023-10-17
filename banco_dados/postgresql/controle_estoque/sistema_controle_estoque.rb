class SistemaControleEstoque
    attr_accessor :produtos, :fornecedores, :movimentacoes, :estoque, :usuarios, :tela_boas_vindas, :usuario_logado

    def initialize
        @produtos = []
        @fornecedores = []
        @movimentacoes = []
        @estoque = []
        @usuarios = []
        @tela_boas_vindas = TelaBoasVindas.new(self)
        @usuario_logado = nil
    end

end
