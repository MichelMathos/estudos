class PapelUsuario
    attr_accessor :nome

    def initialize(nome)
        @nome = nome
    end

    def admin?
        @nome == 'admin'
    end

    def vendedor?
        @nome == 'vendedor'
    end

    def estoquista?
        @nome == 'estoquista'
    end
end
